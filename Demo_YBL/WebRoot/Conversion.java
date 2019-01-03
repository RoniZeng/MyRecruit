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
	public ArrayList<Object[]> getList(List list,String tablename){
		ArrayList<Object[]> result= new ArrayList<Object[]>();
		result.add(getFields(tablename,"name"));
		String[] fields=getFields(tablename,"field");
		for(int i=0;i<list.size();i++){
			String[] data=new String[fields.length];
			Object obj=list.get(i);
			for(int j=0;j<fields.length;j++){
			
				String[] depth=fields[j].split("\\."); 
				Object tmp=obj;
				for(int k=0;k<depth.length;k++){
					try {
						Field field= tmp.getClass().getDeclaredField(depth[k]);
						field.setAccessible(true);
						tmp=field.get(tmp);
					} catch (Exception e) {
						e.printStackTrace();
					} 
				}
				data[j]=String.valueOf(tmp);
			}
			result.add(data);
		}
		return result;
	}
    private String[] getFields(String tablename,String fieldname){
    		String[] result=null;
        try {
        	SAXReader sr = new SAXReader();
        	Document doc = sr.read("src/super.xml");
        	Element root=doc.getRootElement(); 
        	Element xx=root.element(tablename);
        	List list=xx.elements(fieldname);
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