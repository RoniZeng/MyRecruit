package com.ybl.tool;
import java.security.GeneralSecurityException;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import com.sun.mail.util.MailSSLSocketFactory;

public class SendEmail 
{
	public static void main(String[] args) throws GeneralSecurityException {
		//sendCode("1009839729@qq.com","123");
	}
	
    public boolean sendCode(String email,String code) throws GeneralSecurityException 
    {
        // �ռ��˵�������
        //String to = "823952051@qq.com";

        // �����˵�������
        String from = "1009839729@qq.com";

        // ָ�������ʼ�������Ϊ smtp.qq.com
        String host = "smtp.qq.com";  //QQ �ʼ�������

        // ��ȡϵͳ����
        Properties properties = System.getProperties();

        // �����ʼ�������
        properties.setProperty("mail.smtp.host", host);

        properties.put("mail.smtp.auth", "true");
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.ssl.socketFactory", sf);
        // ��ȡĬ��session����
        Session session = Session.getDefaultInstance(properties,new Authenticator(){
            public PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication("1009839729@qq.com", "xgahbvgkdnsfbejh"); //�������ʼ��û���������
            }
        });
        try{
            // ����Ĭ�ϵ� MimeMessage ����
            MimeMessage message = new MimeMessage(session);

            // Set From: ͷ��ͷ�ֶ�
            message.setFrom(new InternetAddress(from));

            // Set To: ͷ��ͷ�ֶ�
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

            // Set Subject: ͷ��ͷ�ֶ�
            message.setSubject("������֤");

            // ������Ϣ��
            message.setText("��ӭ����������\n�����룺"+code+"\n���ע������:xxxxxxxx");
            System.out.println("��ӭ����������\n�����룺"+code+"\n���ע������:xxxxxxxx");
            // ������Ϣ
            Transport.send(message);
           // System.out.println("Sent message successfully....from runoob.com");
            return true;
        }catch (MessagingException mex) {
            mex.printStackTrace();
            return false;
        }
    }
}