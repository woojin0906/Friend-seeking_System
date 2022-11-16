<!-- 
	작성자: 김지웅
	회원 가입에 필요한 정보를 입력하고 유효성 검사 및 signupCheck로 데이터 전송하는 페이지
 -->
<%@ page import="encrytion.SHA256"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.security.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>sign up</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
			
			String id = request.getParameter("_id");
			String pwd = request.getParameter("_pwd");
			String nickname = request.getParameter("_nickname");
			String name = request.getParameter("_name");
			String sex = request.getParameter("_sex");
			String tel = request.getParameter("_tel");
			
			if( id == null ) id="";
			if( pwd == null ) pwd="";
			if( nickname == null) nickname="";
			if( name == null ) name="";
			if (sex == null ) sex=""; 
			if( tel == null ) tel="";
			
			// sha256 객체를 생성
			SHA256 sha256 = new SHA256();
			
			try {
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				PreparedStatement pstmt = null;
				boolean infoState = true, infoState2 = true;
				String infoMsg;
				String sql;
				
				// 모든 데이터가 받아와졌는지 확인
				if( !id.equals("") && !pwd.equals("") && !nickname.equals("") && 
						!name.equals("") && !sex.equals("") && !tel.equals("")){
					Class.forName("com.mysql.cj.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/friend";
					conn  = DriverManager.getConnection(url, "friends", "2022server");
					
					// member 테이블의 모든 id를 가져옴
					sql = "select id from member";
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					
					// 입력한 id가 이미 사용중인지 확인
					while(rs.next()){
		               	String user = rs.getString(1);
						if(user.equals(id)){
							infoState = false;
							break;
						}
		            }
					
					// member 테이블의 모든 닉네임을 가져옴
					sql = "select nickname from member";
					rs = stmt.executeQuery(sql);
					
					// 입력한 닉네임이 이미 사용중인지 확인
					while(rs.next()){
		               	String nick = rs.getString(1);
						if(nick.equals(nickname)){
							infoState2 = false;
							break;
						}
		            }
					
					// id와 닉네임이 모두 중복이 아니라면 member 테이블에 회원정보 삽입
					if(infoState && infoState2) {
						// 비밀번호를 SHA256 일방향 해시 암호로 암호화 처리
						String encPwd = sha256.enc256(pwd);
						
						sql = "insert into member values('" 
						+ id + "','" +  encPwd + "','" + name + "','" + sex + "','" + tel
						+ "','" + nickname + "')";
						
						pstmt = conn.prepareStatement(sql);
						pstmt.executeUpdate();
						request.setAttribute("_res", "완료");
						pageContext.forward("signUp.jsp");
					}
					else {
						if(infoState == false && infoState2 == false){
							request.setAttribute("_res", "중복 아이디,닉네임");
							pageContext.forward("signUp.jsp");
						}
						else if(infoState == false){
							request.setAttribute("_res", "중복 아이디");
							pageContext.forward("signUp.jsp");
						}
						else if(infoState2 == false){ 
							request.setAttribute("_res", "중복 닉네임");
							pageContext.forward("signUp.jsp");
						}
					}
				}
					
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</body>
</html>