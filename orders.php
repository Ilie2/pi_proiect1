<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

include 'config-1.php';
session_start();

// Adaugă această secțiune pentru a te conecta la baza de date
$conn = mysqli_connect('localhost','root','','shop_db') or die('connection failed');

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Function to send email confirmation
function sendConfirmationEmail($email, $conn) {
    global $user_id; // Adaugă această linie pentru a folosi variabila globală $user_id

    $to = $email;  // Înlocuiește cu adresa de e-mail a destinatarului real
    $subject = 'Order Confirmation';

    // Fetch cart items for the user
    $cart_query = $conn->prepare("SELECT * FROM `cart` WHERE user_id = ?");
    $cart_query->bind_param("s", $user_id);
    $cart_query->execute();
    $cart_result = $cart_query->get_result();

    // Email body
    $message = "Thank you for your order!\n\n";
    $message .= "<table border='1'>
                    <tr>
                        <th>Product Name</th>
                        <th>Quantity</th>
                    </tr>";

                    while ($fetch_cart = $cart_result->fetch_assoc()) {
                     $message .= "<tr>
                                     <td>{$fetch_cart['name']}</td>
                                     <td>{$fetch_cart['quantity']}</td>
                                 </tr>";
                 
                     // Check if the 'product_table' key exists in the $fetch_cart array
                     if (isset($fetch_cart['product_table'])) {
                         $product_table = $fetch_cart['product_table'];
                         $update_stock = $conn->prepare("UPDATE `$product_table` SET stock = stock - ? WHERE id = ?");
                         $update_stock->bind_param("ii", $fetch_cart['quantity'], $fetch_cart['product_id']);
                         $update_stock->execute();
                     } else {
                         // Handle the case where 'product_table' key is not present in $fetch_cart
                         $message .= "Product table information missing for {$fetch_cart['name']}.";
                     }
                 }

    $message .= "</table>\n";

    // Calculate estimated delivery time (you can adjust this logic based on your business rules)
    $estimatedDeliveryTime = date('Y-m-d H:i:s', strtotime('+2 days')); // Example: Deliver within 2 days

    $message .= "Estimated delivery time: " . $estimatedDeliveryTime . "\n\n";
    $message .= "Thank you for shopping with us!";

    // Create a new PHPMailer instance
    $mail = new PHPMailer(true);

    try {
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'alexandrescudan19@gmail.com';
        $mail->Password = 'mysxgblaeeegreea';
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        $mail->setFrom('your_sender_email@example.com');  // Înlocuiește cu adresa ta de e-mail de expediere
        $mail->addAddress($to);

        $mail->isHTML(false);
        $mail->Subject = $subject;
        $mail->Body = $message;

        $mail->send();
        echo 'Email has been sent.';
    } catch (Exception $e) {
        echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
    }
}

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
} else {
    $user_id = '';
    header('location:user_login.php');
}

if (isset($_POST['order'])) {

    $name = $_POST['name'];
    $name = filter_var($name, FILTER_SANITIZE_STRING);
    $number = $_POST['number'];
    $number = filter_var($number, FILTER_SANITIZE_STRING);
    $email = $_POST['email'];
    $email = filter_var($email, FILTER_SANITIZE_STRING);
    $method = $_POST['method'];
    $method = filter_var($method, FILTER_SANITIZE_STRING);
    $address = 'flat no. ' . $_POST['flat'] . ', ' . $_POST['street'] . ', ' . $_POST['city'] . ', ' . $_POST['state'] . ', ' . $_POST['country'] . ' - ' . $_POST['pin_code'];
    $address = filter_var($address, FILTER_SANITIZE_STRING);
    $total_products = $_POST['total_products'];
    $total_price = $_POST['total_price'];

    $check_cart = $conn->prepare("SELECT * FROM `cart` WHERE user_id = ?");
    $check_cart->bind_param("s", $user_id);
    $check_cart->execute();
    $check_cart_result = $check_cart->get_result();

    if ($check_cart_result->num_rows > 0) {

        $insert_order = $conn->prepare("INSERT INTO `orders` (user_id, name, number, email, method, address, total_products, total_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        $insert_order->bind_param("sssssssd", $user_id, $name, $number, $email, $method, $address, $total_products, $total_price);

        if (!$insert_order->execute()) {
            $message[] = 'Error inserting order: ' . $conn->error;
        } else {
            $emailConfirmationResult = sendConfirmationEmail($email, $conn);

            if ($emailConfirmationResult === true) {
                $message[] = 'Order placed successfully. Confirmation email sent.';
            } else {
                $message[] = $emailConfirmationResult;
            }

            $delete_cart = $conn->prepare("DELETE FROM `cart` WHERE user_id = ?");
            $delete_cart->bind_param("s", $user_id);

            if (!$delete_cart->execute()) {
                $message[] = 'Error deleting cart: ' . $conn->error;
            } else {
                $message[] = 'Order placed successfully';
            }
        }

    } else {
        $message[] = 'Your cart is empty';
    }

    // Display messages from the insertion and deletion process
    foreach ($message as $msg) {
        echo $msg . '<br>';
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>orders</title>
   
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style-0.css">
   <link rel="stylesheet" type="text/css" href="css/scrollbar.css">

</head>
<body>
   
<?php include 'components/header.php'; ?>

<section class="checkout-orders">

   <form action="" method="POST">

   <h3>your orders</h3>

      <div class="display-orders">
      <?php
         $cart_query = mysqli_query($conn, "SELECT * FROM `cart` WHERE user_id = '$user_id'") or die('query failed');
         $grand_total = 0;
         $cart_items[] = '';
         if(mysqli_num_rows($cart_query) > 0){
            while($fetch_cart = $fetch_cart = mysqli_fetch_assoc($cart_query)){
               $cart_items[] = $fetch_cart['name'].' ('.$fetch_cart['price'].' x '. $fetch_cart['quantity'].') - ';
               $total_products = implode($cart_items);
               $grand_total += ($fetch_cart['price'] * $fetch_cart['quantity']);
      ?>
         <p> <?= $fetch_cart['name']; ?> <span>(<?= $fetch_cart['price'].' Lei'.'/- x '. $fetch_cart['quantity']; ?>)</span> </p>
      <?php
            }
         }else{
            echo '<p class="empty">your cart is empty!</p>';
         }
      ?>
         <input type="hidden" name="total_products" value="<?= $total_products; ?>">
         <input type="hidden" name="total_price" value="<?= $grand_total; ?>" value="">
         <div class="grand-total">grand total : <span><?= $grand_total; ?> Lei</span></div>
      </div>

      <h3>place your orders</h3>

      <div class="flex">
         <div class="inputBox">
            <span>your name :</span>
            <input type="text" name="name" placeholder="enter your name" class="box" maxlength="20" required>
         </div>
         <div class="inputBox">
            <span>your number :</span>
            <input type="number" name="number" placeholder="enter your number" class="box" min="0" max="9999999999" onkeypress="if(this.value.length == 10) return false;" required>
         </div>
         <div class="inputBox">
            <span>your email :</span>
            <input type="email" name="email" placeholder="enter your email" class="box" maxlength="50" required>
         </div>
         <div class="inputBox">
            <span>payment method :</span>
            <select name="method" class="box" required>
               <option value="cash on delivery">cash on delivery</option>
               <option value="credit card">credit card</option>
               <option value="paypal">paypal</option>
            </select>
         </div>
         <div class="inputBox">
            <span>number of the street:</span>
            <input type="text" name="flat" placeholder="e.g. flat number" class="box" maxlength="50" required>
         </div>
         <div class="inputBox">
            <span>street :</span>
            <input type="text" name="street" placeholder="e.g. street name" class="box" maxlength="50" required>
         </div>
         <div class="inputBox">
            <span>city :</span>
            <input type="text" name="city" placeholder="e.g. Timisoara" class="box" maxlength="50" required>
         </div>
         <div class="inputBox">
            <span>state :</span>
            <input type="text" name="state" placeholder="e.g. Timis" class="box" maxlength="50" required>
         </div>
         <div class="inputBox">
            <span>country :</span>
            <input type="text" name="country" placeholder="e.g. Romania" class="box" maxlength="50" required>
         </div>
         <div class="inputBox">
            <span>pin code :</span>
            <input type="number" min="0" name="pin_code" placeholder="e.g. 123456" min="0" max="999999" onkeypress="if(this.value.length == 6) return false;" class="box" required>
         </div>
      </div>

      <input type="submit" name="order" class="btn <?= ($grand_total > 1)?'':'disabled'; ?>" value="place order">

   </form>

</section>

<?php include 'components/footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>
