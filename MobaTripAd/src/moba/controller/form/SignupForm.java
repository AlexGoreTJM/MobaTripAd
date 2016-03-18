package moba.controller.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import moba.model.dao.DAO;
import moba.model.dao.DaoUtente;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.utilita.Utilita;

@SuppressWarnings("serial")
public class SignupForm extends ActionForm {
	
	private String username;
	private String password;
	private String password_c;
	private String nome;
	private String cognome;
	private String email;
	private String email_c;
	private String info;
	private String avatar;
	
		
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public String getPassword_c() {
		return password_c;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setPassword_c(String password_c) {
		this.password_c = password_c;
	}
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getEmail_c() {
		return email_c;
	}

	public void setEmail_c(String email_c) {
		this.email_c = email_c;
	}
	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}


	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {

		ActionErrors errori = new ActionErrors();
		
		//nell'ActionMessage definiamo un 'etichetta' facilmente decifrabile secondo la regola NomeClasse.campo.problema
		
		try {
			DaoUtente dao = (DaoUtente) DAO.getDaoInstance(Tabella.Utente);
			if(this.email == null || this.email.isEmpty())
				errori.add("email", new ActionMessage("obbligatorio", "email"));
			else if(dao.getEmail(this.email))
				errori.add("email", new ActionMessage("email_exist", "email"));
			else if(!Utilita.verificaEmail(this.email))
				errori.add("email", new ActionMessage("formale_e", "email"));
			else if(!this.email.equals(this.email_c))
				errori.add("email_c", new ActionMessage("email_diversa", "email"));

			if(this.username == null || this.username.isEmpty())
				errori.add("username", new ActionMessage("obbligatorio", "username"));
			
			else if(dao.getUsername(this.username))
					errori.add("username", new ActionMessage("username_exist", "username"));
	
		} catch (DAOException e) {
		
			e.printStackTrace();
		}
		
		if(this.password == null || this.password.isEmpty())
			errori.add("password", new ActionMessage("obbligatorio", "password"));
		
		if(!this.password.equals(this.password_c))
			errori.add("password_c", new ActionMessage("password_diversa", "password"));

		if(!Utilita.verificaPassword(this.password))
			errori.add("password", new ActionMessage("formale_p", "password"));
		
		if(this.avatar == null || this.avatar.isEmpty())
			avatar = "MOBAavatar.png";
		
		
		return errori;
	
	}
}
