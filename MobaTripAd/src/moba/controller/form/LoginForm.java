package moba.controller.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class LoginForm extends ActionForm {
	
	private String username;
	private String password;
	
	
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
	
	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {

		ActionErrors errori = new ActionErrors();
		
		//nell'ActionMessage definiamo un 'etichetta' facilmente decifrabile secondo la regola NomeClasse.campo.problema
		if(this.username == null || this.username.length() == 0)
			errori.add("username", new ActionMessage("LoginForm.username.empty"));
		
		if(this.password == null || this.password.length() == 0)
			errori.add("password", new ActionMessage("LoginForm.password.empty"));
		else if(password.length() < 8)
			errori.add("password", new ActionMessage("LoginForm.password.tooShort"));
		
		return errori;
	}

}
