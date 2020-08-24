<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html; charset=utf-8"%>
<%
    pageURL = Tool.getFullURL(request) + "?";
    paraList = request.getParameterNames();
    while (paraList.hasMoreElements()) {
        String paraName = String.valueOf(paraList.nextElement());
        if (!paraName.equalsIgnoreCase("page") && !paraName.equalsIgnoreCase("submit")) {
            pageURL += paraName + "=" + request.getParameter(paraName) + "&amp;";
        }
    }
    if (pageURL.endsWith("&amp;")) {
        pageURL = pageURL.substring(0, pageURL.length() - 5);
    }
    if (totalPage > 1) {
%>
<div align="center" class="pagination">
    <%
        if (currentPage == 1) {
    %>
    <span class="disabled">&lt;&lt; prev</span>
    <%    } else {
    %>
    <a  href = "<%=pageURL%>&page=<%=1%>" >&lt;&lt; first</a>
    <a  href = "<%=pageURL%>&page=<%=currentPage - 1%>" >&lt; prev</a>
    
    <% if (currentPage != 2) {%>
    <% if (currentPage != 3) {%>
    <a  href = "<%=pageURL%>&page=<%=1%>" ><%=1%></a>...
    <a  href = "<%=pageURL%>&page=<%=currentPage - 1%>" ><%=currentPage - 1%></a>
    <%} else {%>
    <a  href = "<%=pageURL%>&page=<%=1%>" ><%=1%></a>
    <a  href = "<%=pageURL%>&page=<%=currentPage - 1%>" ><%=currentPage - 1%></a>
    <%}%>
    <%} else {%>
    <a  href = "<%=pageURL%>&page=<%=1%>" ><%=1%></a>
    <%}%>
    
    <%            }
    %>
    <span class="current"><%=currentPage%></span>
    <%
        if (currentPage + 1 <= totalPage) {
    %>
    <a href="<%=pageURL%>&page=<%=currentPage + 1%>"><%=currentPage + 1%></a>
    <%
        }
        if (currentPage + 2 <= totalPage) {
    %>
    <a href="<%=pageURL%>&page=<%=currentPage + 2%>"><%=currentPage + 2%></a>
    <%
        }
        if (totalPage - 2 > currentPage + 2) {
    %>
    ...<a href="<%=pageURL%>&page=<%=totalPage - 2%>"><%=totalPage - 2%></a>
    <%
        }
        if (totalPage - 1 > currentPage + 3) {
    %>
    <a href="<%=pageURL%>&page=<%=totalPage - 1%>"><%=totalPage - 1%></a>
    <%
        }
        if (totalPage > currentPage + 4) {
    %>
    <a href="<%=pageURL%>&page=<%=totalPage%>"><%=totalPage%></a>
    <%
        }
        if (currentPage < totalPage) {
    %>
    <a href="<%=pageURL%>&page=<%=currentPage + 1%>">next &gt;</a>
    <a href="<%=pageURL%>&page=<%=totalPage%>">last &gt;&gt;</a>
    <%        } else {
    %>
    <span class="disabled">next &gt;&gt;</span>
    <%        }
    %>
</div>
<%
    }
%>
