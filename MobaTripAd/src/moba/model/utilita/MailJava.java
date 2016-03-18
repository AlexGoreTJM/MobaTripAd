package moba.model.utilita;

import java.util.Properties;
import java.util.UUID;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import moba.model.entity.Grado;
import moba.model.entity.Utente;

//Classe java contenente i metodi per l'invio di diverse tipologie di email agli utenti.

public class MailJava {

	public static void MandaSignMail(String email, String token) {

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
			message.setSubject("MobaTripAd: Email di Autenticazione");

			message.setText("http://localhost:8080/MobaTripAd/autenticazione.do?tokenURL=" + token);

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}

	}

	public static void MandaUserPass(String email, String username, String password) {

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
			message.setSubject("MobaTripAd: Email di recupero dati utente");

			message.setText("I dati utente sono: Username = " + username + ", Password = " + password);

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}

	}

	public static void MandaGiocoPDFMail(String email, String path, String titolo) {
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
			message.setText("Eccoti il pdf del gioco");
			message.setSubject("MobaTripAd: Dati " + titolo);

			MimeBodyPart messageBodyPart = new MimeBodyPart();
			Multipart multipart = new MimeMultipart();
			messageBodyPart = new MimeBodyPart();
			String file = path;
			String fileName = titolo + ".pdf";
			DataSource source = new FileDataSource(file);
			messageBodyPart.setDataHandler(new DataHandler(source));
			messageBodyPart.setFileName(fileName);
			multipart.addBodyPart(messageBodyPart);

			message.setContent(multipart);

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}

	}

	public static void ContattaMail(String nome, String email, String messaggio) {

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
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("mobatripadproject@libero.it"));
			message.setSubject("MobaTripAd: Contattaci!");

			message.setText("Nome: " + nome + " Email: " + email + " Messaggio: " + messaggio);

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static void NewsMail(String email, String gioco, String path){
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
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("mobatripadproject@libero.it"));
			message.setSubject("MobaTripAd Newsletter: Nuovo gioco aggiunto!");

			message.setText("Avviso: il gioco "+ gioco + " e' stato aggiunto al sito, corri a recensirlo qui: "+ path);

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		
		
		
	}
	
	

}
