package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tools.JaveUsePython;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletContext;
import java.io.File;

public class UploadAction extends ActionSupport{
	//进行文件上传的操作

	private static final long serialVersionUID = 1L;
	private File upfile;//接收上传的文件的2进制流
	/**
	 * 创建一个File类型的对象 可以接收一个文件的上传
	 * 如果出现多个文件的上传 可以采用数组或list集合
	 * File[] upfile
	 * LIst<File>
	 */

	//struts2的框架中 默认的提供两个用于上传的参数
	private String upfileContentType;//文件的类型
	private String upfileFileName;//上传文件的原名

	//定义一个变量 设定文件的保存路径
	private String savePath;
	private String type;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public File getUpfile() {
		return upfile;
	}

	public void setUpfile(File upfile) {
		this.upfile = upfile;
	}

	public String getUpfileContentType() {
		return upfileContentType;
	}

	public void setUpfileContentType(String upfileContentType) {
		this.upfileContentType = upfileContentType;
	}

	public String getUpfileFileName() {
		return upfileFileName;
	}

	public void setUpfileFileName(String upfileFileName) {
		this.upfileFileName = upfileFileName;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	@Override
	public String execute() throws Exception {
		//确定文件存放的路径
		//1.获取当前web程序在容器中的物理路径
		ServletContext sctx = ServletActionContext.getServletContext();
		String absSavePath=sctx.getRealPath(savePath);
		System.out.println(absSavePath);
		//2.判断路径是否存在
		File realpath=new File(absSavePath);
		if(!realpath.exists()){
			realpath.mkdir();//创建上传文件夹
		}

		//考虑文件的上传 --文件名
		//获取原始的文件名的后缀
		//String ext=upfileFileName.substring(upfileFileName.indexOf("."));
		//String saveFile=System.currentTimeMillis()+ext;//UUID.randomUUID()+ext
		String saveFile="a.docx";//UUID.randomUUID()+ext
		System.out.println(upfileFileName+"  "+saveFile);

		//额外的操作 将 (原文件名--映射--保存的物理文件)名统一的存放
		ActionContext.getContext().getSession().put("file", savePath+"/"+saveFile);

		FileUtils.copyFile(upfile, new File(absSavePath+"/"+saveFile));

		JaveUsePython.runPy("F:/test/word.py");
		return SUCCESS;

	}


}
