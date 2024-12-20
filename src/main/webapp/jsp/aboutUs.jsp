<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About Us</title>
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
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            display: flex;
            justify-content: center;
            gap: 15px;
            padding: 10px 0;
            margin-bottom: 20px;
        }

        nav a {
            text-decoration: none;
            color: #89AC76;
            font-size: 1.2em;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        nav a:hover {
            background-color: #607942;
            color: white;
        }

        .about-us-image {
            max-width: 100%;
            max-height: 200px;
            margin: 30px 0;
        }

        h1 {
            color: #89AC76;
        }

        .creator-text {
            color: #555;
            font-style: italic;
        }

        a.subscribe-button {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            color: #fff;
            background-color: #89AC76;
            text-decoration: none;
            border-radius: 5px;
        }

         a:hover {
            background-color: #607942;
            color: #ffffff;
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
<header>About SkinCareMatch</header>
<nav>
    <a href="/catalog">Catalog</a>
    <a href="/basket">Basket</a>
    <a href="/about_us">About Us</a>
    <a href="/logout">Logout</a>
</nav>
<img class="about-us-image" src="/images/logo.png" alt="Logo" />
<h1>About Our Store</h1>
<p>Добро пожаловать в SkinCareMatch — место, где забота о коже становится проще.</p>
<h2>About the Creator</h2>
<p class="creator-text">"Я — студентка ИТИС, которая до последнего момента откладывала этот проект.
    Наслаждайтесь результатами бессонных ночей и ночного кофе..."</p>
<a class="subscribe-button" href="https://t.me/amallichinka">Subscribe</a>

<footer>&copy; 2024 SkinCareMatch</footer>
</body>
</html>
