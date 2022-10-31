package com.cozy.www.user;

import java.io.PrintWriter;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Component
public class MailSendService {
   @Autowired
   private JavaMailSenderImpl mailSender;
   private int authNumber; 
   @Autowired
   private UserService userService;
   // 난수 발생(여러분들 맘대러)
   
      public void makeRandomNumber() {
         // 난수의 범위 111111 ~ 999999 (6자리 난수)
         Random r = new Random();
         int checkNum = r.nextInt(888888) + 111111;
         System.out.println("인증번호 : " + checkNum);
         authNumber = checkNum;
      }
      
      
            //이메일 보낼 양식! 
      public String joinEmail(String email) {
         makeRandomNumber();
         String setFrom = "sunakkkk0000@naver.com"; // email-config에 설정한 자신의 이메일 주소를 입력 <!--  yjg5858@naver.com  -->
         String toMail = email;
         String title = "회원 가입 인증 이메일 입니다."; // 이메일 제목 
         String content = 
               "홈페이지를 방문해주셔서 감사합니다." +    //html 형식으로 작성 ! 
                   "<br><br>" + 
                "인증 번호는 " + authNumber + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
         mailSend(setFrom, toMail, title, content);          
         return Integer.toString(authNumber);
         
      }
      
      //이메일 보낼 양식! 
      public String pwdEmail(String umail, String umail2, String uid, Model model, UserVO vo, HttpServletResponse response, String msg, String url) throws Exception{
         makeRandomNumber();
         
         String setFrom = "sunakkkk0000@naver.com"; // email-config에 설정한 자신의 이메일 주소를 입력 <!--  yjg5858@naver.com  -->
         String toMail = umail+umail2;
         String title = "임시 비밀번호 입니다."; // 이메일 제목 
         String content = 
               "홈페이지를 방문해주셔서 감사합니다." +    //html 형식으로 작성 ! 
                   "<br><br>" + 
                "임시 비밀번호는 " + authNumber + "입니다." + 
                "<br>" + 
                "해당 비밀번호로 로그인후 꼭 비밀번호를 변경해주세요."; //이메일 내용 삽입
         mailSend(setFrom, toMail, title, content);
         String pw = Integer.toString(authNumber);
         vo.setUid(uid);
         vo.setUmail(umail+umail2);
         vo.setUpwd(pw);
         System.out.println("서비스"+uid+umail+umail2+pw);
         model.addAttribute("pwdEmail", userService.pwdUpdate(vo));
          String ms = "회원님 임시비밀번호가 발송되었습니다.";
            response.setContentType("text/html; charset=utf-8");
             PrintWriter w = response.getWriter();
             w.write("<script>alert('"+ms+"');location.href=\"loginForm\";</script>");
             w.flush();
             w.close();
         return "user/loginForm";
         
      }
      //이메일 보낼 양식! 
            public String idEmail(String result, String email, Model model, UserVO vo, HttpServletResponse response, String msg, String url) throws Exception{
               makeRandomNumber();
               
               String setFrom = "sunakkkk0000@naver.com"; // email-config에 설정한 자신의 이메일 주소를 입력 <!--  yjg5858@naver.com  -->
               String toMail = email;
               String title = "아이디 찾기 결과입니다."; // 이메일 제목 
               String content = 
                     "홈페이지를 방문해주셔서 감사합니다." +    //html 형식으로 작성 ! 
                         "<br><br>" + 
                      "현재 아이디는 " + result + "입니다." + 
                      "<br>" + 
                      "감사합니다."; //이메일 내용 삽입
               mailSend(setFrom, toMail, title, content);
                 String ms = "회원님 아이디가 발송되었습니다.";
                  response.setContentType("text/html; charset=utf-8");
                   PrintWriter w = response.getWriter();
                   w.write("<script>alert('"+ms+"');location.href=\"loginForm\";</script>");
                   w.flush();
                   w.close();
               return "user/loginForm";
               
            }
      
      //이메일 전송 메소드
      public void mailSend(String setFrom, String toMail, String title, String content) { 
         MimeMessage message = mailSender.createMimeMessage();
         // true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
         try {
            MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            // true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
            helper.setText(content,true);
            mailSender.send(message);
         } catch (MessagingException e) {
            e.printStackTrace();
         }
      }
      
   
}