package moba.controller.form;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import moba.model.dao.DAO;
import moba.model.dao.DaoNews;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Utente;
import moba.model.utilita.Utilita;

@SuppressWarnings("serial")
public class NewsForm  extends ActionForm{

	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {

		ActionErrors errori = new ActionErrors();
		HttpSession session = request.getSession();
		Utente u1 = (Utente) session.getAttribute("utente");
		//nell'ActionMessage definiamo un 'etichetta' facilmente decifrabile secondo la regola NomeClasse.campo.problema
		
		try {
			DaoNews daonews = (DaoNews) DAO.getDaoInstance(Tabella.News);
			if(this.email == null || this.email.isEmpty())
				errori.add("email", new ActionMessage("obbligatorio", "email"));
			else if(daonews.getEmail(this.email))
				errori.add("email", new ActionMessage("email_exist", "email"));
			else if(!Utilita.verificaEmail(this.email))
				errori.add("email", new ActionMessage("formale_e", "email"));
			else if(!(u1.getEmail().equals(this.email)))
				errori.add("email", new ActionMessage("email_not_exist", "email"));
	
		} catch (DAOException e) {
		
			e.printStackTrace();
		}
		
		return errori;
	
	}
	
}
