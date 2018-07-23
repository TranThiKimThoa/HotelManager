

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Notification</title>
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
                                        <input type="date" class="form-control" id="date-start" name="checkIn" />
                                    </div>
                                </div>
                                <div class="a-col alternate">
                                    <div class="input-field">
                                        <label for="date-end">Check Out</label>
                                        <input type="date" class="form-control" id="date-end" name="checkOut"/>
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
                <div class="row" style="margin-top: 20px">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="alert alert-info" style="text-align: center">
                            ${message}
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center; margin-bottom: 20px;">
                        <button class="btn btn-warning" onclick="location.href = '${pageContext.request.contextPath}/management/'">Home</button>
                    </div>
                </div>
            </section>
        </div>
        <%@include file="include/footer.jsp" %>    
        <%@include file="include/includeJs.jsp" %>
    </body>
</html>
