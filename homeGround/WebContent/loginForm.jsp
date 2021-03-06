<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Ground</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css" media="all" />
	<link rel="shortcut icon" type="image/x-icon" href="/fav.ico" />
</head>
<body>
    <!-- it works the same with all jquery version from 1.x to 2.x -->
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <!-- use jssor.slider.mini.js (40KB) instead for release -->
    <!-- jssor.slider.mini.js = (jssor.js + jssor.slider.js) -->
    <script type="text/javascript" src="js/jssor.js"></script>
    <script type="text/javascript" src="js/jssor.slider.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript">
	    
        jQuery(document).ready(function ($) {
            var _CaptionTransitions = [];
            _CaptionTransitions["L"] = { $Duration: 900, x: 0.6, $Easing: { $Left: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
            _CaptionTransitions["R"] = { $Duration: 900, x: -0.6, $Easing: { $Left: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
            _CaptionTransitions["T"] = { $Duration: 900, y: 0.6, $Easing: { $Top: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
            _CaptionTransitions["B"] = { $Duration: 900, y: -0.6, $Easing: { $Top: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
            //Reference http://www.jssor.com/development/tool-caption-transition-viewer.html

            var options = {
                $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                $DragOrientation: 3,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

                $CaptionSliderOptions: {                            //[Optional] Options which specifies how to animate caption
                    $Class: $JssorCaptionSlider$,                   //[Required] Class to create instance to animate caption
                    $CaptionTransitions: _CaptionTransitions,       //[Required] An array of caption transitions to play caption, see caption transition section at jssor slideshow transition builder
                    $PlayInMode: 1,                                 //[Optional] 0 None (no play), 1 Chain (goes after main slide), 3 Chain Flatten (goes after main slide and flatten all caption animations), default value is 1
                    $PlayOutMode: 3                                 //[Optional] 0 None (no play), 1 Chain (goes before main slide), 3 Chain Flatten (goes before main slide and flatten all caption animations), default value is 1
                }
            };

            var jssor_slider1 = new $JssorSlider$("slider1_container", options);
            
            $("#loginform").submit(function(){
            	if ($("#userid").val() == ""){
            		alert("아이디를 입력하세요");
            		$("#userid").focus();
            		return false;
            	}
            	if ($("#userpw").val() == ""){
            		alert("비밀번호를 입력하세요");
            		$("#userpw").focus();
            		return false;
            	}
            });
            
            var login = "<%=request.getParameter("login")%>";
            if (login == "failed") {
            	alert("아이디가 존재하지 않거나 비밀번호가 틀렸습니다.");
            	$("#userid").focus();
            }
        });
        
        $(function(){
        	$("#addid").keyup(function(){
    			$(this).val( $(this).val().replace(/[^0-9A-Za-z_]/gi,"") );
    		});
    		
    		$("#addmail").keyup(function(){
    			$(this).val( $(this).val().replace(/[^0-9A-Za-z_]/gi,"") );
    		});
        	
        });
    </script>
    <!-- Jssor Slider Begin -->
    <!-- To move inline styles to css file/block, please specify a class name for each element. --> 
    <div id="slider1_container" style="position: relative; width: 1909px; height: 950px;">
        <!-- Loading Screen -->
        <div u="loading" style="position: absolute; top: 0px; left: 0px;">
		<h1>asdad</h1>
            <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
                background-color: #000000; top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
            <div style="position: absolute; display: block; background: url(../img/loading.gif) no-repeat center center;
                top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
        </div>

        <!-- Slides Container -->
        <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width:1909px; height:950px; overflow: hidden;">
            <div><img u="image" src="images/11.jpg" /></div>
            <div><img u="image" src="images/22.jpg"/></div>
            <div><img u="image" src="images/33.jpg"/></div>
            <div><img u="image" src="images/44.jpg"/></div>
            <div><img u="image" src="images/55.jpg"/></div>
            <div><img u="image" src="images/66.jpg"/></div>
            <div><img u="image" src="images/77.jpg"/></div>
            <div><img u="image" src="images/88.jpg"/></div>
            <div><img u="image" src="images/99.jpg"/></div>
        </div>
    </div>
    <!-- Jssor Slider End -->

	<h1>Home Ground에 <span>오신걸 환영합니다</span></h1>
	<div id="login">
	<form id="loginform" action="loginCheck.jsp" method="post">
		<input type="text" name="userid" id="userid" placeholder="아이디를 입력하세요" title="아이디를 입력하세요" maxlength="12" />
		<input type="password" name="userpw" id="userpw" placeholder="비밀번호를 입력하세요" title="비밀번호를 입력하세요" maxlength="12"/>
		<input type="submit" value="로그인" title="로그인" id="login_box" class="btn btn-primary"/>
		<!--  input type="checkbox" name="check" id="check" /> <span class="idsave">아이디 저장</span -->
		<!-- span class="pwsch"><a href="#">비밀번호 찾기</a></span-->
	</form>
		<h3>Home Ground 처음이세요?</h3> 
		<form action="register/createUserForm.jsp" method="post">

			<input type="submit" value="회원가입하기" title="회원가입" id="join_box" class="btn btn-primary"/>
		</form>
	</div>


</body>
</html>