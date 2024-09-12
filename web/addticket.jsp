<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="model.Person"%>
<!DOCTYPE html>
<html>
<head>
    <title>ข้อมูลที่บันทึก</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
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
        p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 15px;
        }
        p span {
            font-weight: bold;
            color: #555;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>ข้อมูลที่บันทึก</h2>
        <%
            Person person = (Person) session.getAttribute("person");
        %>
        <p><span>ชื่อ:</span> <%= person.getTicketName() %></p>
        <p><span>ประเภท:</span> <%= person.getTicketType() %></p>
        <p><span>นักร้อง:</span> <%= Arrays.toString(person.getSingers()) %></p>
        <p><span>จำนวน:</span> <%= person.getQuantity() %></p>
        <p><span>ราคา:</span> <%= person.getPrice() %></p>
        <a href='updateticket.jsp'>แก้ไขข้อมูลตั๋ว</a>
    </div>
</body>
</html>
