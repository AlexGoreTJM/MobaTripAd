package moba.controller.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class SigninForm extends ActionForm {
	
	private String username;
	private String password;
	private String nome;
	private String cognome;
	private String email;
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

	public void setPassword(String password) {
		this.password = password;
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
		if(this.username == null || this.username.isEmpty())
			errori.add("username", new ActionMessage("obbligatorio", "username"));
		
		if(this.password == null || this.password.isEmpty())
			errori.add("password", new ActionMessage("obbligatorio", "password"));
		else if(!(this.password.matches("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,20})")))
			errori.add("password", new ActionMessage("incorretta", "password"));
		
		
		if(this.email == null || this.email.isEmpty())
			errori.add("email", new ActionMessage("obbligatorio", "email"));
		else if(!(this.email.matches("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
				+"[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")))
			errori.add("email", new ActionMessage("incorretta", "email"));
		
		if(this.avatar == null || this.avatar.isEmpty())
			errori.add("avatar", new ActionMessage("obbligatorio", "avatar"));
			
		return errori;
	
	}
}
