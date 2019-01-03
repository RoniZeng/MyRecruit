package com.ybl.dao;

import java.util.Date;

import com.ybl.model.Message;

public class MessageDao extends BaseHibernateDao {

	public void inser(Message message) {
		super.add(message);
	}
	public static void main(String[] args) {
		/**
		 * 严重: Cannot add or update a child row: a foreign key constraint 
		 * fails (`ybl`.`message`, CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sendId`) 
		 * REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)
		org.hibernate.exception.ConstraintViolationException: could not insert: [com.ybl.model.Message]
		 */
//		MessageDao dao = new MessageDao();
//		Message message = new Message();
//		message.setContext("恭喜你！通过面试！");
//		message.setGetId(100000000);
//		message.setSendId(8);
//		message.setIsRead(0);
//		message.setTitle("面试通过消息");
//		message.setSendTime(new Date());
//		dao.inser(message);
	}
}
