<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up</title>
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
            justify-content: center;
            height: 100vh;
        }
        h1 {
            font-size: 2.5em;
            color: #89AC76;
            margin-bottom: 10px;
        }
        .form-container {
            width: 90%;
            max-width: 600px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        h2 {
            font-size: 1.2em;
            color: #4a4a4a;
            margin-bottom: 20px;
        }
        form {
            width: 100%;
        }
        label {
            font-size: 1em;
            display: block;
            color: #4a4a4a;
            text-align: left;
            margin-bottom: 8px;
            font-weight: bold;
        }
        input[type="email"],
        input[type="text"],
        input[type="password"] {
            width: calc(100% - 20px);
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1em;
            background-color: #fefefe;
        }
        input[type="submit"] {
            background-color: #89AC76;
            color: white;
            padding: 12px 20px;
            font-size: 1.2em;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #607942;
            transform: scale(1.05);
        }
        .footer {
            margin-top: 20px;
            font-size: 0.9em;
            color: #777;
        }
    </style>
</head>
<body>
<h1>Join Us Today!</h1>
<div class="form-container">
    <h2>Create Your Account</h2>
    <form action="/signUp" method="post">
        <label for="nickname">Nickname:</label>
        <input id="nickname" name="nickname" type="text" placeholder="your nickname" required/>

        <label for="email">Email:</label>
        <input id="email" name="email" type="email" placeholder="yourname@mail.com" required/>

        <label for="password">Password:</label>
        <input id="password" name="password" type="password" placeholder="your password" required/>

        <input type="submit" value="Sign Up"/>
    </form>
</div>
<div class="footer">
    Already have an account? <a href="/signIn" style="color: #607942;">Sign In</a>
</div>
</body>
</html>
