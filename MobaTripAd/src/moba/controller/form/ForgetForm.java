package moba.controller.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import moba.model.utilita.Utilita;

public class ForgetForm extends ActionForm {
	

	private String email;

	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {

		ActionErrors errori = new ActionErrors();
		
		//nell'ActionMessage definiamo un 'etichetta' facilmente decifrabile secondo la regola NomeClasse.campo.problema

		if(this.email == null || this.email.isEmpty())
			errori.add("email", new ActionMessage("obbligatorio", "email"));
		
		if(!Utilita.verificaEmail(this.email))
			errori.add("email", new ActionMessage("formale", "email"));
		
		return errori;
	
	}
}
