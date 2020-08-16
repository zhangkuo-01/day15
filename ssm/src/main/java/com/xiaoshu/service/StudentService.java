package com.xiaoshu.service;

import java.util.List;

import javax.jms.Destination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaoshu.dao.StudentMapper;
import com.xiaoshu.dao.TeacherMapper;
import com.xiaoshu.entity.Student;
import com.xiaoshu.entity.StudentVo;
import com.xiaoshu.entity.Teacher;

@Service
public class StudentService {

	@Autowired
	StudentMapper studentMapper;
	
	@Autowired
	TeacherMapper teacherMapper;
	
	@Autowired
	JmsTemplate jmsTemplate;
	
	@Autowired
	Destination queueTextDestination;
	
	public List<Teacher> findCourseAll() {
		// TODO Auto-generated method stub
		return teacherMapper.selectAll();
	}

	public PageInfo<StudentVo> findStudentVoPage(StudentVo studentVo, Integer pageNum, Integer pageSize,
			String ordername, String order) {
			PageHelper.startPage(pageNum, pageSize);
			List<StudentVo> userList = studentMapper.findStudentVoAll(studentVo);
			PageInfo<StudentVo> pageInfo = new PageInfo<StudentVo>(userList);
			return pageInfo;
	}

	public void addStudent(Student student) {
		// TODO Auto-generated method stub
		studentMapper.insert(student);
		student = studentMapper.selectOne(student);
		jmsTemplate.convertAndSend(queueTextDestination, JSONObject.toJSONString(student));
	}

	public void updateStudent(Student student) {
		// TODO Auto-generated method stub
		studentMapper.updateByPrimaryKey(student);
	}

	public Student findByName(String name) {
		// TODO Auto-generated method stub
		Student student = new Student();
		student.setCode(name);
		
		return studentMapper.selectOne(student);
	}

	public void addTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		teacherMapper.insert(teacher);
	}

	public List<StudentVo> countStudent() {
		// TODO Auto-generated method stub
		return studentMapper.countStudent();
	}
	
}
