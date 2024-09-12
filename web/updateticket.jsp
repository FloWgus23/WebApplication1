<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="model.Person" %>
<!DOCTYPE html>
<html>
<head>
    <title>แก้ไขข้อมูลตั๋ว</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="checkbox"] {
            margin-right: 10px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .message {
            color: red;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>แก้ไขข้อมูลตั๋ว</h2>
        <% 
            Person person = (Person) session.getAttribute("person");
            if (person == null) {
        %>
            <p class="message">ไม่พบข้อมูลตั๋วในระบบการสั่งซื้อ</p>
        <% 
            } else {
        %>
        <form action="ticketServlet" method="post">
            <label for="ticketname">ชื่อ:</label>
            <input type="text" id="ticketname" name="ticketname" value="<%= person.getTicketName() != null ? person.getTicketName() : "" %>">
            
            <label for="tickettype">ประเภท:</label>
            <select name="tickettype" id="tickettype">
                <option value="VIP" <%= "VIP".equals(person.getTicketType()) ? "selected" : "" %>>VIP</option>
                <option value="Gold" <%= "Gold".equals(person.getTicketType()) ? "selected" : "" %>>Gold</option>
                <option value="Standard" <%= "Standard".equals(person.getTicketType()) ? "selected" : "" %>>Standard</option>
            </select>
            
            <label>นักร้อง:</label>
            <input type="checkbox" name="singer" value="DEPT" <%= person.getSingers() != null && Arrays.asList(person.getSingers()).contains("DEPT") ? "checked" : "" %>>DEPT<br/>
            <input type="checkbox" name="singer" value="MHUENPLOY" <%= person.getSingers() != null && Arrays.asList(person.getSingers()).contains("MHUENPLOY") ? "checked" : "" %>>MHUENPLOY<br/>
            <input type="checkbox" name="singer" value="DEASY" <%= person.getSingers() != null && Arrays.asList(person.getSingers()).contains("DEASY") ? "checked" : "" %>>DEASY<br/>
            <input type="checkbox" name="singer" value="SARAN" <%= person.getSingers() != null && Arrays.asList(person.getSingers()).contains("SARAN") ? "checked" : "" %>>SARAN<br/>
            <input type="checkbox" name="singer" value="CORNBOI" <%= person.getSingers() != null && Arrays.asList(person.getSingers()).contains("CORNBOI") ? "checked" : "" %>>CORNBOI<br/>
            <input type="checkbox" name="singer" value="TMD" <%= person.getSingers() != null && Arrays.asList(person.getSingers()).contains("TMD") ? "checked" : "" %>>TMD<br/>
            
            <label for="quantityname">จำนวน:</label>
            <input type="text" id="quantityname" name="quantityname" value="<%= person.getQuantity() != null ? person.getQuantity() : "" %>">
            
            <label for="pricename">ราคา:</label>
            <input type="text" id="pricename" name="pricename" value="<%= person.getPrice() != null ? person.getPrice() : "" %>">
            
            <input type="submit" value="บันทึก">
        </form>
        <% 
            }
            session.removeAttribute("person");
        %>
    </div>
</body>
</html>
