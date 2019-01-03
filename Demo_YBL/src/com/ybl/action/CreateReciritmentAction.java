package com.ybl.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ybl.dao.CompanyDao;
import com.ybl.dao.ReciritmentDao;
import com.ybl.model.Company;
import com.ybl.model.Reciritment;
//createReciriment
public class CreateReciritmentAction extends ActionSupport{
	private Reciritment newRec;//������ְλ��Ϣ
	
	//��˾����ְλ
	public String createReciriment(){
		System.out.println("���뷢��ְλAction........");
		newRec.getPosition().setName(newRec.getPosition().getName().trim());
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity==0){
			return ERROR;
		}
		Integer userId = (Integer)session.get("userId");
		System.out.println("�û�ID��" + userId);
		CompanyDao comDao = new CompanyDao();
		Company com = comDao.selectById(userId); //���ݹ�˾�û�ID��ù�˾����
		//�Զ����빫˾id
		System.out.println("��˾���� = "+ com.getEmail());
		newRec.setCompany(com);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
		//����ʱ��Ϊ��ǰϵͳʱ��
		newRec.setSendDate(new Date());
        System.out.println(df.format(new Date()));// new Date()Ϊ��ȡ��ǰϵͳʱ��
        //�շ�������Ƹһ����Ч
        newRec.setIsOk(1);
        ReciritmentDao recDao = new ReciritmentDao();
        System.out.println("������Ƹ��Ϣǰ.........");
        //��Reciritment����һ����Ϣ
        
        recDao.inser(newRec);
        System.out.println("������Ƹ��Ϣ!!!");
		return SUCCESS;
	}
	public Reciritment getNewRec() {
		return newRec;
	}
	public void setNewRec(Reciritment newRec) {
		this.newRec = newRec;
	}
	
}
