package moba.controller.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import moba.model.utilita.Utilita;

@SuppressWarnings("serial")
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
		if(this.username == null || this.username.isEmpty())
			errori.add("username", new ActionMessage("obbligatorio", "username"));
		
		if(this.password == null || this.password.isEmpty())
			errori.add("password", new ActionMessage("obbligatorio", "password"));
		else if(!Utilita.verificaPassword(this.password))
			errori.add("password", new ActionMessage("formale_p", "password"));
		
		return errori;
	}

}
