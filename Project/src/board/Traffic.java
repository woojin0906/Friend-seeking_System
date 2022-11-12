package board;

import java.sql.Date;

public class Traffic {

	private int number = 0;
	private String nickName = "";
	private String title = "";
	private String promiseTime = "";
	private String writeTime = "";
	private String count = "";
	private String sex = "";
	private String start = "";
	private String dest = "";
	private String main = "";
	private String category = "";
	
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getPromiseTime() {
		return promiseTime;
	}
	public String getPromiseTime() {
		return promiseTime;
	}
	public void setPromiseTime(String promiseTime) {
		this.promiseTime = promiseTime;
	}
	public String getWriteTime() {
		return writeTime;
	}
	public void setWriteTime(String writeTime) {
		this.writeTime = writeTime;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getDest() {
		return dest;
	}
	public void setDest(String dest) {
		this.dest = dest;
	}
	public String getMain() {
		return main;
	}
	public void setMain(String main) {
		this.main = main;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}
