<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign In</title>
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
        h2 {
            font-size: 1.2em;
            margin-bottom: 20px;
            color: #4a4a4a;
        }
        .form-container {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 30px;
            width: 80%;
            max-width: 500px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        label {
            font-size: 1.2em;
            color: #4a4a4a;
            display: block;
            margin: 15px 0 5px;
            text-align: left;
        }
        input[type="email"],
        input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            font-size: 1em;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #89AC76;
            color: #fff;
            font-size: 1.2em;
            border: none;
            border-radius: 5px;
            padding: 12px 20px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        input[type="submit"]:hover {
            background-color: #607942;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<div class="form-container">
    <h1>Welcome Back</h1>
    <h2>Sign In to Your Account</h2>
    <form action="${pageContext.request.contextPath}/signIn" method="post">
        <label for="email">Email:</label>
        <input id="email" name="email" type="email" placeholder="yourname@main.ru" required/>

        <label for="password">Password:</label>
        <input id="password" name="password" type="password" placeholder="your password" required/>

        <input type="submit" value="Sign In"/>
    </form>
</div>
</body>
</html>
