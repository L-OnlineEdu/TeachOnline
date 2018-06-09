package com.dao;

import com.pojo.Question;

public interface QuestionDAO {
	public void add(Question question);
	public Question get(int id);
	public void delete(Question question);
	public void update(Question question);
}
