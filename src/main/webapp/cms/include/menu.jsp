<%@page import="gk.myname.vn.admin.Permission"%><%@page import="gk.myname.vn.admin.Account"%><%@page import="java.util.Calendar"%><%@ page contentType="text/html; charset=utf-8" %>
<div class="menu">
    <%//Account userlogin = Account.getAccount(session);%>
    <ul>
        <li><a target="_parent" class="current" href="<%=request.getContextPath()%>/admin"><b>Trang chủ</b></a></li>
        <li><a href="#"><b>Thống kê Đối soát</b></a>
            <% if (userlogin.checkRight("/admin/statistic/", Permission.PER.VIEW.val)) {%>
            <ul>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/statistic/thongke_submit.jsp" title="">Thống kê Log Submit</a></li>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/statistic/thongke_request.jsp" title="">Thống kê Log Request</a></li>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/statistic/tk_detail_byday.jsp" title="">Thống kê Theo Ngày</a></li>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/statistic/bieudo_submit_byday.jsp" title="">Biều đồ Theo ngày</a></li>
                <!--<li><a target="_parent" href="#" title="">---------------------------------</a></li>-->
                <!--<li><a target="_parent" href="<%=request.getContextPath()%>/admin/statistic/cdr_muavao.jsp" title="">Thống kê CDR Mua Vào</a></li>-->                
            <% if (userlogin.checkRight("/admin/statistic/cdr_banra.jsp", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/statistic/cdr_banra.jsp" title="">Thống kê CDR Bán Ra</a></li>                
            <%}%>
            <% if (userlogin.checkRight("/admin/statistic/cdr_banra_daily.jsp", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/statistic/cdr_banra_daily.jsp" title="">TK CDR Bán Theo đại lý</a></li>              
            <%}%>
            <% if (userlogin.checkRight("/admin/statistic/kpi_request.jsp", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/statistic/kpi_request.jsp" title="">KPI Request</a></li>              
            <%}%>
            <% if (userlogin.checkRight("/admin/statistic/kpi_submit.jsp", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/statistic/kpi_submit.jsp" title="">KPI Submit</a></li>              
            <%}%>
            </ul>
            <%}%>
        </li>
        <li><a href="#"><b>Lịch sử giao dich</b></a>
            <% if (userlogin.checkRight("/admin/statistic/", Permission.PER.VIEW.val)) {%>
            <ul>
                <!--<li><a target="_parent" href="<%=request.getContextPath()%>/admin/statistic/submit_week.jsp" title="">Lịch sử gửi Brand 7 Ngày</a></li>-->
                <!--<li><a target="_parent" href="<%=request.getContextPath()%>/admin/statistic/request_week.jsp" title="">Lịch sử yêu cầu 7 Ngày</a></li>-->
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/statistic/history/submit_full.jsp" title="">Lịch sử Gửi Brand</a></li>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/statistic/history/request_full.jsp" title="">Lịch sử Yêu cầu</a></li>
            </ul>
            <%}%>
        </li>
        </li>
        <li><a target="_parent" href="<%=request.getContextPath()%>/admin/brand/sendTestLabel.jsp" title=""><b>TEST TIN</b></a>
            <% if (userlogin.checkRight("/admin/resend_error/", Permission.PER.VIEW.val)) {%>
            <ul>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/resend_error/resend.jsp" title="">Gửi lại tin lỗi</a></li>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/resend_error/index.jsp" title="">Duyệt tin lỗi để gửi</a></li>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/resend_error/history.jsp" title="">Lịch sử gửi tin lỗi</a></li>
            </ul><%}%>
        </li>
        <li><a href="#"><b>Quản Lý QC</b></a>
            <ul>
                <% if (userlogin.checkRight("/admin/campaign/", Permission.PER.VIEW.val)) {%>                
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/campaign/index.jsp" title="">Thông tin chiến dịch</a></li>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/campaign/detail.jsp" title="">Lịch sử chi tiết</a></li>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/campaign/thongke_qc.jsp" title="">Thống kê QC</a></li>
                    <%}%>
            </ul>
        </li>
        <li><a href="#"><b>Quản lý BRand</b></a>
            <ul>
                <% if (userlogin.checkRight("/admin/brand/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/brand/index.jsp" title="">Brand Name</a></li>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/brand-declare/index.jsp" title="">Nhãn chờ Khai báo</a></li>

                <%}%>
                <% if (userlogin.checkRight("/admin/provider/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/provider/index.jsp" title="">Nhà Cung Cấp</a></li>
                    <%}%>
                <% if (userlogin.checkRight("/admin/key-blacklist/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/key-blacklist/index.jsp" title="">Từ khóa Blacklist</a></li>
                    <%}%>
                
                <% if (userlogin.checkRight("/admin/temp-content/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/temp-content/index.jsp" title="">Template nội dung</a></li>
                    <%}%>
                
                <% if (userlogin.checkRight("/admin/phone-blacklist/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/phone-blacklist/index.jsp" title="">Số Blacklist</a></li>
                    <%}%>                
                <% if (userlogin.checkRight("/admin/group_provider/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/group_provider/index.jsp" title="">Nhóm nhà cung cấp</a></li>
                    <%}%>
                  
            </ul>
        </li>
        <li><a href="#"><b>Quản Lý KH</b></a>
            <ul>
                <% if (userlogin.checkRight("/admin/partner-manager/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/partner-manager/" title="">Thông tin đại lý</a></li>
                <%}%>
                <% if (userlogin.checkRight("/admin/customer/agency/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/customer/agency/index.jsp" title="">Tài khoản Đại Lý</a></li>
                <%}%>
                <% if (userlogin.checkRight("/admin/customer/khle/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/customer/khle/index.jsp" title="">Tài khoản KH Lẻ</a></li>
                <%}%>
                <% if (userlogin.checkRight("/admin/subsidiary/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/subsidiary/index.jsp" title="">Quản lý Công ty</a></li>
                <%}%>
                <% if (userlogin.checkRight("/admin/contract/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/contract/index.jsp" title="">Quản lý Hợp Đồng</a></li>
                <%}%>
                <% if (userlogin.checkRight("/admin/complain_log/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/complain_log/index.jsp" title="">Complain_log</a></li>
                <%}%>
                <% if (userlogin.checkRight("/admin/complain_title/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/complain_title/index.jsp" title="">Complain_title</a></li>
                <%}%>
                <% if (userlogin.checkRight("/admin/listEmail/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/listEmail/index.jsp" title="">List Mail</a></li>
                <%}%>
                <% if (userlogin.checkRight("/admin/send_mail/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/send_mail/index.jsp" title="">Send_Mail</a></li>
                <%}%>
                <% if (userlogin.checkRight("/admin/temp_check_sms/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/temp_check_sms/index.jsp" title="">Check loại tin nhắn</a></li>
                <%}%>
            </ul>
        </li>
        <li><a href="#"><b>QL hệ thống</b></a>
            <ul>
                <li><a target="_blank" href="<%=request.getContextPath()%>/admin/Monitior.jsp" title="">Monitor SERVER</a></li>
                    <% if (userlogin.checkRight("/admin/monitorapp/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/monitorapp/index.jsp" title="">Monitor App</a></li>
                    <%}%>
                    <% if (userlogin.checkRight("/admin/account/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/account/index.jsp" title="">Tài khoản quản trị</a></li>
                    <%}%>
                    <% if (userlogin.checkRight("/admin/module/", Permission.PER.VIEW.val)) {%>                
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/module/module.jsp" title="">Quản trị module</a></li>
                    <%}%>
                    <% if (userlogin.checkRight("/admin/group/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/group/group.jsp" title="">Nhóm Quản trị</a></li>
                    <%}%>
                    <% if (userlogin.checkRight("/admin/configApp/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/configApp/" title="">Cấu hình hệ thống</a></li>
                    <%}%>
                    <% if (userlogin.checkRight("/admin/firewall-manager/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/firewall-manager/" title="">Firewall Manager</a></li>
                    <%}%>
                    <% if (userlogin.checkRight("/admin/email_manager/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/email_manager/" title="">Cấu hình Email</a></li>
                    <%}%>
                    <% if (userlogin.checkRight("/admin/email_tmp_config/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/email_tmp_config/" title="">Email_tmp_config</a></li>
                    <%}%>
                    <% if (userlogin.checkRight("/admin/mnp_phone/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/mnp_phone/index.jsp" title="">MNP PHONE</a></li>
                    <%}%>
                    <% if (userlogin.checkRight("/admin/nations/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/nations/list.jsp" title="">Quản lý quốc gia</a></li>
                    <%}%>
                    <% if (userlogin.checkRight("/admin/account/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/account/userAction.jsp" title="">Log User Action</a></li>
                    <%}%>
            </ul>
        </li>
        <li><a href="#"><b>Billing</b></a>
            <ul>
                
                    <% if (userlogin.checkRight("/admin/billing/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/billing/index.jsp" title="">Thông tin billing của tài khoản</a></li>
                    <%}%>
                    <% if (userlogin.checkRight("/admin/billing/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/billing/addMoney.jsp" title="">Cộng tiền vào tài khoản</a></li>
                    <%}%>
                    <% if (userlogin.checkRight("/admin/billing/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/billing/minusMoney.jsp" title="">Trừ tiền vào tài khoản</a></li>
                    <%}%>
                    <% if (userlogin.checkRight("/admin/billing/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/billing/hisMoney.jsp" title="">Lịch sử cộng tiền</a></li>
                    <%}%>
                    <% if (userlogin.checkRight("/admin/billing/", Permission.PER.VIEW.val)) {%>
                <li><a target="_parent" href="<%=request.getContextPath()%>/admin/billing/billingTrans.jsp" title="">Giao dịch Billing</a></li>
                    <%}%>
            </ul>
        </li>
    </ul>
</div> 

