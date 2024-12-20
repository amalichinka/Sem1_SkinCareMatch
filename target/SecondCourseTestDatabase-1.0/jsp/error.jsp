<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Oops! Something Went Wrong</title>
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
            margin-bottom: 20px;
        }

        .error-container {
            text-align: center;
            width: 1024px;
            background-color: #F1F4EE;
            padding: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .error-image {
            max-width: 70%;
            height: 500px;
            width: 500px;
            border-radius: 10px;
            margin-bottom: 20px;
            border: 2px solid #89AC76;
        }

        .error-text {
            font-size: 1.5em;
            font-family: Arial, sans-serif;
            color: #3d5c3a;
            margin: 20px;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 1.3em;
            color: #fff;
            background-color: #89AC76;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
        }

        a:hover {
            background-color: #607942;
        }
    </style>
</head>
<body>
<div class="error-container">
    <h1>Oh no... Something went wrong</h1>
    <img class="error-image" src="/images/error_image.png"
         alt="Error Image">
    <p class="error-text">
        <%= request.getParameter("err") != null ? request.getParameter("err") : "Try again!" %>
    </p>
    <a href="/">Go Back</a>
</div>
</body>
</html>
