package com.ybl.dao;

import java.util.Date;

import com.ybl.model.Message;

public class MessageDao extends BaseHibernateDao {

	public void inser(Message message) {
		super.add(message);
	}
	public static void main(String[] args) {
		/**
		 * ����: Cannot add or update a child row: a foreign key constraint 
		 * fails (`ybl`.`message`, CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sendId`) 
		 * REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)
		org.hibernate.exception.ConstraintViolationException: could not insert: [com.ybl.model.Message]
		 */
//		MessageDao dao = new MessageDao();
//		Message message = new Message();
//		message.setContext("��ϲ�㣡ͨ�����ԣ�");
//		message.setGetId(100000000);
//		message.setSendId(8);
//		message.setIsRead(0);
//		message.setTitle("����ͨ����Ϣ");
//		message.setSendTime(new Date());
//		dao.inser(message);
	}
}
