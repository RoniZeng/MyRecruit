package com.ybl.tool;

import java.lang.reflect.Field;
import java.sql.Date;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
public class Conversion{
	
	private void pushFieldId(ArrayList<Object[]> result,List list,String tablename,int len){
		String[] fields=getXml("table/"+tablename+"/fieldId");
		for(int i=0;i<list.size();i++){
			String[] data=(String[])result.get(i+2);
			Object obj=list.get(i);
			for(int j=0;j<fields.length;j++){
				String[] depth=fields[j].split("\\.");
				Object tmp=obj;
				for(int k=0;k<depth.length-1;k++){
					try {
						Field field=tmp.getClass().getDeclaredField(depth[k]);
						field.setAccessible(true);
						tmp=field.get(tmp);
					} catch (Exception e) {
						e.printStackTrace();
					} 
				}
				depth=getXml("array/"+depth[depth.length-1]+"/value");
				data[len-fields.length+j]=depth[Integer.valueOf(String.valueOf(tmp))];
			}
		}
	}
	
	private void pushField(ArrayList<Object[]> result,List list,String tablename){
		String[] fields=getXml("table/"+tablename+"/field");
		for(int i=0;i<list.size();i++){
			String[] data=(String[])result.get(i+2);
			Object obj=list.get(i);
			for(int j=0;j<fields.length;j++){
				String[] depth=fields[j].split("\\.");
				Object tmp=obj;
				for(int k=0;k<depth.length;k++){
					try {
						Field field=tmp.getClass().getDeclaredField(depth[k]);
						field.setAccessible(true);
						tmp=field.get(tmp);
					} catch (Exception e) {
						e.printStackTrace();
					} 
				}
				data[j]=String.valueOf(tmp);
			}
		}
	}
	
	public ArrayList<Object[]> getList(List list,String tablename){
		ArrayList<Object[]> result= new ArrayList<Object[]>();
		String[] strings=getXml("table/"+tablename+"/name");
		result.add(strings);
		String[] strings2=new String[strings.length];
		
		String[] fields=getXml("table/"+tablename+"/field");
		int len=fields.length;
		for(int i=0;i<len;i++) strings2[i]=fields[i];
		fields=getXml("table/"+tablename+"/fieldId");
		for(int i=len,j=0;i<strings.length;i++,j++) strings2[i]=fields[j];
		
		for(int i=0;i<strings2.length;i++)
		System.out.println("zzzzz"+strings2[i]);
		result.add(strings2);
		
		for(int i=0;i<list.size();i++){
			result.add(new String[strings.length]);
		}
		pushField(result,list,tablename);
		pushFieldId(result,list,tablename,strings.length);
		return result;
	}
	public static void main(String args[]){
		Conversion con=new Conversion();
		String tablename="Employee";
		String[] strings=con.getXml("table/"+tablename+"/field");
		for(int i=0;i<strings.length;i++){
			System.out.println(strings[i]);
		}
	}
    private String[] getXml(String location){
    		String[] result=null;
        try {
        	SAXReader sr = new SAXReader();
        	
        	Document doc = sr.read("../webapps/Demo_YBL/WEB-INF/classes/super.xml");
        	Element xx=doc.getRootElement(); 
        	String[] strings=location.split("/");
        	for(int i=0;i<strings.length-1;i++){
        		xx=xx.element(strings[i]);
        	}
        	List list=xx.elements(strings[strings.length-1]);
        	result=new String[list.size()];
        	for(int i=0;i<list.size();i++){
        		Element obj=(Element)list.get(i);
        		result[i]=String.valueOf(obj.getData());
        	}
        } catch(Exception e) {
            e.printStackTrace();
        }
		return result;
    }
}