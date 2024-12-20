<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
  <title>Shopping Basket</title>
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

    .basket-container {
      width: 90%;
      max-width: 800px;
      display: flex;
      flex-direction: column;
      gap: 20px;
    }

    .basket-item, .total {
      background-color: white;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .basket-item h3 {
      margin: 0 0 10px;
      color: #4a4a4a;
      font-size: 1.5em;
    }

    .basket-item p {
      margin: 5px 0;
      color: #555;
    }

    .button {
      padding: 10px 20px;
      border-radius: 5px;
      border: none;
      cursor: pointer;
      font-size: 1em;
      transition: background-color 0.3s ease;
    }

    .button-remove {
      background-color: #607942;
      color: white;
    }

    .button-remove:hover {
      background-color: #4e6134;
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
  <script>
    document.addEventListener("DOMContentLoaded", function () {
      function calculateTotal() {
        const items = document.querySelectorAll(".basket-item");
        let total = 0;
        items.forEach(item => {
          const price = parseFloat(item.dataset.price);
          const quantity = parseInt(item.dataset.quantity);
          total += price * quantity;
        });
        document.getElementById("total-price").textContent = `$${total.toFixed(2)}`;
      }

      document.querySelectorAll(".button-remove").forEach(button => {
        button.addEventListener("click", function (event) {
          event.preventDefault();
          const cartItem = this.closest(".basket-item");
          cartItem.remove();
          calculateTotal();
        });
      });

      calculateTotal();
    });
  </script>
</head>
<body>
<header>Shopping Basket</header>
<nav>
  <a href="/catalog">Catalog</a>
  <a href="/basket">Basket</a>
  <a href="/about_us">About Us</a>
  <a href="/logout">Logout</a>
</nav>
<%--для вывода корзины--%>
<section class="basket-container">
  <c:forEach var="item" items="${basketItems}">
    <div class="basket-item" data-price="${item.price}" data-quantity="${item.quantity}">
      <div>
        <h3>${item.productName}</h3>
        <p>Price: $${item.price}</p>
        <p>Quantity: ${item.quantity}</p>
      </div>
      <form method="post" action="/basket">
        <input type="hidden" name="action" value="remove">
        <input type="hidden" name="product_id" value="${item.productId}">
        <button type="submit" class="button button-remove">Remove</button>
      </form>
    </div>
  </c:forEach>

  <div class="total">
    Total: <span id="total-price">$0.00</span>
  </div>
</section>

<footer>&copy; 2024 SkinCareMatch</footer>
</body>
</html>
