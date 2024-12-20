<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F1F4EE;
            color: #3d5c3a;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            height: 100vh;
        }

        h1 {
            font-size: 2.5em;
            color: #89AC76;
            margin: 20px;
        }

        .button-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
            margin-top: 20px;
        }

        a {
            display: inline-block;
            padding: 15px 30px;
            font-size: 1.3em;
            color: #fff;
            background-color: #89AC76;
            text-decoration: none;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
            text-align: center;
        }

        a:hover {
            background-color: #607942;
        }

        .greeting_image {
            max-width: 100%;
            max-height: 300px;
            margin: 30px 0;
        }
    </style>
</head>
<body>
<header>
    <img class="greeting_image" src="/images/logo.png" alt="Welcome Image">
    <h1>What would you like to do?</h1>
</header>
<main>
    <div class="button-container">
        <a href="/signUp">Sign Up with New Account</a>
        <a href="/signIn">Sign In with Existing Account</a>
    </div>
</main>
</body>
</html>
