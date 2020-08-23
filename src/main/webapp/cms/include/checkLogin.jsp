<%@page contentType="text/html; charset=utf-8" %>
<%
    try {
        if (userLogin == null) {
            session.setAttribute("error", "Bạn cần đăng nhập để truy cập hệ thống");
            out.print("<script>top.location='" + request.getContextPath() + "/cms/login.jsp';</script>");
            return;
        }
    } catch (Exception ex) {
        System.out.println("Vao Exception CheckLogin:" + ex.getMessage());
        out.print("<script>top.location='" + request.getContextPath() + "/pages/examples/login.html';</script>");
        return;
    }
%>