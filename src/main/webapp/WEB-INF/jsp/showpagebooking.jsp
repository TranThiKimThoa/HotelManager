
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="<c:url value="/webjars/bootstrap/3.3.7/css/bootstrap.min.css"/>" />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>

        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/tables/images/icons/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/tables/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/tables/vendor/animate/animate.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/tables/vendor/select2/select2.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/tables/vendor/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/tables/css/util.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/tables/css/main.css">



    </head>
    <body>
        <section class="navbar navbar-default navbar-fixed-top sticky-navigation" role="navigation">
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
        <br>
        <br>

        <div class="limiter">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center">
                    <h2>BOOKING LIST</h2>
                </div>
            </div>

            <div class="container-table100">
                <div class="wrap-table100">

                    <div class="container">
                        <form action="searchBooking" method="post" class="search">
                            <input type="text" class="form-control" placeholder="Search by IdCard" name="searchText"/>
                            <button type="submit" class="btn btn-primary btn-sm">Search</button>
                        </form>

                    </div>

                    <br>

                    <div class="col-xs-12 col-sm-12 col-md-12" >
                        <button class="btn btn-info" onclick="location.href = '${pageContext.request.contextPath}/management/employee/add-customer'">+ Add Customer</button>
                    </div>
                    <br>
                    <br>
                    <br>

                    <div class="table100 ver2 m-b-110">
                        <div class="table100-head">
                            <table>
                                <thead>
                                    <tr class="row100 head">
                                        <th class="cell100 column1">Name</th>
                                        <th class="cell100 column2">Identity Card</th>
                                        <th class="cell100 column3">IDBooking</th>
                                        <th class="cell100 column4">Action</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>

                        <div class="table100-body js-pscroll">
                            <table>
                                <tbody>
                                    <c:forEach var="c" items="${list}">
                                        <tr class="row100 body">
                                            <td class="cell100 column1">${c.name}</td>
                                            <td class="cell100 column2">${c.identityCard}</td>
                                            <td class="cell100 column3">${c.bookingEn.id}</td>
                                            <td class="cell100 column4">
                                                <button type="button" class="btn btn-danger"
                                                        onclick="location.href = '${pageContext.request.contextPath}/management/employee/bookingroom/${c.bookingEn.id}'">Booking</button>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
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


        <script src="${pageContext.request.contextPath}/resources/tables/vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/tables/vendor/bootstrap/js/popper.js"></script>
        <script src="${pageContext.request.contextPath}/resources/tables/vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/tables/vendor/select2/select2.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/tables/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script>
                                                            $('.js-pscroll').each(function () {
                                                                var ps = new PerfectScrollbar(this);

                                                                $(window).on('resize', function () {
                                                                    ps.update();
                                                                })
                                                            });


        </script>
        <!--===============================================================================================-->
        <script src="${pageContext.request.contextPath}/resources/tables/js/main.js"></script>


    </body>
</html>
