<%@page import="com.mycompany.cmswebjsp.utils.Tool"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AdminLTE 3 | Registration Page</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/fontawesome-free/css/all.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- icheck bootstrap -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/dist/css/adminlte.min.css">
        <!-- Google Font: Source Sans Pro -->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    </head>
    <%
        if (request.getParameter("submit") != null) {
            String user = Tool.validStringRequest(request.getParameter("email"));
            String pass = Tool.validStringRequest(request.getParameter("password"));
            session.setAttribute("error", "haha");
//            response.sendRedirect(request.getContextPath() + "/cms/login.jsp");
//            return;        
        }
    %>
    <body class="hold-transition register-page">
        <div class="register-box">
            <div class="register-logo">
                <a href="<%=request.getContextPath()%>/cms/index.jsp"><b>Admin</b>LTE</a>
            </div>

            <div class="card">
            <div class="card-body register-card-body">
                <p class="login-box-msg">              
                    <%=(session.getAttribute("error") != null) ? "" + session.getAttribute("error") : "Register a new membership"%><%session.removeAttribute("error");%>
                </p>

                <form action="" method="post">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" name="fullName" id="fullName" placeholder="Full name">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-user"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="email" class="form-control" name="email" id="email" placeholder="Email">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control" name="rePassword" id="rePassword" placeholder="Retype password">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                      <div class="col-8">
                        <div class="icheck-primary">
                            <input type="checkbox" id="agreeTerms" name="terms" id="terms" value="agree">
                            <label for="agreeTerms">
                                I agree to the <a href="#">terms</a>
                            </label>
                        </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-4">
                            <button type="submit" name="submit" id="submit" class="btn btn-primary btn-block">Register</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>

                <div class="social-auth-links text-center">
                    <p>- OR -</p>
                    <a href="#" class="btn btn-block btn-primary">
                        <i class="fab fa-facebook mr-2"></i>
                        Sign up using Facebook
                    </a>
                    <a href="#" class="btn btn-block btn-danger">
                        <i class="fab fa-google-plus mr-2"></i>
                        Sign up using Google+
                    </a>
                </div>

                <a href="<%=request.getContextPath()%>/cms/login.jsp" class="text-center">I already have a membership</a>
            </div>
            <!-- /.form-box -->
          </div><!-- /.card -->
        </div>
        <!-- /.register-box -->

        <!-- jQuery -->
        <script src="<%=request.getContextPath()%>/plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="<%=request.getContextPath()%>/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="<%=request.getContextPath()%>/dist/js/adminlte.min.js"></script>
    </body>
</html>
