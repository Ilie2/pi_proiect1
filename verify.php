<?php
include 'config-1.php';
session_start();

$message = ''; // Mesajul va fi afișat în funcție de rezultatul verificării

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Dacă s-a trimis un formular POST, verificăm codul introdus
    if (isset($_POST['code'])) {
        $code = $_POST['code'];

        // Verificăm dacă codul există în baza de date
        $result = mysqli_query($conn, "SELECT * FROM `email_verification` WHERE verification_code = $code");

        if (mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);

            // Marcăm utilizatorul ca fiind verificat în tabelul user_form
            mysqli_query($conn, "UPDATE `user_form` SET is_verified = 1 WHERE id = {$row['user_id']}");

            // Redirecționăm către o pagină specifică după verificare cu succes
            header("Location: login-1.php"); // Schimbă "index.php" cu pagina dorită
            exit();
        } else {
            // Afișăm un mesaj de eroare dacă codul nu este valid
            $message = 'Invalid verification code.';
        }
    } else {
        // Afișăm un mesaj de eroare dacă nu s-a furnizat niciun cod
        $message = 'Verification code not provided.';
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Verification</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .message {
            color: #e74c3c;
            margin-bottom: 10px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        button {
            background-color: #3498db;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #2980b9;
        }

        p {
            margin-top: 10px;
            font-size: 14px;
        }

        a {
            color: #3498db;
            text-decoration: none;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="message">
            <?php echo $message; ?>
        </div>
        <form method="post" action="">
            <label for="code">Enter Verification Code:</label>
            <input type="text" id="code" name="code" required>
            <button type="submit">Verify</button>
        </form>
        <p>Already have an account? <a href="login-1.php">Login now</a></p>
    </div>
</body>

</html>

