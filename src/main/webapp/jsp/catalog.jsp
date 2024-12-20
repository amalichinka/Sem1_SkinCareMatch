<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Catalog</title>
  <style>
    header {
      background-color: #89AC76;
      color: #ffffff;
      width: 100%;
      padding: 20px;
      text-align: center;
      font-size: 1.8em;
    }

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

    h1 {
      text-align: center;
      color: #607942;
      margin-bottom: 20px;
    }

    .test-result {
      background-color: #fff;
      border: 1px solid #ddd;
      border-radius: 10px;
      padding: 15px;
      margin-bottom: 20px;
      text-align: center;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .products-container {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
      gap: 20px;
      margin: 0 auto;
      max-width: 1200px;
    }

    .product-card {
      background-color: #fff;
      border: 1px solid #ddd;
      border-radius: 10px;
      padding: 15px;
      text-align: center;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      transition: transform 0.2s ease;
    }

    .product-card:hover {
      transform: translateY(-5px);
    }

    .product-card img {
      max-width: 100px;
      height: auto;
      border-radius: 8px;
      margin-bottom: 10px;
    }

    .product-card h3 {
      color: #333;
      font-size: 1.2em;
      margin-bottom: 10px;
    }

    .product-card p {
      color: #607942;
      font-size: 1.1em;
      margin-bottom: 15px;
    }

    .product-card button {
      background-color: #607942;
      color: #fff;
      border: none;
      padding: 10px 15px;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .product-card button:hover {
      background-color: #4e6134;
    }

    a.button-skin-test {
      text-align: center;
      margin-top: 20px;
      padding: 15px 30px;
      text-decoration: none;
      font-size: 1.2em;
      display: inline-block;
      color: #fff;
      background-color: #89AC76;
      border-radius: 5px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
      transition: background-color 0.3s ease;
    }

    a.button-skin-test:hover {
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
<header>Shopping Catalog</header>
<nav>
  <a href="/catalog">Catalog</a>
  <a href="/basket">Basket</a>
  <a href="/about_us">About Us</a>
  <a href="/logout">Logout</a>
</nav>
<h1>Catalog</h1>
<%--для теста--%>
<c:if test="${not empty skinType}">
  <div class="test-result">
    <p>Your skin type: <strong>${skinType}</strong></p>
    <p>Based on your skin type, we recommend exploring the following products!</p>
  </div>
</c:if>

<%--список продуктов--%>
<div class="products-container">
  <%-- правильный список продуктов --%>
  <c:forEach var="product" items="${products}">
    <div class="product-card">
      <img src="${product.imageUrl}" alt="${product.name}" />
      <h3>${product.name}</h3>
      <p>${product.price} $</p>
      <form action="/basket" method="post">
        <input type="hidden" name="action" value="add">
        <input type="hidden" name="productId" value="${product.id}">
        <button type="submit">Add to Basket</button>
      </form>

    </div>
  </c:forEach>
</div>
<a class="button-skin-test" href="/skin-test">Take the Skin Type Test</a>
<footer>&copy; 2024 SkinCareMatch</footer>
</body>
</html>
