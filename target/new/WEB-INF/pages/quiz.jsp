<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
    <title>Custom designed fancy check boxes and radio buttons with CSS and JavaScript</title>
    <meta name="Description" content="Quiz"/>
    <%--<link rel="stylesheet" type="text/css" href="style.css"/>--%>
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        var proportion = 100;
        function resizeFont() {
            document.body.style.fontSize = parseInt(document.body.offsetWidth / proportion) + 'px'
        }
        onload = onresize = resizeFont;
        if (document.addEventListener) document.addEventListener("DOMContentLoaded", resizeFont, null);
    </script>

</head>
<body>
<div id="sizer">

    <div class="form">

        <img src="${pageContext.request.contextPath}/resources/img/new_logo.png" width="800" height="400" id="logo"/>
        <fieldset class="checkboxes">
            <form:form method="POST" action="save" modelAttribute="choosen">
                <form:checkboxes path="choosen"
                                 items="${variants}"
                                 itemValue="variantId"
                                 itemLabel="variantName"
                                 element="label class='label_check'"
                                 />
                <input type="submit" value="Проголосовать" id="button" onclick="setChecked()"/>
            </form:form>
        </fieldset>

    </div>
</div>

<script>
    var d = document;
    var safari = (navigator.userAgent.toLowerCase().indexOf('safari') != -1) ? true : false;
    var gebtn = function (parEl, child) {
        return parEl.getElementsByTagName(child);
    };
    onload = function () {

        var body = gebtn(d, 'body')[0];
        body.className = body.className && body.className != '' ? body.className + ' has-js' : 'has-js';

        if (!d.getElementById || !d.createTextNode) return;
        var ls = gebtn(d, 'label');
        for (var i = 0; i < ls.length; i++) {
            var l = ls[i];
            if (l.className.indexOf('label_') == -1) continue;
            var inp = gebtn(l, 'input')[0];
            if (l.className == 'label_check') {
                l.className = (safari && inp.checked == true || inp.checked) ? 'label_check c_on' : 'label_check c_off';
                l.onclick = check_it;
            }
            ;
            if (l.className == 'label_radio') {
                l.className = (safari && inp.checked == true || inp.checked) ? 'label_radio r_on' : 'label_radio r_off';
                l.onclick = turn_radio;
            }
            ;
        }
        ;
    };
    var check_it = function () {
        var inp = gebtn(this, 'input')[0];
        if (this.className == 'label_check c_off' || (!safari && inp.checked)) {
            this.className = 'label_check c_on';
            if (safari) inp.click();
        } else {
            this.className = 'label_check c_off';
            if (safari) inp.click();
        }
        ;
    };
    var turn_radio = function () {
        var inp = gebtn(this, 'input')[0];
        if (this.className == 'label_radio r_off' || inp.checked) {
            var ls = gebtn(this.parentNode, 'label');
            for (var i = 0; i < ls.length; i++) {
                var l = ls[i];
                if (l.className.indexOf('label_radio') == -1)  continue;
                l.className = 'label_radio r_off';
            }
            ;
            this.className = 'label_radio r_on';
            if (safari) inp.click();
        } else {
            this.className = 'label_radio r_off';
            if (safari) inp.click();
        }
        ;
    };

    function setChecked(){
        var a = document.getElementsByTagName("label");
        for (var i in a){
            if (a[i].className == "label_check c_on")
                a[i].children[0].checked = true;
        }
    }

</script>
</body>
</html>