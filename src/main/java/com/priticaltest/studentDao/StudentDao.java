package com.priticaltest.studentDao;

import java.sql.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.priticaltest.bean.StudentBean;

@Repository("StudentDao")
public class StudentDao {

	@Autowired(required = true)
	private JdbcTemplate jdbcTemplate;

	static Logger logger = LoggerFactory.getLogger(StudentDao.class);

	  public int insertEmplyees(StudentBean studentBean) {
		logger.info("StudentBean  ---------------------------->" + studentBean);
		String INSERT_QUERY = " INSERT INTO userstudent(name, email, mobileNo, date, address, country) VALUES (?, ?, ?, ?, ?, ?) ";

		return jdbcTemplate.update(INSERT_QUERY, studentBean.getName(), studentBean.getEmail(),
			studentBean.getMobileNo(), studentBean.getDate(), studentBean.getAddress(), studentBean.getCountry());
	}

	public List<StudentBean> findbyallStudent() {
		String SqlQuery = "select * from  userstudent";

		return jdbcTemplate.query(SqlQuery, new BeanPropertyRowMapper(StudentBean.class));
	}

	public int deletebyId(int id) {
		String sql = "delete from userstudent where id = ?";
		return jdbcTemplate.update(sql, id);
	}

	

     	public StudentBean findbyAllStudentId(String id) {
		if (id != null) {
			String sql = "Select * from userstudent where id=?";

			return (StudentBean) jdbcTemplate.queryForObject(sql, new Object[] { id },
					new BeanPropertyRowMapper(StudentBean.class));
		           }
		
		   else {

			String sql = "Select * from userstudent";
			return (StudentBean) jdbcTemplate.queryForObject(sql, new Object[] {},
					new BeanPropertyRowMapper(StudentBean.class));
		}

	}

	   public int upadteStudentData(StudentBean studentBean) {
		logger.info(">>>>>>>"+studentBean);
		String sql = "UPDATE userstudent set  name = ?, email = ?, mobileNo = ?, date = ?, address = ?, country = ? where id=?";
		return jdbcTemplate.update(sql, studentBean.getName(), studentBean.getEmail(), studentBean.getMobileNo(),
				studentBean.getDate(), studentBean.getAddress(), studentBean.getCountry(),studentBean.getId());
	}

}
