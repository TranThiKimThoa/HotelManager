
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Booking</title>
        <link type="text/css" rel="stylesheet" href="<c:url value="/webjars/bootstrap/3.3.7/css/bootstrap.min.css"/>" />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>

        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/tables/images/icons/favicon.ico"/>




    </head>
    <body>
        <%@include file="include/headerEmployee.jsp" %>
        <br>
        <br>
        <br>

        <div class="limiter">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center">
                    <h2>BOOKING INFORMATION</h2>
                </div>
            </div>
            <c:if test="${message != null && message != ''}">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="alert alert-danger">
                        ${message}
                    </div>
                </div>
            </c:if>
            <div>
                
            </div>
            <br>



            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="table-responsive">
                    <table class="table table-bordered">

                        <tr >
                            <th >IDBooking</th>
                            <th >Date Checkin</th>
                            <th >Date Checkout</th>
                            <th >Total Price</th>
                            <th>Status</th>

                        </tr>

                        <c:forEach var="c" items="${list}">
                            <tr >
                                <td><a href="${pageContext.request.contextPath}/management/employee/statesinf/${c.id}">${c.id}</a></td>
                                <td >${c.dateCheckin}</td>
                                <td >${c.dateCheckout}</td>
                                <td >${c.totalPrice}</td>
                                <td >
                                    <c:if test="${c.status == 'Checkout'}">
                                        <p>Paid</p>
                                    </c:if>

                                    <c:if test="${c.status == 'Checkin'}">
                                        <button type="button" class="btn btn-warning"
                                                onclick="location.href = '${pageContext.request.contextPath}/management/employee/checkoutbutton/${c.id}'">Checkout</button>
                                    </c:if>
                                    <c:if test="${c.status == 'Booking'}">
                                        <button type="button" class="btn btn-info"
                                                onclick="location.href = '${pageContext.request.contextPath}/management/employee/checkinbutton/${c.id}'">Checkin</button>
                                        
                                        <button type="button" class="btn btn-danger"
                                                onclick="location.href = '${pageContext.request.contextPath}/management/employee/cancelbooking/${c.id}'">Cancel</button>
                                    </c:if></td>

                            </tr>
                        </c:forEach>

                    </table>

                </div>
            </div>

        </div>
        <%@include file="include/includeJs.jsp" %>





    </body>
</html>
