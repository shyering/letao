<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_orderPay.css" rel="stylesheet"/>
    <title>乐淘letao.com - 网上支付</title>
</head>
<body>
<nav>
    <%@ include file="include/navigator.jsp" %>
    <div class="header">
        <div id="mallLogo">
            <a href="${pageContext.request.contextPath}"><img
                    src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/02.png"></a>
        </div>
    </div>
</nav>
<div class="content">
    <div class="order_div">
        <c:choose>
            <c:when test="${fn:length(requestScope.productOrder.productOrderItemList)==1}">
                <div class="order_name">
                    <span>乐淘letao -- ${requestScope.productOrder.productOrderItemList[0].productOrderItem_product.product_name}</span>
                </div>
                <div class="order_shop_name">
                    <span>卖家昵称：乐淘${requestScope.productOrder.productOrderItemList[0].productOrderItem_product.product_category.category_name}旗舰店</span>
                </div>
            </c:when>
            <c:otherwise>
                <div class="order_name">
                    <span>乐淘letao -- 合并订单：${fn:length(requestScope.productOrder.productOrderItemList)}笔</span>
                </div>
            </c:otherwise>
        </c:choose>
        <div class="order_price">
            <span class="price_value">${requestScope.orderTotalPrice}</span>
            <span class="price_unit">元（不会真实付款）</span>
        </div>
    </div>
    <div class="order_reward_div">
        <div class="order_reward_alipay_div">
            <p class="order_reward_name" id="reward_alipay_name">支付宝</p>
            <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/alipay.jpg"/>
        </div>
        <div class="order_reward_weixinpay_div">
            <p class="order_reward_name" id="reward_weixin_name">微信</p>
            <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/weixinpay.png">
        </div>
        <p>制作不易，欢迎打赏，客官请随意</p>
    </div>
    <div class="order_pay_div">
        <script>
            function pay() {
                $.ajax({
                    url: "${pageContext.request.contextPath}/order/pay/${requestScope.productOrder.productOrder_code}",
                    type: "PUT",
                    data: null,
                    dataType: "json",
                    success: function (data) {
                        if (data.success !== true) {
                            alert("订单处理异常，请稍候再试！");
                        }
                        location.href = "/letao" + data.url;
                    },
                    beforeSend: function () {

                    },
                    error: function () {
                        alert("订单支付出现问题，请重新支付！");
                        location.href = "/letao/order/0/10";
                    }
                });
            }
        </script>
        <a class="order_pay_btn" href="javascript:void(0)" onclick="pay()">确认支付</a>
    </div>
</div>
<%@include file="include/footer_two.jsp" %>
<%--<%@include file="include/footer.jsp" %>--%>
</body>