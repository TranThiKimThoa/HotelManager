
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill</title>
        <link rel="license" href="https://www.opensource.org/licenses/mit-license/">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bill.css">

    </head>
    <body>

        <header>
            <h1>Invoice</h1>
            <address >
                <h3 style="font-weight: bold;">MODERN HOTEL</h3>
                <p>03 Tran Quoc Toan, Phuoc Ninh, Da Nang, Viet Nam.</p>
                <p>Holine : 1900 1010</p>
            </address>
            <span><img alt="" src="${pageContext.request.contextPath}/resources/images/bill.png" ></span>
        </header>
        <article>
            <table class="meta">
                <tr>
                    <th><span >Name</span></th>
                    <td><span >${inf.customerEn.name}</span></td>
                </tr>

                <tr>
                    <th><span >Email</span></th>
                    <td><span >${inf.customerEn.email}</span></td>
                </tr>
                <tr>
                    <th><span >Identity Card</span></th>
                    <td><span > ${inf.customerEn.identityCard}</span></td>
                </tr>
                <tr>
                    <th><span >Date Checkin</span></th>
                    <td><span > ${inf.dateCheckin}</span></td>
                </tr>
                <tr>
                    <th><span >Date Checkout</span></th>
                    <td><span > ${inf.dateCheckout}</span></td>
                </tr>

            </table>
            <table class="inventory">
                <thead>
                    <tr>
                        <th><span >Room Name</span></th>
                        <th><span >Number Room</span></th>
                        <th><span >Price</span></th>

                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="b" items="${bkd}">
                        <tr>
                            <td ><span >${b.roomEnti.roomCa.categoryRoomName}</span></td>
                            <td ><span >${b.roomEnti.roomNumber}</span></td>
                            <td ><span >$${b.roomEnti.price}</span></td>

                        </tr>
                    </c:forEach>

                </tbody>
            </table>

            <table class="balance">
                <tr>
                    <th><span >Total Price</span></th>
                    <td><span data-prefix></span>${inf.totalPrice} <span>$</span></td>
                </tr>
            </table>
        </article>
        <aside>
            <h1><span >Contact Us</span></h1>
            <div >
                <p align="center">Email :-modernhotel@gmail.com || Web :- www.modernhotel.com || Phone :- 1900 1010 </p><br><br>
                <p align="center">Thanks you so much! See you again.</p>
            </div>
        </aside>

    </body>
</html>
