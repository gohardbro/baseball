<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>signup</title>
<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/heroes/">



<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.text-muted {
	font-size: 12px;
}

.authKey_send_btn {
	display: block;
}

.auth_wrapper {
	margin-top: 10px;
}

.authKey_confirm_btn {
	height: 33px;
	margin: 8px 0;
}

.member-header {
	text-align: center;
}

.member-logo {
	margin: 47px 0 auto;
}

.pw_rule {
	display: none;
}
</style>



</head>
<body>


	<div class="container col-xl-10 col-xxl-8 px-4 py-5">
		<div class="row align-items-center g-lg-5 py-5">
			<header class="member-header">
				<h1 class="member-logo">
					<a class="member-logo_link" href="/home"> <img alt="tigers"
						src="images/wordmark.jpg" width="300px" height="100px">
					</a>
				</h1>
			</header>
			<div class="col-md-10 mx-auto col-lg-5">
				<form:form class="p-4 p-md-5 border rounded-3 bg-light"
					id="signup_Form" action="/signup" method="post"
					modelAttribute="accountVo">
					<div class="form-floating mb-3">
						<form:input type="text" class="email_input form-control"
							id="floatingInput" placeholder="name@example.com" path="id"/>
						<label for="floatingInput">아이디(이메일)</label>
						<form:errors path="id" />
						<div class="auth_wrapper">
							<button type="button"
								class="authKey_send_btn btn btn-secondary mb-2" id="req">이메일
								인증키 발송</button>
							<input type="text" class="authKey_input form-control"
								id="validationServer01 floatingInput"
								aria-describedby="validationServer01Feedback" placeholder="인증키"
								required>
							<div id="validationServer01Feedback" class="invalid-feedback">
								인증키가 일치하지 않습니다.</div>
							<button type="button"
								class="authKey_confirm_btn btn btn-secondary mb-2" id="reqOk">인증키
								확인</button>
						</div>
					</div>
					<small class="pw_rule">비밀번호: 영문 대,소문자와 숫자, 특수기호가 적어도 1개 이상씩
						포함된 8자 ~ 20자</small>
					<div class="form-floating mb-3">
						<form:input type="password" class="password form-control"
							placeholder="Password" path="pw" onfocus="display_pw_rule()" />
						<label for="floatingPassword">비밀번호</label>
						<form:errors path="pw" />
					</div>
					<div class="form-floating mb-3">
						<input type="password" class="passwordAgain form-control"
							id="validationServer02 floatingInput"
							aria-describedby="validationServer02Feedback"
							placeholder="Password"> <label for="floatingPassword">비밀번호확인</label>
						<div id="validationServer02Feedback" class="invalid-feedback">
							비밀번호가 일치하지 않습니다.</div>
					</div>
					<div class="form-floating mb-3">
						<form:input type="text" class="nickname form-control"
							id="validationServer03 floatingInput"
							aria-describedby="validationServer03Feedback"
							placeholder="name@example.com" path="nickname"
							onkeyup="nicknameCheck()" />
						<label for="floatingInput">닉네임</label>
						<div id="validationServer03Feedback" class="invalid-feedback nickname_feedback_invalid">
							해당 닉네임이 이미 있습니다.</div>
						<div id="validationServer03Feedback" class="valid-feedback nickname_feedback_valid">
							사용가능한 닉네임 입니다.</div>
						<form:errors path="nickname" />
					</div>
					<div class="form-floating mb-3">
						<form:input type="text" class="phone form-control"
							id="validationServer04 floatingInput" path="phone"
							aria-describedby="validationServer04Feedback"
							placeholder="name@example.com" />
						<label for="floatingInput">휴대폰 번호</label>
						<div id="validationServer04Feedback" class="invalid-feedback">
							validationServer04Feedback invalid</div>
						<div id="validationServer04Feedback" class="valid-feedback">
							validationServer04Feedback valid</div>
						<form:errors path="phone" />
					</div>
					
					<button class="w-100 btn btn-lg btn-primary" type="button"
						id="confirmBtn">가입하기</button>
					<hr class="my-4">
					<small class="text-muted">@KiaTigers Corp. All rights
						reserved.</small>
				</form:form>
			</div>
		</div>
	</div>

	<div class="b-example-divider"></div>


	
	<div class="b-example-divider mb-0"></div>

	<script>
		
		
		/* 이메일 양식 유효성검사 */
		function verifyEmail() {
			var id = $(".email_input").val();

			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

			if (id.match(regExp) != null) {
				return true;
			} else {
				return false;
			}
		};
		
		/* 닉네임 양식 유효성검사 */
		function verifyNickname(){
			var nickname = $(".nickname").val();
			
			var regExp = /^[\wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/; /* 특문 제외 2자 ~ 20자 */
			
			if (nickname.match(regExp) != null) {
				return true;
			} else {
				return false;
			}
		}
		
		/* 폰번호 양식 유효성검사 */
		function verifyPhone(){
			var phone = $(".phone").val();
			
			var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/; 
			
			if (phone.match(regExp) != null) {
				return true;
			} else {
				return false;
			}
		}
		

		/* 이메일 인증키 발송 */
		$("#req").click(function() {
			if (verifyEmail() == true) { /* 이메일유효성검사 통과시 true */

				var id = $(".email_input").val();
				console.log(id);

				$.ajax({
					type : "POST",
					url : "/signup/auth",
					data : {
						email : id,
					},
					success : function(res) {
						alert("인증키 메일전송완료");
						console.log(res);
						$("#reqOk").click(function() {
							var written_authKey = $(".authKey_input").val()
							console.log(written_authKey);
							console.log(res);
							if (written_authKey == res) {
								$(".email_input").addClass("is-valid");
								$(".authKey_input").addClass("is-valid");
								$(".email_input").attr("readonly", "true");
								$(".authKey_input").attr("readonly", "true");
							} else {
								$(".email_input").addClass("is-invalid");
								$(".authKey_input").addClass("is-invalid");
							}
						});

					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("인증키 통신 실패.")
					}
				});
			} else {
				alert("아이디는 이메일만 가능합니다.");
			}
		});
		
		/* 비밀번호재확인 */
		$(".passwordAgain").keyup(function() {
			var password = $(".password").val();
			var passwordAgain = $(".passwordAgain").val();
			if (passwordAgain != password) {
				$(".passwordAgain").removeClass("is-valid");
				$(".passwordAgain").addClass("is-invalid");
			} else {
				$(".passwordAgain").removeClass("is-invalid");
				$(".passwordAgain").addClass("is-valid");
			}
		});

		/* 닉네임 중복체크 */
		function nicknameCheck() {
			var nickname_input = $(".nickname").val();

			$.ajax({
				type : "POST",
				url : "/signup/nicknameCheck",
				data : {
					nickname : nickname_input
				},
				success : function(cnt) {
					console.log(cnt);
					if (cnt == 0) { /* cnt = DB에 해당닉네임 개수 */
						$(".nickname_feedback_valid").text("사용가능한 닉네임 입니다.");
						$(".nickname").removeClass("is-invalid");
						$(".nickname").addClass("is-valid");
						if(verifyNickname() == false){   /* 닉네임 유효성검사 성공시 true반환 */
							$(".nickname_feedback_invalid").text("닉네임은 특수문자 제외 2자 ~ 20자"); 
							$(".nickname").removeClass("is-valid");
							$(".nickname").addClass("is-invalid");
						}
					} else {
						$(".nickname_feedback_invalid").text("해당 닉네임이 이미 있습니다."); 
						$(".nickname").removeClass("is-valid");
						$(".nickname").addClass("is-invalid");
					}

				},
				error : function() {
					alert("닉네임중복체크 에러입니다");
				}
			});
		};

		$("#confirmBtn")
				.on(
						"click",
						function() {
							var elements = [ $(".email_input").attr("class"),
									$(".authKey_input").attr("class"),
									$(".passwordAgain").attr("class"),
									$(".nickname").attr("class") ];

							var classSearch = [];

							for (var i = 0; i < elements.length; i++) {
								classSearch[i] = elements[i].indexOf("is-valid"); /* indexof값을 못찾으면 -1을 반환함 */

								
							}
							if (classSearch[0] != -1
									&& classSearch[1] != -1
									&& classSearch[2] != -1
									&& classSearch[3] != -1) {
								$("#signup_Form").submit();
								console.log("서브밋까진 성공");

							} else {
								console.log(classSearch[0]);
								console.log(classSearch[1]);
								console.log(classSearch[2]);
								console.log(classSearch[3]);
								alert("회원가입실패");
								
							}

						});

		function display_pw_rule() {
			$(".pw_rule").css("display", "inline-block");

		}
	</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>


</body>
</html>