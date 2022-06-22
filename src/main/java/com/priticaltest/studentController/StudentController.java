package com.priticaltest.studentController;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.priticaltest.bean.StudentBean;
import com.priticaltest.studenetservice.StudentService;

@Controller
public class StudentController {

	@Autowired
	StudentService studentService;
	Logger logger = LoggerFactory.getLogger(StudentController.class);

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model m) {

		List<StudentBean> studentlist = studentService.findbyallStudent();
		m.addAttribute("studentlist", studentlist);
		m.addAttribute("studentBean", new StudentBean());
		return "home";
	}

	@RequestMapping(value = "/datainsert", method = RequestMethod.POST)
	public ResponseEntity<?> dataInsert(@RequestBody StudentBean studentBean) {
		System.out.println("multipartFile1:::::::::::::::" + studentBean);
		
		int status = studentService.insertEmplyees(studentBean);
		if(status > 0) {
			List<StudentBean> studentlist = studentService.findbyallStudent();
			Gson gson = new Gson();
			String json = gson.toJson(studentlist);
			return ResponseEntity.ok(json);
		}else {
			return ResponseEntity.ok(400);
		}
		
	}

	
	@RequestMapping(value = "/getAllrecord", method = RequestMethod.POST)
	public ResponseEntity<?> getAllRecords() {
		List<StudentBean> studentlist = studentService.findbyallStudent();
		logger.info("HERE:::::::::::::::::::::::::" + studentlist);
		Gson gson = new Gson();
		String json = gson.toJson(studentlist);
		logger.info("json:::::::::::::::::::::::::" + json);
		return ResponseEntity.ok(json);
	}

	
	@RequestMapping(value = "/deleteRecord", method = RequestMethod.POST)
	public ResponseEntity<?> DeleteFercord(Model m, @RequestParam(name = "id", required = true) int id) {
		int stats = studentService.deletebyId(id);
        logger.info("record deletecd "+stats );
		if(stats > 0) {
			List<StudentBean> studentlist = studentService.findbyallStudent();
			Gson gson = new Gson();
			String json = gson.toJson(studentlist);
			return ResponseEntity.ok(json);
		}else {
			return ResponseEntity.ok(400);
		}
	}
	
	
	@RequestMapping(value ="/editStudentForm" , method = RequestMethod.POST)
	public ResponseEntity<?> EiditRecord(Model m, StudentBean studentBean,@RequestParam (name="id")String id){
		
		logger.info("Edit optoin data&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"+id);

		StudentBean status = studentService.findbyAllStudentId(id);
		
	    return ResponseEntity.ok(status);	
		
	}
	
	
	
	@RequestMapping (value = "/UpdateStudentRecord", method = RequestMethod.POST )
	public ResponseEntity<?> EditRecod(Model m,@RequestBody StudentBean studentBean) {
	
		int status = studentService.upadteStudentData(studentBean);
		
	
	   if(status > 0) {
		return ResponseEntity.ok(200);	
	}
	else {
		return ResponseEntity.ok(400);
	}

}

}
