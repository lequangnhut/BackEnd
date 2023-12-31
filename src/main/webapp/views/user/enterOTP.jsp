<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/views/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FilmViet - Quên mật khẩu</title>
    <%@ include file="/views/common/head.jsp" %>
</head>

<body>
<%@ include file="/views/common/header.jsp" %>

<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg"
         data-setbg="views/template/user/img/normal-breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>Quên Mật Khẩu</h2>
                    <p>Chào Mừng Bạn Đến Blog Chính Thức Của FilmViet.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Normal Breadcrumb End -->

<!-- Login Section Begin -->
<section class="login spad">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-12 col-lg-12">
                <div class="card-forgot card p-3 mb-4 rounded-0"
                     style="color: grey;">
                    <h3 class="mb-2" style="font-weight: 700; color: grey;">Quên
                        Mật Khẩu ?</h3>
                    <p class="mb-3">thay đổi mật khẩu của bạn trong ba bước đơn
                        giản. Điều này sẽ giúp bạn bảo mật mật khẩu của bạn.</p>

                    <div class="step_form" style="color: grey;">
                        <p>
                            <Strong class="text-info">1</Strong> .Nhập địa chỉ Email của
                            bạn. Hệ thống của sẽ gửi cho bạn một mã OTP vào email của bạn. <br>
                            <Strong class="text-info">2</Strong> <strong>.Nhập mã
                            OTP đã nhận được ở email của bạn. </strong><br> <Strong
                                class="text-info">3</Strong> .Tạo một mật khẩu mới.
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-12 col-lg-12">
                <div class="card-forgot card p-3 rounded-0" style="color: grey;">
                    <div class="step_form" style="color: grey;">
                        <form onsubmit="return validateEnterOTP()" action="validateotp"
                              method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label">Nhập Mã OTP: </label> <input
                                    type="text" class="form-control" name="otp" id="email">
                                <small id="helpId" class="form-text text-muted">Nhập mã
                                    OTP hệ thống đã gửi cho bạn trong hòm thư điện tử !</small>

                            </div>
                            <hr>
                            <button type="submit"
                                    class="btn btn-success rounded-0 p-2 ps-4 px-4 fw-bold text-white">
                                TIẾP TỤC
                            </button>
                            <a type="button" href="login"
                               class="btn btn-danger rounded-0 p-2 ps-4 px-4 fw-bold  text-white"
                               role="button">TRỞ LẠI</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Forgotpass Section End -->

<%@ include file="/views/common/footer.jsp" %>

<script type="text/javascript">
    function validateEnterOTP() {
        var regexOTP = /^\d+$/;
        var otp = document.getElementsByName("otp")[0].value;

        if (otp == "") {
            showSwalAlert('error', 'Vui lòng nhập mã OTP !');
            return false;
        }

        if (!regexOTP.test(otp)) {
            showSwalAlert('error', 'Mã OTP không đúng định dạng !');
            return false;
        }

        if (!otp.lenght == 6) {
            showSwalAlert('error', 'Mã OTP phải là 5 kí tự !');
            return false;
        }

        return true;
    }
</script>

<%
    Boolean errorOTP = (Boolean) session.getAttribute("errorOTP");
    if (errorOTP != null) {
        if (errorOTP) {
%>
<script>
    showSwalAlert('error', 'Mã OTP không chính xác !');
</script>
<%
        }
        session.removeAttribute("errorOTP");
    }
%>

</body>

</html>