
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="navbar navbar-default navbar-fixed-top sticky-navigation" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon icon-bar"></span>
                <span class="icon icon-bar"></span>
                <span class="icon icon-bar"></span>
            </button>
            <a href="${pageContext.request.contextPath}/management/" class="navbar-brand">Modern Hotel</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right main-navigation">
                <li><a class="smoothScroll" href="<c:url value="/management/employee/booking" />">BOOKING</a></li>
                <li><a class="smoothScroll" href="<c:url value="/management/employee/room" />">ROOM</a></li>
                <li><a class="smoothScroll" href="<c:url value="/management/employee/bookingshow" />">SHOW BOOKING</a></li>
                <li><a class="smoothScroll" href="<c:url value="/management/employee/report" />">REPORT</a></li>
                <li><a class="smoothScroll" href="<c:url value="/logout" />">LOGOUT</a></li>

            </ul>
        </div>
    </div>
</section>
