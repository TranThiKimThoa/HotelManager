
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room Page</title>
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
        <%@include file="include/headerEmployee.jsp" %>
        <br>
        <br>
        <br>

        <div class="limiter">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center">
                    <h2>ROOM LIST</h2>
                </div>
            </div>

            <div class="container-table100">
                <div class="wrap-table100">

                    <div class="col-xs-12 col-sm-12 col-md-12" >
                        <button class="btn btn-info" onclick="location.href = '${pageContext.request.contextPath}/management/employee/add-room'">+ Add New Room</button>
                    </div>
                    <br>
                    <br>
                    <br>

                    <div class="table100 ver2 m-b-110">
                        <div class="table100-head">
                            <table>
                                <thead>
                                    <tr class="row100 head">
                                        
                                        <th class="cell100 column1">#</th>
                                        <th class="cell100 column2">Category Room</th>
                                        <th class="cell100 column3">Number Room</th>
                                        <th class="cell100 column4">Price</th>
                                        <th class="cell100 column5">Action</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>

                        <div class="table100-body js-pscroll">
                            <table>
                                <tbody>
                                    <c:forEach var="c" items="${list}">
                                        <tr class="row100 body">
                                            <td class="cell100 column1"><img src="${pageContext.request.contextPath}/${c.roomCa.images}" style="height: 100px;width: 250px" ></td>
                                            <td class="cell100 column2">${c.roomCa.categoryRoomName}</td>
                                            <td class="cell100 column3">${c.roomNumber}</td>
                                            <td class="cell100 column4">${c.price}</td>
                                            <td class="cell100 column5">
                                                <button type="button" class="btn btn-info"
                                                        onclick="location.href = '${pageContext.request.contextPath}/management/employee/edit-room/${c.id}'">Edit</button>

                                                <button type="button" class="btn btn-danger"
                                                        onclick="location.href = '${pageContext.request.contextPath}/management/employee/delete-room/${c.id}'">Delete</button>
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
                    

        <%@include file="include/footer.jsp" %> 
        <%@include file="include/includeJs.jsp" %>


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
        <script src="${pageContext.request.contextPath}/resources/tables/js/main.js"></script>


    </body>
</html>
