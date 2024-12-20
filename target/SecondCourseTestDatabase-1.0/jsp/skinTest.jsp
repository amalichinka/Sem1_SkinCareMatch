<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Skin Type Test</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #F1F4EE;
            color: #3d5c3a;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        header {
            background-color: #89AC76;
            color: #ffffff;
            width: 100%;
            padding: 20px;
            text-align: center;
            font-size: 1.8em;
        }

        nav {
            background-color: #fff;
            display: flex;
            justify-content: center;
            width: 100%;
            padding: 10px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        nav a {
            text-decoration: none;
            color: #89AC76;
            font-size: 1.2em;
            padding: 10px 15px;
            border-radius: 5px;
            margin: 0 10px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        nav a:hover {
            background-color: #607942;
            color: #ffffff;
        }

        form {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 600px;
            text-align: left;
            margin-bottom: 20px;
        }

        form h2 {
            color: #607942;
            margin-bottom: 15px;
            text-align: center;
        }

        label {
            font-size: 1em;
            margin-top: 10px;
            display: block;
            color: #3d5c3a;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
            color: #333;
            font-size: 1em;
        }

        button {
            background-color: #89AC76;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            display: block;
            width: 100%;
            margin-top: 10px;
        }

        button:hover {
            background-color: #607942;
        }

        footer {
            background-color: #89AC76;
            color: #ffffff;
            text-align: center;
            padding: 10px 0;
            width: 100%;
            margin-top: auto;
        }
    </style>
</head>
<body>
<header>Skin Type Test</header>
<nav>
    <a href="/catalog">Catalog</a>
    <a href="/basket">Basket</a>
    <a href="/about_us">About Us</a>
    <a href="/logout">Logout</a>
</nav>
<form action="${pageContext.request.contextPath}/skin-test" method="post">
    <h2>Skin Type Test</h2>
    <label>How often does your skin get oily?</label>
    <select name="oily">
        <option value="1">Very often</option>
        <option value="2">Sometimes</option>
        <option value="3">Rarely</option>
        <option value="4">Never</option>
    </select>

    <label>How often do you get breakouts?</label>
    <select name="breakouts">
        <option value="1">Often</option>
        <option value="2">Sometimes</option>
        <option value="3">Rarely</option>
        <option value="4">Never</option>
    </select>

    <label>Do you feel skin tightness after washing your face?</label>
    <select name="tightness">
        <option value="1">Yes, always</option>
        <option value="2">Sometimes</option>
        <option value="3">Rarely</option>
        <option value="4">Never</option>
    </select>

    <label>How does your skin react to the sun?</label>
    <select name="sunReaction">
        <option value="1">Burns</option>
        <option value="2">Tans</option>
        <option value="3">Doesn't react</option>
        <option value="4">Don't know</option>
    </select>

    <button type="submit">Submit</button>
</form>
<footer>&copy; 2024 SkinCareMatch</footer>
</body>
</html>