

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Room</title>
        <%@include file="include/includeCss.jsp" %>
    </head>
    <body>
        <%@include file="include/headerEmployee.jsp" %>
        <section id="home" class="parallax-section">
            <div class="wrap">
                <div class="container">
                    <div class="row">
                        <div id="availability">
                            <c:if test="${message!=null && message!=''}">
                                <div class="alert alert-info">
                                    ${message}
                                </div>
                            </c:if>
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
                        <h2>List Room Available</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
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
                                <c:forEach var="room" items="${lstRoomsAvailable}">
                                    <tr>
                                        <td>${room.roomNumber}</td>
                                        <td>${room.roomCa.categoryRoomName}</td>
                                        <td>${room.roomCa.categoryRoomDescription}</td>
                                        <td><img src="${pageContext.request.contextPath}/${room.roomCa.images}" class="img-thumbnail img-table"></td>
                                        <td>$${room.price}</td>
                                        <td>
                                            <form action="${pageContext.request.contextPath}/management/employee/booking-room" method="post">
                                                <input type="date" class="form-control hidden" name="checkIn" value="${checkInDate}" /> 
                                                <input type="date" class="form-control hidden" name="checkOut" value="${checkOutDate}"/>
                                                <input type="text" class="form-control hidden" name="roomId" value="${room.id}"/>
                                                <input type="submit" class="form-control btn btn-info" value="Booking" />
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <%@include file="include/footer.jsp" %>    
        <%@include file="include/includeJs.jsp" %>
    </body>
</html>
