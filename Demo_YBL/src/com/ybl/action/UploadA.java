package com.ybl.action;

import java.io.*;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ybl.model.Userinfo;

public class UploadA extends ActionSupport {
	private File upload;//上传的文件
	private String uploadFileName;//文件名
	
	//上传文件
	public String execute() throws Exception{
		System.out.println("***********asugdasu******************");
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf('.'));
		
		Map session = ActionContext.getContext().getSession();
		uploadFileName=((Integer)session.get("userIdentity")).toString()+"\\"+((Integer)session.get("userId")).toString()+uploadFileName;
		
//		uploadFileName="123"+uploadFileName;
		System.out.println(uploadFileName);
		InputStream is = new FileInputStream(getUpload());
		OutputStream os = new FileOutputStream("E:\\ybl\\img\\"+uploadFileName);  //文件保存地址
		byte buffer[] = new byte[1024];
		int count=0;
		while((count=is.read(buffer))>0){
			os.write(buffer, 0, count);
		}
		System.out.println("*****************************");
		os.close();
		is.close();
		System.out.println("*****************************");
		System.out.println(SUCCESS);
		return SUCCESS;
	}


	public File getUpload() {
		return upload;
	}


	public void setUpload(File upload) {
		this.upload = upload;
	}


	public String getUploadFileName() {
		return uploadFileName;
	}


	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	

}
