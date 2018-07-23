
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="func" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Rooms</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee</title>
        <%@include file="include/includeCss.jsp" %>
    </head>
    <body>
        <%@include file="include/headerEmployee.jsp" %>
        <section id="home" class="parallax-section">
            <div class="wrap">
                <div class="container">
                    <div class="row">
                        <div id="availability">
                            <form action="${pageContext.request.contextPath}/management/employee/search-room-booked" method="post">
                                <div class="a-col">
                                    <label style="color: white;">MODERN HOTEL</label>
                                </div>

                                <div class="a-col alternate">
                                    <div class="input-field">
                                        <label for="date-start">Check In</label>
                                        <input type="date" class="form-control" id="date-start" name="checkIn" value="${checkInDate}" />
                                    </div>
                                </div>
                                <div class="a-col alternate">
                                    <div class="input-field">
                                        <label for="date-end">Check Out</label>
                                        <input type="date" class="form-control" id="date-end" name="checkOut" value="${checkOutDate}"/>
                                    </div>
                                </div>
                                <div class="a-col action">
                                    <input type="submit" class="form-control" value="Search" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>	
        </section>
        <div class="container">
            <section  class="paralla-section">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center">
                        <h2>Booking Rooms</h2>
                    </div>
                </div>
                <c:if test="${bookingEntity!=null}">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <p><span class="font-weight">Booking Date: </span>${bookingDate}</p>
                            <p><span class="font-weight">Check In Date: </span>${checkInDate}</p>
                            <p><span class="font-weight">Check Out Date: </span>${checkOutDate}</p>
                        </div>
                    </div>
                </c:if>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <c:if test="${bookingEntity!=null}">
                            <c:if test="${bookingEntity.bookingDe!=null && func:length(bookingEntity.bookingDe)>0}">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <tr>
                                            <th>Room Number</th>
                                            <th>Room Type</th>
                                            <th id="roomDescription">Description</th>
                                            <th>Image</th>
                                            <th>Price</th>
                                            <th>Action</th>
                                        </tr>
                                        <c:forEach var="bookingDe" items="${bookingEntity.bookingDe}">
                                            <tr>
                                                <td>${bookingDe.roomEnti.roomNumber}</td>
                                                <td>${bookingDe.roomEnti.roomCa.categoryRoomName}</td>
                                                <td>${bookingDe.roomEnti.roomCa.categoryRoomDescription}</td>
                                                <td><img src="${pageContext.request.contextPath}/${bookingDe.roomEnti.roomCa.images}" class="img-thumbnail img-table"></td>
                                                <td>$${bookingDe.roomEnti.price}</td>
                                                <td>
                                                    <button class="btn btn-warning" 
                                                            onclick="location.href = '${pageContext.request.contextPath}/management/employee/delete/${bookingDe.roomEnti.id}'">Delete</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </c:if>
                            <c:if test="${bookingEntity.bookingDe==null || func:length(bookingEntity.bookingDe)<=0}">
                                <div class="alert alert-info" style="text-align: center">
                                    You aren't booking room.
                                </div>
                            </c:if>
                        </c:if>
                        <c:if test="${bookingEntity==null}">
                            <div class="alert alert-info" style="text-align: center">
                                You aren't booking room.
                            </div>
                        </c:if>
                    </div>
                </div>
                <div class="row">
                    <c:if test="${bookingEntity!=null}">
                        <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: right">
                            <p><span class="font-weight">Total Price: </span>$${bookingEntity.totalPrice}</p>
                        </div>r
                    </c:if>
                </div>
                <div class="row" style="margin-bottom: 20px">
                    <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center">
                        <c:if test="${bookingEntity!=null}">
                            <c:if test="${bookingEntity.bookingDe==null || func:length(bookingEntity.bookingDe)<=0}">
                                <button class="btn btn-warning" onclick="location.href = '${pageContext.request.contextPath}/management/'">Home</button>
                            </c:if>
                            <c:if test="${bookingEntity.bookingDe!=null && func:length(bookingEntity.bookingDe)>0}">
                                <button class="btn btn-primary" onclick="location.href = '${pageContext.request.contextPath}/management/employee/customer-info'">Continue</button>
                            </c:if> 
                        </c:if>
                        <c:if test="${bookingEntity==null}">
                            <button class="btn btn-warning" onclick="location.href = '${pageContext.request.contextPath}/management/'">Home</button>
                        </c:if>
                    </div>
                </div>
            </section>
        </div>
        <%@include file="include/footer.jsp" %> 
        <%@include file="include/includeJs.jsp" %>
    </body>
</html>
