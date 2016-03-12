package moba.controller.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import moba.model.utilita.Utilita;

public class ModificaForm extends ActionForm{
	
	private String email;
	private String password;
	private String nome;
	private String cognome;
	private String info;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	
	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {

		ActionErrors errori = new ActionErrors();
		
		if(this.email == null || this.email.isEmpty())
			errori.add("email", new ActionMessage("obbligatorio", "email"));
		
		if(!Utilita.verificaEmail(this.email))
			errori.add("email", new ActionMessage("formale", "email"));
		
		
	}
	
}
