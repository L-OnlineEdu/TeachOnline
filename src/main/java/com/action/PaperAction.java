package com.action;

import com.dao.PaperDAOlmpl;
import com.dao.QuestionDAOlmpl;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.opensymphony.xwork2.ActionSupport;
import com.pojo.Paper;
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
public class PaperAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private List paperList;
	private String pcontext;
	private String ptime;
	private int pid;
	private String pname;
	private String questionList;
	
	
	public String getQuestionList() {
		return questionList;
	}
	public void setQuestionList(String questionList) {
		this.questionList = questionList;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPcontext() {
		return pcontext;
	}
	public void setPcontext(String pcontext) {
		this.pcontext = pcontext;
	}
	public String getPtime() {
		return ptime;
	}
	public void setPtime(String ptime) {
		this.ptime = ptime;
	}
	public List getPaperList() {
		return paperList;
	}
	public void setPaperList(List paperList) {
		this.paperList = paperList;
	}

	@Action(value = "findAllPaperAction", results = {
			@Result(name = "success", type="json"),
			@Result(name = "error",type="json")
			})
	public String showAllGood() {
		PaperDAOlmpl dao=null;
		try {
			dao = new PaperDAOlmpl();
			paperList = dao.findPaperList();
			return SUCCESS;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ERROR;

	}
	
	@Action(value = "updatePaperAction", results = {
			@Result(name = "success", type="json"),
			@Result(name = "error",type="json")
			})
	public String updatePaper() {
		PaperDAOlmpl dao=null;
		try {
			dao = new PaperDAOlmpl();
			Paper paper = dao.get(pid);
			System.out.println(paper);
			paper.setPcontext(pcontext);
			paper.setPtime(ptime);
			dao.update(paper);
			
			return SUCCESS;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ERROR;

	}
	
	@Action(value = "deletePaperAction", results = {
			@Result(name = "success", type="json"),
			@Result(name = "error",type="json")
			})
	public String deletePaper() {
		PaperDAOlmpl dao=null;
		QuestionDAOlmpl dao1 = null;
		List<Question> listQuestion = null;
		try {
			dao = new PaperDAOlmpl();
			dao1 = new QuestionDAOlmpl();

			listQuestion = dao1.findQuestionList(pid);
			for(int i=0;i<listQuestion.size();i++){
				System.out.println("edfghjkl;"+i);
				Question question = listQuestion.get(i);
				question.setPid(1);
				dao1.update(question);
			}
			Paper paper = dao.get(pid);
			dao.delete(paper);

			return SUCCESS;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ERROR;

	}
	
	@Action(value = "addPaperAction", results = {
			@Result(name = "success", type="json"),
			@Result(name = "error",type="json")
			})
	public String addPaper() {
		PaperDAOlmpl dao=null;
		QuestionDAOlmpl dao1 = null;
		try {
			dao = new PaperDAOlmpl();
			Paper paper = new Paper();
			paper.setPname(pname);
			paper.setPcontext(pcontext);
			paper.setPtime(ptime);
			dao.add(paper);
			
			System.out.println(paper.getPid());
			System.out.println(questionList);
		/*	JSONArray jsonArray = JSONArray.fromObject(questionList);*/
	      /*   List<String> list2 =JSONArray.toList(jsonArray);*/
			//将json转换为List
            Gson gson=new Gson();
            List<String> list2 =gson.fromJson( questionList, new TypeToken<List<String>>() { }.getType());
			for(int i=0;i<list2.size();i++){
				dao1 = new QuestionDAOlmpl();
				int a = Integer.parseInt(list2.get(i));
				Question question = dao1.get(a);
				question.setPid(paper.getPid());
				dao1.update(question);
				
				
			}
			
			return SUCCESS;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ERROR;

	}

}
