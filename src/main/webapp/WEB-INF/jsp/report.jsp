
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="<c:url value="/webjars/bootstrap/3.3.7/css/bootstrap.min.css"/>" />
        <title>Report</title>

        <%@include file="include/includeCss.jsp" %>

    </head>
    <body>

        <section class="navbar navbar-default  sticky-navigation" role="navigation">
            <div class="container">

                <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                    </button>
                    <a href="${pageContext.request.contextPath}/management/" class="navbar-brand">Modern Town</a>
                    <a class="navbar-brand" >${email}</a>
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
        <br>

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
                            <form action="${pageContext.request.contextPath}/management/employee/search-report" method="post">
                                <div class="a-col">
                                    <label style="color: white;">MODERN HOTEL</label>
                                </div>

                                <div class="a-col alternate">
                                    <div class="input-field">
                                        <label for="date-start">From Day</label>
                                        <input type="date" class="form-control" id="date-start" name="fromday"  />
                                    </div>
                                </div>
                                <div class="a-col alternate">
                                    <div class="input-field">
                                        <label for="date-end">To Day</label>
                                        <input type="date" class="form-control" id="date-end" name="today"/>
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
            <div class="row">
                <c:if test="${list > 0}">
                     <div class="col-xs-12 col-sm-12 col-md-4"><h4>From Day: ${from}</h4> </div>
                      <div class="col-xs-12 col-sm-12 col-md-4"><h4>To Day: ${to}</h4> </div>
                    <div class="col-xs-12 col-sm-12 col-md-8"><h4>People: ${list}</h4> </div>
                    <div class="col-xs-12 col-sm-12 col-md-8"><h4>No of Room: ${ro}</h4> </div>
                    <div class="col-xs-12 col-sm-12 col-md-8"><h4>No max room: </h4> </div>

                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="table-responsive">
                            <table class="table table-bordered">

                                <tr >
                                    <th >Category Name</th>
                                    <th >Times</th>


                                </tr>

                                <c:forEach var="c" items="${listRo}">
                                    <tr class="row100 body">
                                        <td class="cell100 column1">${c[1]}</td>
                                        <td class="cell100 column2">${c[0]}</td>

                                    </tr>
                                </c:forEach>

                            </table>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-8"><h4>Total: $${total}</h4> </div>
                    <h3><a href="<c:url value="/management/employee/downloadExcel" />">Download Report</a></h3>
                </c:if>
                <c:if test="${list == 0}">
                    <c:if test="${message1 !=null && message1 !=''}">
                                <div class="alert alert-info">
                                    ${message1}
                                </div>
                            </c:if>
                    <div>Empty</div>
                </c:if>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/smoothscroll.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.nav.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.parallax.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/isotope.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/counter.js"></script>



    </body>
</html>
