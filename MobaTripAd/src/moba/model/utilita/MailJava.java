package moba.model.utilita;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailJava {
	
     public static void MandaSignMail(String email){
    	 Properties props = new Properties();
 		props.put("mail.smtp.host", "smtp.libero.it");
 		props.put("mail.smtp.socketFactory.port", "465");
 		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
 		props.put("mail.smtp.auth", "true");
 		props.put("mail.smtp.port", "465");
 		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
 			@Override
 			protected PasswordAuthentication getPasswordAuthentication() {
 				return new PasswordAuthentication("mobatripadproject@libero.it", "Password2");
 			}
 		});

 		try {

 			Message message = new MimeMessage(session);
 			message.setFrom(new InternetAddress("mobatripadproject@libero.it"));
 			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
 			message.setSubject("MobaTripAd: Email di Benvenuto");
 			message.setText("Ciao benvenuto nel sito di MobaTripAd. Inizia a recensire qualche gioco.");

 			Transport.send(message);

 			System.out.println("Done");

 		} catch (MessagingException e) {
 			throw new RuntimeException(e);
 		}
    	 
     }

     
     
   
     
	
	

}
