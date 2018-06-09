package com.dao;

import com.pojo.Question;
import com.tools.DBHelper;
import org.hibernate.*;
import org.hibernate.query.Query;

import java.util.List;


public class QuestionDAOlmpl extends Dao implements QuestionDAO {

	@Override
	public void add(Question question) {
		super.add(question);

	}

	@Override
	public Question get(int id) {
		// TODO Auto-generated method stub
		return (Question)super.select(Question.class, id);
	}

	@Override
	public void delete(Question question) {
		// TODO Auto-generated method stub
		super.del(question);

	}

	@Override
	public void update(Question question) {
		/*Session session = HibernateSessionFactory.getSession();
		String hql="update question set rightAnswer=:rightAnswer,answers=:answers,title=title where questionid=:questionid";
		Query query = session.createQuery(hql);
		query.setProperties(question);
		query.executeUpdate();
*/
		System.out.println("1234567890");
		super.update(question);
	}
	
	/**
	 * 
	 * @param pageIndex:
	 * @param pageSize:
	 */
	/*public List<Question> pagedSearch(int pageIndex, int pageSize){
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Question q where q.pid=? order by q.questionid asc";
		Query query = session.createQuery(hql);
		query.setParameter(1, 2);
		int startIndex = (pageIndex-1)* pageSize;
		query.setFirstResult(startIndex);
		query.setMaxResults(pageSize);
		List<Question> list = query.list();
		Iterator itor = list.iterator();
		while(itor.hasNext()){
			Question question = (Question) itor.next();
		
		}
		return list;
	}*/
	
	public List<Question> findQuestionList(int pid){
		Session session = DBHelper.getSession();
		session.clear();
		String hql = "from Question where pid="+pid;
		Query query = session.createQuery(hql);
		List list = query.list();
		return list;
	}

}
