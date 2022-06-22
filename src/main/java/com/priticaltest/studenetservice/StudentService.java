package com.priticaltest.studenetservice;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.priticaltest.bean.StudentBean;
import com.priticaltest.studentDao.StudentDao;

@Service
public class StudentService {
	static Logger logger = LoggerFactory.getLogger(StudentService.class);
	
	@Autowired
	StudentDao studentDao ;

	public int insertEmplyees(StudentBean studentBean) {
		
		
		return studentDao.insertEmplyees(studentBean);
	}

	public List<StudentBean> findbyallStudent() {
	
		return studentDao.findbyallStudent();
	}

	public int deletebyId(int id) {
	
		return studentDao.deletebyId(id);
	}


	public StudentBean findbyAllStudentId(String id) {
	
		return studentDao.findbyAllStudentId(id);
	}

	public int upadteStudentData(StudentBean studentBean) {
		
		return studentDao.upadteStudentData(studentBean);
	}

	

	
}
