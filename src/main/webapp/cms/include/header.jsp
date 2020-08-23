<%@page import="gk.myname.vn.utils.Tool"%><%@page import="java.util.Enumeration"%><%@page import="gk.myname.vn.admin.Account"%><%@ page contentType="text/html; charset=utf-8" %><title>${title}</title>
<meta name="robots" content="noindex,nofollow,noodp,noydir"/>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/admin/resource/css/style.css" />
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/admin/resource/css/jquery.alerts.css" />
<script type="text/javascript" src="<%= request.getContextPath()%>/admin/resource/js/clockp.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/admin/resource/js/clockh.js"></script> 
<link rel='stylesheet' href="<%= request.getContextPath()%>/admin/resource/js/DataTables-1.10.12/css/jquery.dataTables.min.css" type="text/css"/>
<script type="text/javascript" src="<%= request.getContextPath()%>/admin/resource/js/DataTables-1.10.12/js/jquery.1.12.3.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/admin/resource/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/admin/resource/js/utils.js?v=1.2"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/admin/resource/js/ddaccordion.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/admin/resource/js/ImageOnMouse.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/admin/resource/js/ajax.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/admin/resource/js/jquery.alerts.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/admin/resource/js/jconfirmaction.jquery.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/admin/resource/js/cnnJs.js"></script>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/admin/resource/css/ui.popup.css" />
<script type="text/javascript" src="<%= request.getContextPath()%>/admin/resource/js/jquery-ui.popup.js"></script>

<link rel='stylesheet' href="<%= request.getContextPath()%>/admin/resource/dateTimeMaster/jquery.datetimepicker.css" type="text/css"/>
<script type="text/javascript" src="<%= request.getContextPath()%>/admin/resource/dateTimeMaster/jquery.datetimepicker.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/admin/resource/js/popupWindow.js"></script>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/admin/resource/select2/select2.css" />
<script type="text/javascript" src="<%= request.getContextPath()%>/admin/resource/select2/select2.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/admin/resource/select2/select2_locale_vi.js"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/admin/resource/js/DataTables-1.10.12/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript">
    $(document).ready(function () {
        $('.ask').jConfirmAction();
    });
</script>
        <script type ='text/javascript'>
            $(document).ready(function () {
                $(".select3").select2({
                    formatResult: function (item) {
                        var valOpt = $(item.element).attr('img-data');
                        if (!valOpt) {
                            return ('<div><b>' + item.text + '</b></div>');
                        } else {
                            return ('<div><span><b style="color: red">' + item.text + '<b> <img src="' + valOpt + '" class="img-flag" /></span></div>');
                        }
                    },
                    formatSelection: function (item) {
                        //  load page or selected
                        var opt = $(".select3 option:selected");
                        var valOpt = opt.attr("img-data");
                        if (!valOpt) {
                            return ('<b>' + item.text + '</b>');
                        } else {
                            return ('<div><span><b style="color: red">' + item.text + '</b> <img src="' + valOpt + '" class="img-flag" /></span></div>');
                        }
                    },
                    dropdownCssClass: "bigdrop", // apply css that makes the dropdown taller
                    escapeMarkup: function (m) {
                    return m;
                    }
                });
            });
        </script>
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
    Account userlogin = Account.getAccount(session);
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
<%!
    String buildControl(HttpServletRequest request, Account userlogin, String urlEdit, String urlDel) {
        String str = "";
        if (userlogin.checkEdit(request) && !Tool.checkNull(urlEdit)) {
            str += "<td class='boder_right'>"
                    + "<a title=\"Sửa\"  href='" + request.getContextPath() + urlEdit + "'>"
                    + "<img width='24' src='" + request.getContextPath() + "/admin/resource/images/user_edit.png' alt='' title='Sửa' border='0' />"
                    + "</a>"
                    + "</td>";
        }
        if (userlogin.checkDel(request) && !Tool.checkNull(urlDel)) {
            str += "<td class='boder_right'>"
                    + "<a title=\"Xóa\" class='ask' href='" + request.getContextPath() + urlDel + "'>"
                    + "<img width='24' src='" + request.getContextPath() + "/admin/resource/images/remove.png' alt='' title='Xóa' border='0' />"
                    + "</a>"
                    + "</td>";
        }
        return str;
    }

    String buildAddControl(HttpServletRequest request, Account userlogin, String urlAdd) {
        if (userlogin.checkAdd(request) && !Tool.checkNull(urlAdd)) {
            String str = "<input class=\"button\" type=\"button\" "
                    + " onclick=\"location.href='" + request.getContextPath() + urlAdd + "'\" "
                    + " value='Thêm mới'/>";
            return str;
        } else {
            return "";
        }
    }

    String buildHeader(HttpServletRequest request, Account userlogin, boolean edit, boolean del) {
        String str = "";
        if (userlogin.checkEdit(request) && edit) {
            str += "<th scope='col' class='rounded'>Edit</th>";
        }
        if (userlogin.checkDel(request) && del) {
            str += "<th scope='col' class='rounded-q4'>Delete</th>";
        }
        return str;
    }
%>
