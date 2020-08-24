<%@page import="com.mycompany.cmswebjsp.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bbootstrap 4 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/summernote/summernote-bs4.css">
<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
<%
    request.setCharacterEncoding("utf-8");
    String urlLog = "http://" + request.getHeader("host");
    urlLog += request.getRequestURI();
    if (request.getQueryString() != null) {
        urlLog += "?" + request.getQueryString();
    }
    String webPath = request.getContextPath();
    if (webPath.equals("/")) {
        webPath = "";
    }
    // System.out.println(webPath);
    //---------------Admin
    User userlogin = User.getAccount(session);
    if (userlogin == null) {
        session.setAttribute("error", "Bạn cần đăng nhập để truy cập hệ thống");
        out.print("<script>top.location='" + request.getContextPath() + "/admin/login.jsp';</script>");
        return;
    } else if (userlogin.getUserType() != Account.TYPE.ADMIN.val) {
        out.print("<script>top.location='" + request.getContextPath() + "/dang-nhap/';</script>");
        return;
    }
    //---------PAGE SETING----------------
    String pageURL = "";
    Enumeration paraList = null;
    int maxRow = 100;
    if (!userlogin.checkView(request) && !Tool.getURI(request).endsWith("/admin/")) {
        session.setAttribute("mess", "Bạn không có quyền View Tối thiểu để truy cập module này!");
        response.sendRedirect(request.getContextPath() + "/admin/");
        return;
    }
%>