package com.dao;


import com.pojo.Paper;
import com.tools.DBHelper;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

public class PaperDAOlmpl extends Dao implements PaperDAO  {

	@Override
	public void add(Paper paper) {
		// TODO Auto-generated method stub
		super.add(paper);

	}

	@Override
	public Paper get(int id) {
		// TODO Auto-generated method stub
		return (Paper) super.select(Paper.class, id);
	}

	@Override
	public void delete(Paper paper) {
		super.del(paper);

	}

	@Override
	public void update(Paper paper) {
		super.update(paper);

	}
	
	public List findPaperList(){
		Session session= DBHelper.getSession();
		session.clear();
		String hql = "from Paper";
		Query query = session.createQuery(hql);
		List list = query.list();
		return list;
		
	}

}
