package com.ybl.tool;

import java.lang.reflect.Field;
import java.sql.Date;
import java.util.Map;

public class ObjectFieldValue {
	 
	//pushAllField(maps,obj,0,"");
	public static void pushAllField(Map<String,String> maps,Object obj,int dep,String pre){
		if(dep==0) return;
		Field[] fields=obj.getClass().getDeclaredFields();
		for (Field field : fields) {
			field.setAccessible(true);
			Object tmp = null;
			try {
				tmp = field.get(obj);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			if(tmp==null)continue;
			if(tmp.getClass()==Integer.class||tmp.getClass()==String.class||tmp.getClass()==Date.class){
				maps.put(pre+field.getName(),String.valueOf(tmp));
			} else{
				pushAllField(maps,tmp,dep-1,pre+field.getName());
			}
		}		
	}
}
