package Dao;
import java.util.ArrayList;
import java.util.List;
import java.util.TimeZone;

import javax.sound.midi.MidiDevice.Info;

import jdbc.JdbcUtil;
import mod.*;
public class dao {
	JdbcUtil jdbc=new JdbcUtil();
	//用户表
	
	//增
    public int addUser(String name,String pass,Integer permission) {
        int t;
      	String	sql="INSERT INTO user(name, pass,permission) VALUES(?,?,?)";
  		t=jdbc.updatePreparedStatement(sql, name,pass,permission);
  		return t;		
  	}
	//删
    public int deleteUser(String userName) {
    	int t;
    	String sql="DELETE FROM user where name=?";
    	t=jdbc.updatePreparedStatement(sql, userName);
    	sql="DELETE * from student where name=?;";  	
    	t=jdbc.updatePreparedStatement(sql, userName);
		return t;
		
	}
	//改
    public int updateUserName(String oldUserName,String newUserName) {
    	int t=0;
    	String sql="update user set name= ? where name =?;";
    	t=jdbc.updatePreparedStatement(sql,newUserName,oldUserName);
		return t;
	}
    public int updateUserPass(String userName,String userPass) {
    	int t=0;
    	String sql="update user set pass= ? where name =?;";
    	t=jdbc.updatePreparedStatement(sql,userPass,userName);
		return t;
	}
    public int updateUserPermission(String userName,int permission) {
    	int t=0;
    	String sql="update user set permission= ? where name =?;";
    	t=jdbc.updatePreparedStatement(sql,permission,userName);
		return t;
	}
	//查
    public List<user> selectAllUser() {
    	String sql="select * from user;";   	
    	List<user> type= jdbc.queryPreparedStatement(sql, user.class);
		return type;
	}
    public List<user> selectUser(String name) {
    	String sql="select * from user where name=?;";
    	List<user> type= jdbc.queryPreparedStatement(sql, user.class, name);
		return type;
	}
	//学生表
	
	//增
    public int addStudent(int sno,String sname,String userName) {
        int t;
      	String	sql="INSERT INTO student(sno,sname,name) VALUES(?,?,?)";
  		t=jdbc.updatePreparedStatement(sql, sno,sname,userName);
  		return t;		
  	}
	//删
    public int deleteStudent(Integer sno) {
    	int t;
    	List<student> types=selectStudentBySno(sno);
    	String userName="";
    	for(student type:types)
    	{
    		userName=type.getName();
    	}
    	t=deleteUser(userName);
    	t=deleteAllDiscussBySno(sno);
    	String sql="DELETE FROM student where sno=?";
    	t=jdbc.updatePreparedStatement(sql, sno);
		return t;
		
	}
	//改
    public int updateStudentName(int sno,String studentName) {
    	int t=0;
    	String sql="update student set sname= ? where sno =?;";
    	t=jdbc.updatePreparedStatement(sql,studentName,sno);
		return t;
	}
    public int updateStudentSno(int oldSno,int newSno) {
    	int t=0;
    	String sql="update student set sno= ? where sno =?;";
    	t=jdbc.updatePreparedStatement(sql,newSno,oldSno);
		return t;
	}
    public int updateStudentUserName(int newSno,String newUserName) {
    	int t=0;
    	String sql="update student set name= ? where sno =?;";
    	t=jdbc.updatePreparedStatement(sql,newUserName,newSno);
		return t;
	}
	//查
    public List<student> selectAllStudent() {
    	String sql="select * from student;";   	
    	List<student> type= jdbc.queryPreparedStatement(sql, student.class);
		return type;
	}
    public List<student> selectStudentBySno(int sno) {
    	String sql="select * from student where sno=?;";  	
    	List<student> type= jdbc.queryPreparedStatement(sql, student.class, sno);
		return type;
	}
    
    public List<student> selectStudentByUserName(String userName) {
    	String sql="select * from student where name=?;";  	
    	List<student> type= jdbc.queryPreparedStatement(sql, student.class, userName);
		return type;
	}
	//信息表
	
	//增
    public int addInformation(Integer ino,String iname) {
        int t;
      	String	sql="INSERT INTO information(ino, iname) VALUES(?,?)";
  		t=jdbc.updatePreparedStatement(sql, ino,iname);
  		return t;		
  	}
	//删
    public int deleteInformation(int ino) {
    	int t;
    	String sql="DELETE FROM information where ino=?";
    	t=jdbc.updatePreparedStatement(sql, ino);
		return t;
		
	}
	//改
    public int updateInformationName(int ino,String informationName) {
    	int t=0;
    	String sql="update information set iname= ? where ino =?;";
    	t=jdbc.updatePreparedStatement(sql,informationName,ino);
		return t;
	}
    public int updateInformationIno(int oldIno,int newIno) {
    	int t=0;
    	String sql="update information set ino= ? where ino =?;";
    	t=jdbc.updatePreparedStatement(sql,newIno,oldIno);
		return t;
	}
	//查
    public List<information> selectAlliInformations() {
    	String sql="select * from information;";   	
    	List<information> type= jdbc.queryPreparedStatement(sql, information.class);
		return type;
	}
    public List<information> selectiInformation(int ino) {
    	String sql="select * from information where ino=?;";  	
    	List<information> type= jdbc.queryPreparedStatement(sql, information.class, ino);
		return type;
	}
	//讨论表
	
	//增
    public int addDiscuss(Integer ino,Integer sno,String message,String time) {
        int t;
      	String	sql="INSERT INTO discuss(ino,sno,message,time) VALUES(?,?,?,?)";
  		t=jdbc.updatePreparedStatement(sql, ino,sno,message,time);
  		return t;		
  	}
	//删
    public int deleteAllDiscuss(int sno) {
    	int t;
    	String sql="DELETE FROM discuss where sno=?";
    	t=jdbc.updatePreparedStatement(sql, sno);
		return t;
		
	}
    public int deleteThisDiscuss(int sno,int ino,String time) {
    	int t;
    	String sql="DELETE FROM discuss where sno=? and ino=? and time=?;";
    	t=jdbc.updatePreparedStatement(sql, sno,ino,time);
		return t;
		
	}
    public int deleteTheseDiscuss(int sno,int ino) {
    	int t;
    	String sql="DELETE FROM discuss where sno=? and ino=?;";
    	t=jdbc.updatePreparedStatement(sql, sno,ino);
		return t;
		
	}
    public int deleteTheseDiscussByAdmin(int ino) {
    	int t;
    	String sql="DELETE FROM discuss where ino=?;";
    	t=jdbc.updatePreparedStatement(sql, ino);
		return t;
		
	}
    public int deleteAllDiscussBySno(int sno) {
    	int t;
    	String sql="DELETE FROM discuss where sno=?;";
    	t=jdbc.updatePreparedStatement(sql, sno);
		return t;
		
	}
	//改
    public int updateDiscuss(String time,String message,int ino,int sno,String oldTime) {
    	int t=0;
    	String sql="update discuss set time=?,message=? where ino =? and sno =? and time=?;";
    	t=jdbc.updatePreparedStatement(sql,time,message,ino,sno,oldTime);
		return t;
	}
    public int updateDiscusserSno(int oldSno,int newSno) {
    	int t=0;
    	String sql="update discuss set sno=? where sno =?;";
    	t=jdbc.updatePreparedStatement(sql,newSno,oldSno);
		return t;
	}

	//查
    public List<discuss> selectAlldDiscusses(int ino) {
    	String sql="select * from discuss where ino=?;";   	
    	List<discuss> type= jdbc.queryPreparedStatement(sql, discuss.class,ino);
		return type;
	}
    public List<discuss> selectDisscus(int sno) {
    	String sql="select * from discuss where sno=?;";  	
    	List<discuss> type= jdbc.queryPreparedStatement(sql, discuss.class, sno);
		return type;
	}
}
