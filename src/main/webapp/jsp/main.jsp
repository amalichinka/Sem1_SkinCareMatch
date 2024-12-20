<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Main Page</title>
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

        .news-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
            width: 90%;
            max-width: 800px;
            margin-bottom: 20px;
        }

        .news-item {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
        }

        .news-item:hover {
            transform: scale(1.02);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .news-item h2 {
            color: #607942;
            font-size: 1.5em;
            margin-bottom: 10px;
        }

        .news-item p {
            color: #555;
            font-size: 1em;
            line-height: 1.5;
        }

        footer {
            background-color: #89AC76;
            color: #ffffff;
            text-align: center;
            padding: 10px 0;
            width: 100%;
            margin-top: auto;
        }

        .news-item-expanded {
            max-width: 10™0%;
            width: 100%;
            padding: 40px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            transition: box-shadow 0.3s ease;
        }

    </style>

    <script>
        function expandNews(newsId) {
            let newsItem = document.getElementById(newsId);
            newsItem.classList.toggle('news-item-expanded');
        }
    </script>
</head>
<body>
<header>Welcome to SkinCareMatch</header>
<nav>
    <a href="/catalog">Catalog</a>
    <a href="/basket">Basket</a>
    <a href="/about_us">About Us</a>
    <a href="/logout">Logout</a>
</nav>

<div class="news-container">
    <div class="news-item" id="news1" onclick="expandNews('news1')">
        <h2>Акция! Уход за телом и лицом - по суперцене!</h2>
        <p>Не упустите шанс купить любимые средства для ухода за телом и лицом со скидкой!
            Лимитированная серия по выгодной цене — идеальное время для обновления косметички.
            Акция ограничена по времени, не пропустите!</p>
    </div>
    <div class="news-item" id="news2" onclick="expandNews('news2')">
        <h2>Набор для сияющей кожи и защиты от холода!</h2>
        <p>Подготовьте свою кожу к суровым зимним условиям!
            В нашем новом наборе для ухода за кожей — увлажняющий крем,
            питательная маска и защитный лосьон, которые сохранят вашу кожу мягкой,
            эластичной и здоровой. Защитите свою красоту!</p>
    </div>
    <div class="news-item" id="news3" onclick="expandNews('news3')">
        <h2>Секрет безупречного тела!</h2>
        <p>Уникальные формулы, разработанные ведущими дерматологами,
            глубоко очищают кожу, улучшают кровообращение
            и заметно уменьшают появление несовершенств.
            Попробуйте уже сегодня!</p>
    </div>
    <div class="news-item" id="news4" onclick="expandNews('news4')">
        <h2>Новинка сезона!</h2>
        <p>Представляем революционный набор для мгновенного сияния кожи!
            Комбинированный уход с сывороткой, кремом и маской обеспечит вам
            гладкую, сияющую и увлажненную кожу уже после первого применения</p>
    </div>
</div>

<footer>&copy; 2024 SkinCareMatch</footer>
</body>
</html>
