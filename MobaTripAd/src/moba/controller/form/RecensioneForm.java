package moba.controller.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import moba.model.utilita.Utilita;

public class RecensioneForm extends ActionForm {
	private String recensione;

	public String getRecensione() {
		return recensione;
	}

	public void setRecensione(String recensione) {
		this.recensione = recensione;
	}

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {

		ActionErrors errori = new ActionErrors();
		
		//nell'ActionMessage definiamo un 'etichetta' facilmente decifrabile secondo la regola NomeClasse.campo.problema
		if(this.recensione == null || this.recensione.isEmpty())
			errori.add("username", new ActionMessage("obbligatorio", "recensione"));
			
		return errori;
	
	}
}
