package com.action;

import com.dao.QuestionDAOlmpl;
import com.opensymphony.xwork2.ActionSupport;
import com.pojo.Question;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import java.util.List;

@ParentPackage("json-default")
@Namespace("/")
@Controller
public class QuestionAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private List<Question> questionList;
	private int pageIndex=1;
	private int pageSize=5;
	private int questionId;
	private Question question;
	private String title;
	private String answers;
	private String rightAnswer;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAnswers() {
		return answers;
	}
	public void setAnswers(String answers) {
		this.answers = answers;
	}
	public String getRightAnswer() {
		return rightAnswer;
	}
	public void setRightAnswer(String rightAnswer) {
		this.rightAnswer = rightAnswer;
	}
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public List<Question> getQuestionList() {
		return questionList;
	}
	public void setQuestionList(List<Question> questionList) {
		this.questionList = questionList;
	}
	
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	@Action(value = "deleteQuestionAction", results = {
			@Result(name = "success", type="json"),
			@Result(name = "error",type="json")
			})
	public String delectQuestion() {
		QuestionDAOlmpl dao=null;
		try {
			dao = new QuestionDAOlmpl();
			question = dao.get(questionId);
			dao.delete(question);
			return SUCCESS;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ERROR;

	}
	
	@Action(value = "selectQuestionAction", results = {
			@Result(name = "success", type="json"),
			@Result(name = "error",type="json")
			})
	public String selectQuestion() {
		QuestionDAOlmpl dao=null;
		try {
			dao = new QuestionDAOlmpl();
			question = dao.get(questionId);
			System.out.println(question.getRightAnswer());
			
			return SUCCESS;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ERROR;

	}
	
	@Action(value = "updateQuestionAction", results = {
			@Result(name = "success", type="json"),
			@Result(name = "error",type="json")
			})
	public String updateQuestion() {
		QuestionDAOlmpl dao=null;
		try {
			dao = new QuestionDAOlmpl();
			question = dao.get(questionId);
			System.out.println(answers+" "+rightAnswer+" "+answers+" "+title);
			question.setAnswers(answers);
			question.setRightAnswer(rightAnswer);
			question.setTitle(title);
			dao.update(question);
			
			return SUCCESS;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ERROR;

	}
	
	

}
