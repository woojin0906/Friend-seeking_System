<!-- 
	작성자: 김지웅
	loginFrame으로부터 데이터를 받고 로그인을 검증하는 페이지
 -->
<%@ page import="encrytion.SHA256"%>
<%@ page import="encrytion.RSA"%>
<%@ page import="java.security.PrivateKey"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
			
			// 암호문을 받고 복호화 해 평문을 얻는 코드 (JSP 스크립트릿 영역, Language: Java)
			// 암호화 된 ID, PWD값을 받아옴
			String RSAID = request.getParameter("_RSAID");
			String RSAPW = request.getParameter("_RSAPW");

			// nullExceptioin 방지
			if( RSAID == null ) RSAID="";
			if( RSAPW == null ) RSAPW="";
			
			// 세션 객체로부터 저장된 개인키를 받고 중복 방지를 위해 저장된 개인키 제거
			PrivateKey privateKey = (PrivateKey) session.getAttribute("privateKey");
			session.removeAttribute("privateKey");
			
			// 개인키를 받아오지 못 하였을 때의 에러제어
			if (privateKey == null) {
				System.out.println("비밀키 정보를 찾을 수 없습니다.");
	        }
			
			// rsa 객체를 생성하고 rsa객체의 decryptRsa 메서드 호출해 복호화 진행
			RSA rsa = new RSA();
			String id = rsa.decryptRsa(privateKey, RSAID); 
			String pwd = rsa.decryptRsa(privateKey, RSAPW);
			
			// sha256 객체를 생성
			SHA256 sha256 = new SHA256();
			
			try {
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				String sql;
				boolean idCheck = false, pwdCheck = false;
				
				if( !id.equals("") && !pwd.equals("")) {
					
					// loginFram에서 입력받은 패스워드를 SHA256 일방향 해시 암호로 암호화
					String encPwd = sha256.enc256(pwd);
					
					// DB 연결 정보 설정 및 연결
					Class.forName("com.mysql.cj.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/friend";
					conn  = DriverManager.getConnection(url, "friends", "2022server");
					
					// 쿼리문 작성 후 해당 쿼리문 질의
					sql = "select id from member";
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					
					// 질의 결과값을 가져와 loginFrame.jsp로부터 입력받은 id와 일치하는 id가 있는지 체크
					// 있다면 비밀번호 비교, 없다면 아이디 불일치 출력
					while(rs.next()){
		               	String user = rs.getString(1);
						if(user.equals(id)){
							idCheck = true;
							break;
						}
		            }
					
					// DB에 저장된 SHA256 해시 암호로 암호화 된 패스워드를 받아옴
					if(idCheck) {
						sql = "select password from member where id='" + id + "'";
						rs = stmt.executeQuery(sql);
						
						// SHA256 해시 암호로 암호화 된 두 비밀번호를 비교하여 서로 같으면 로그인 성공 처리
						while(rs.next()){
			               	String password = rs.getString(1); 
			               	if(password.equals(encPwd)){
								pwdCheck = true;
							}
			            }
						
						if(pwdCheck) {
							
							// 닉네임을 받아와 세션에 저장하고, ID도 세션에 저장
							// MainPage로 이동
							sql = "select nickname from member where id='" + id + "'";
							rs = stmt.executeQuery(sql);
							String nickname = null;
							
							while(rs.next()){
				               	nickname = rs.getString(1);
							}
							
							session.setAttribute("ID", id);
							session.setAttribute("NICK", nickname);
							response.sendRedirect("../MainPage.jsp");
						} else{
							request.setAttribute("_res", "비밀번호 불일치");
							pageContext.forward("loginFrame.jsp");
						}
					} else {
							request.setAttribute("_res", "아이디 불일치");
							pageContext.forward("loginFrame.jsp");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</body>
</html>