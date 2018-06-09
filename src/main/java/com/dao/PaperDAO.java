package com.dao;

import com.pojo.Paper;

public interface PaperDAO {
	public void add(Paper paper);
	public Paper get(int id);
	public void delete(Paper paper);
	public void update(Paper Paper);
}
