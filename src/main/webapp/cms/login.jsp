<%@page import="com.mycompany.cmswebjsp.utils.Md5"%>
<%@page import="com.mycompany.cmswebjsp.repo.UserRepository"%>
<%@page import="com.mycompany.cmswebjsp.model.User"%>
<%@page import="com.mycompany.cmswebjsp.utils.Tool"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AdminLTE 3 | Log in</title>
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
            String userName = Tool.validStringRequest(request.getParameter("userName"));
            String password = Tool.validStringRequest(request.getParameter("password"));
            UserRepository userRepository = new UserRepository();
            User user = userRepository.getUser(userName);
            if (user == null) {
                session.setAttribute("error", "Tài khoản không tồn tại");
            } else {
                if (!Md5.encryptMD5(password).equals(user.getPassword())) {
                    session.setAttribute("error", "Mật khẩu không chính xác");
                } else {
                    session.setAttribute("userLogin", user);
                    response.sendRedirect(request.getContextPath() + "/cms/");
                    return;
                }
            }
        }
    %>
    <body class="hold-transition login-page">        
        <div class="login-box">
            <div class="login-logo">
              <a href="<%=request.getContextPath()%>/cms/index.jsp"><b>Admin</b>LTE</a>
            </div>
            <!-- /.login-logo -->
            <div class="card">
                <div class="card-body login-card-body">
                    <p class="login-box-msg">
                        <%=(session.getAttribute("error") != null) ? "" + session.getAttribute("error") : "Sign in to start your session"%><%session.removeAttribute("error");%>
                    </p>

                    <form action="" method="post">
                        <div class="input-group mb-3">
                            <input type="text" name="userName" class="form-control" placeholder="Username">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" name="password" class="form-control" placeholder="Password">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="icheck-primary">
                                    <input type="checkbox" id="remember" name="remember">
                                    <label for="remember">
                                        Remember Me
                                    </label>
                              </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-4">
                                <button type="submit" name="submit" id="submit" class="btn btn-primary btn-block">Sign In</button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>

                    <div class="social-auth-links text-center mb-3">
                        <p>- OR -</p>
                        <a href="#" class="btn btn-block btn-primary">
                            <i class="fab fa-facebook mr-2"></i> Sign in using Facebook
                        </a>
                        <a href="#" class="btn btn-block btn-danger">
                            <i class="fab fa-google-plus mr-2"></i> Sign in using Google+
                        </a>
                    </div>
                    <!-- /.social-auth-links -->

                    <p class="mb-1">
                        <a href="#">I forgot my password</a>
                    </p>
                    <p class="mb-0">
                        <a href="<%=request.getContextPath()%>/cms/register.jsp" class="text-center">Register a new membership</a>
                    </p>
                </div>
                <!-- /.login-card-body -->
            </div>
        </div>
        <!-- /.login-box -->

        <!-- jQuery -->
        <script src="<%=request.getContextPath()%>/plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="<%=request.getContextPath()%>/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="<%=request.getContextPath()%>/dist/js/adminlte.min.js"></script>

    </body>
</html>
