
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Login</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/minmin.css">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
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
                    <a href="#" class="navbar-brand">Modern Town</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right main-navigation">


                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <li><a class="smoothScroll" href="<c:url value="/admin/admin-page" />">Admin</a></li>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                            <li><a class="smoothScroll" href="<c:url value="/user/user-page" />">Employee</a></li>
                            </sec:authorize>
                            <sec:authorize access="!isAuthenticated()">
                            <li><a class="smoothScroll" href="<c:url value="/login" />">LOGIN</a></li>
                            </sec:authorize>
                            <sec:authorize access="isAuthenticated()">
                            <li><a class="smoothScroll" href="<c:url value="/logout" />">Logout</a></li>
                            <li><a class="smoothScroll" href="<c:url value="/user-infor" />">
                                    <sec:authentication property="principal.email"/>
                                </a></li>
                            </sec:authorize>
                    </ul>
                </div>

            </div>
        </section>


        <section  class="paralla-section">
            <div class="slideshow-container">

                <div class="mySlides fade">
                    <div class="numbertext">1 / 4</div>
                    <img src="${pageContext.request.contextPath}/resources/images/ht1.jpg" style="width:100%">
                    <div class="text">WELCOME TO SYSTEM HOTEL</div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">2 / 4</div>
                    <img src="${pageContext.request.contextPath}/resources/images/ht2.jpg" style="width:100%">
                    <div class="text">WELCOME TO SYSTEM HOTEL</div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">3 / 4</div>
                    <img src="${pageContext.request.contextPath}/resources/images/ht3.jpg" style="width:100%">
                    <div class="text">WELCOME TO SYSTEM HOTEL</div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">4 / 4</div>
                    <img src="${pageContext.request.contextPath}/resources/images/ht4.jpg" style="width:100%">
                    <div class="text">WELCOME TO SYSTEM HOTEL</div>
                </div>

            </div>
            <br>

            <div style="text-align:center">
                <span class="dot"></span> 
                <span class="dot"></span> 
                <span class="dot"></span> 
                <span class="dot"></span> 
            </div>
        </section>

        <section id="counter" class="paralla-section">
            <div class="container">
                <div class="row">

                    <div class="col-md-3 col-sm-3 counter-item">	
                        <h3 class="counter-number" data-from="1" data-to="256" data-speed="1000"></h3>
                        <span class="counter-text">CUSTOMERS</span>
                    </div> 
                    <div class="col-md-3 col-sm-3 counter-item">	
                        <h3 class="counter-number" data-from="1" data-to="512" data-speed="2000"></h3>
                        <span class="counter-text">DEVELOPERS</span>
                    </div>   
                    <div class="col-md-3 col-sm-3 counter-item">	
                        <h3 class="counter-number" data-from="1" data-to="1024" data-speed="3000"></h3>
                        <span class="counter-text">AWESOME PROJECTS</span>
                    </div> 
                    <div class="col-md-3 col-sm-3 counter-item">
                        <h3 class="counter-number" data-from="1" data-to="2048" data-speed="4000"></h3>
                        <span class="counter-text">DESIGNERS</span>
                    </div> 


                </div>
            </div>
        </section>


        <section  class="paralla-section">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center">
                    <h1>MODERN HOTEL</h1>
                </div>
            </div>
            <div class="row" style="padding-bottom: 20px;">
                <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center">
                    <h5>Enchanted With Elegance!</h5>	

                </div>
            </div>

        </section>

        <footer style="background-color: black; color: white;">
            <div class="container" >
                <div class="row">

                    <div class="col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                        <h2>Modern Town</h2>
                        <p>Lorem ipsum dolor sit amet, maecenas eget vestibulum justo imperdiet, wisi risus purus augue vulputate voluptate neque, curabitur dolor libero sodales vitae elit massa.</p>
                        <p>Copyright &copy; 2016 Modern Town 

                            | Design: <a rel="nofollow" href="http://www.tooplate.com" target="_parent">Tooplate</a></p>
                    </div>
                    <div class="link-list col-md-2 col-sm-2 wow fadeInUp" data-wow-delay="0.6s">
                        <h2>Company</h2>
                        <a href="#">About</a>
                        <a href="#">Blog</a>
                        <a href="#">Team</a>
                        <a href="#">Career</a>
                    </div>
                    <div class="link-list col-md-2 col-sm-2 wow fadeInUp" data-wow-delay="0.6s">
                        <h2>Support</h2>
                        <a href="#">Email Us</a>
                        <a href="#">FAQs</a>
                        <a href="#">Service Terms</a>
                        <a href="#">Licenses</a>
                    </div>
                    <div class="col-md-2 col-sm-2 wow fadeInUp" data-wow-delay="0.9s">
                        <h2>Network</h2>
                        <ul class="social-icon">
                            <li><a href="#" class="fa fa-facebook wow fadeIn" data-wow-delay="0.3s"></a></li>
                            <li><a href="#" class="fa fa-twitter wow fadeIn" data-wow-delay="0.6s"></a></li>
                            <li><a href="#" class="fa fa-dribbble wow fadeIn" data-wow-delay="0.9s"></a></li>
                            <li><a href="#" class="fa fa-behance wow fadeIn" data-wow-delay="1s"></a></li>
                        </ul>
                        <div>

                        </div>
                    </div>

                    <div class="col-md-12 col-sm-12">
                        <div class="copyright-text wow bounceIn">

                        </div>
                    </div>

                    </footer>


                    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
                    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
                    <script src="${pageContext.request.contextPath}/resources/js/smoothscroll.js"></script>
                    <script src="${pageContext.request.contextPath}/resources/js/jquery.nav.js"></script>
                    <script src="${pageContext.request.contextPath}/resources/js/jquery.parallax.js"></script>
                    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
                    <script src="${pageContext.request.contextPath}/resources/js/isotope.min.js"></script>
                    <script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
                    <script src="${pageContext.request.contextPath}/resources/js/counter.js"></script>

                    <script src="${pageContext.request.contextPath}/resources/js/minmin.js"></script>

                    </body>
                    </html>
