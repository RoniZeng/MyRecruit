package com.ybl.tool;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class Upload {
	private File upload;//上传的文件
	private String uploadFileName;//文件名
	
	public Upload(){
		
	}
	public Upload(File upload,String uploadFileName){
		this.upload=upload;
		this.uploadFileName=uploadFileName;
	}
	
	
	//上传文件
	public String upload() throws Exception{
		System.out.println("***********asugdasu******************");
//		uploadFileName="123"+uploadFileName;
		System.out.println(uploadFileName);
		InputStream is = new FileInputStream(getUpload());
		String x = "E:\\ybl\\";
		OutputStream os = new FileOutputStream(x+uploadFileName);  //文件保存地址
		byte buffer[] = new byte[1024];
		int count=0;
		while((count=is.read(buffer))>0){
			os.write(buffer, 0, count);
		}
		System.out.println("*****************************");
		os.close();
		is.close();
		System.out.println("*****************************");
		return x+uploadFileName;
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
