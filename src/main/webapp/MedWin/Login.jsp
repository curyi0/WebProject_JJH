<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="kor">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
      body {
        font-family: Arial, sans-serif;
        background-color: #f0f2ff;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .container {
        background-color: white;
        padding: 2rem;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 400px;
      }
      h1 {
        text-align: center;
        color: #1a73e1;
        margin-bottom: 1.5rem;
      }
      .form-group {
        margin-bottom: 1rem;
      }
      label {
        display: block;
        margin-bottom: 0.5rem;
        color: #333;
      }
      input {
        width: 100%;
        padding: 0.75rem;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 1rem;
      }
      input:focus {
        outline: none;
        border-color: #1a73e8;
      }
      //새로 고침버튼 꾸미기 
      button {
        width: 100%;
        padding: 0.75rem;
        background-color: #1a73e8;
        color: white;
        border: none;
        border-radius: 4px;
        font-size: 1rem;
        cursor: pointer;
        transition: background-color 0.2s;
      }

      button:hover {
        background-color: #1557b0;
      }

      .captcha-container {
        margin: 1rem 0;
        padding: 1rem;
        background-color: #f8f9fa;
        border-radius: 4px;
      }

      .captcha-image {
        background-color: rgb(248, 242, 248);
        padding: 0;
        text-align: center;
        font-size: 1.5rem;
        font-family: "Courier New", monospace;
        letter-spacing: 3px;
        position: relative;
        user-select: none;
      }

      .captcha-image::before {
        content: "";
        position: absolute;
        top: 50%;
        left: 0;
        right: 0;
        height: 2px;
        background: #1a73e8;
        transform: rotate(-5deg);
      }

      .refresh-captcha {
        background: none;
        border: none;
        color: #1a73e8;
        cursor: pointer;
        font-size: 0.9rem;
        padding: 0.5rem;
        margin-top: 0.5rem;
      }

      .captcha-input {
        width: 100%;
        margin-top: 0.5rem;
      }

      .error-message {
        color: #dc3545;
        font-size: 0.875rem;
        margin-top: 0.25rem;
        display: none;
      }

      .social-login {
        margin-top: 1.5rem;
        text-align: center;
      }
      //
      .social-btn {
        margin: 0.5rem;
        padding: 0.7rem ;
        border: 1px solid #ddd;
        background-color: white;
        color: #333;
        cursor: pointer;
      }

      .links {
        margin-top: 1rem;
        text-align: center;
      }

      .links a {
        color: #1a73e8;
        text-decoration: none;
        margin: 0 0.5rem;
      }

      .links a:hover {
        text-decoration: underline;
      }
   <!-- 비밀번호 보기 css -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

   <!-- 비밀번호 눈표시 -->
   <style>
       .input-group.password {
           position: relative;
       }
    .input-group.password .eyes {
           position: absolute;
           top: 0;
           bottom: 0;
           right: 10px;
           margin: auto;
           height: 30px;
           font-size: 22px;
           cursor: pointer;
           display: flex;
           align-items: center;
       }
    </style>
  </head>
  
  <body>
   <!--액션태그로 파일공유-->
 
  
    <div class="container">
      <h1>로그인</h1>
      <form action="./Login.do" method="post" >
        <div class="form-group">
          <label for="id">아이디</label>
          <input
            type="text"
            name="Id"
            required
            placeholder="id를 입력하세요."/>
        </div>
        <div class="form-group"><div class="input-group mb-4 password">
        
          <label for="password" >
          비밀번호 
          </label>
          <input
            type="password"  class="form-control login"
            name="pass"
            required
            placeholder="비밀번호를 입력해주세요"/> <!-- div class="eyes"><i class="fa fa-eye fa-lg"></i></div-->
        </div></div>
        
        <div class="captcha-container">
          <label>보안 문자 입력</label>
          <canvas id="captcha-container" width="200" height="50"></canvas>
          <div class="captcha_image" id="captchaImage"></div>
          <button
            type="button" width="150" height="70"
            class="refresh-captcha"
            onclick="generateCaptcha()">새로고침
          </button>
          
        <input type="text" id="captchaInput" class="captcha-input"
        required placeholder="위 문자를 입력하세요..">
        <div class="error-message" id="captchaError">잘못된 보안문자입니다! 다시시도해주세요.</div>
        </div>
        <button class="btn btn-outline-success me-2" type="submit" >로그인</button>
      </form>
	
      <div class="social-login">
        <button class="social-btn">구글</button>
        <button class="social-btn">트위터</button>
      </div>

      <div class="links">
        <a href="#">아이디 찾기</a>
        <a href="#">비밀번호 찾기</a>
        <a href="./signup.do" method="post">회원가입 </a></div>
    </div>
  
  
  
    <script>
         let captchaText= '';

        function generateCaptcha(){  //캡차 보안 문자 생성
            const canvas= document.getElementById('captcha-container');
            const ctx= canvas.getContext('2d');
            ctx.clearRect(0,0 ,canvas.width, canvas.height);

            /*  document.getElementById('captchaImage').textContent=captchaText;
             document.getElementById('captchaInput').value='';
              document.getElementById('captchaError').style.display= 'none';
            */
            ctx.fillStyle='#f0f0f0';
            for (let i=0; i<100; i++){
                ctx.fillRect(
                    Math.random()*canvas.width, Math.random()*canvas.height,
                    2,2
                );
            }
            //랜덤 문자
            const chars= '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
            captchaText='';
            for( let i=0; i<6; i++){
                captchaText +=chars.charAt(Math.floor(Math.random()*chars.length));
            }


            ctx.font='bold 35px Roboto';
            ctx.fillStyle='#555';
            ctx.textBaseline='middle';
            ctx.textAlign='center';
            
            // 보안 문자 기울
            for( let i =0; i<captchaText.length; i++){
                const x=(canvas.width/6)* (i+0.5);
                const y= canvas.height/2+ (Math.random()* 10- 5);
                const rotation=( Math.random()*30-15)* Math.PI/180;

                ctx.save();
                ctx.translate(x,y);
                ctx.fillText(captchaText[i], 0, 0);
                ctx.restore();
            }

            // 방해선 추가
            ctx.strokeStyle = '#678';
            ctx.lineWidth = 3;    
            for (let i = 0; i < 3; i++) {
                ctx.beginPath();
                ctx.moveTo(0, Math.random() * canvas.height);
                ctx.bezierCurveTo(
                    canvas.width/3, Math.random() * canvas.height,
                    canvas.width*2/3, Math.random() * canvas.height,
                    canvas.width, Math.random() * canvas.height
                );
                ctx.stroke();
            }
        } 
// 페이지 리로드 시 ,조건별 캡차 생성
        window.onload= generateCaptcha;

        function validateCaptcha(){
            const userInput= document.getElementById('captchaInput').value;
            if (userInput== captchaText){
                document.getElementById('captchaError').style.display='none';
                return true;
            }
            else{
                document.getElementById('captchaError').style.display='block';
                generateCaptcha();
                return false;
            }
        }

    document.getElementById('Login').addEventListener('submit', function(e){
        e.preventDefault();

        const email= document.getElementById('email').value;
        const password= document.getElementById('password').value;
        const captchaInput= document.getElementById('captcha-input').value;
        const captchaError= document.getElementById('captcha-error').value;
        
        // if(validateCaptcha()){
        //     const email= document.getElementById('email').value;
        //     const password= document.getElementById('password').value;
        if(captchaInput.toLowerCase()== captchaText.toLowerCase()){
          captchaError.style.display= 'none';
        
            console.log('로그인시도:', email);
        }
        else{
          captchaError.style.display='block';
          generateCaptcha();
          document.getElementById('captcha-input').value='';
        }
      });
    </script>
  </body>
</html>
