package moba.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.controller.form.ForgetForm;
import moba.model.dao.DAO;
import moba.model.dao.DaoUtente;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.utilita.MailJava;

public class Forget extends Action{
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		
		ForgetForm f = (ForgetForm) form;
		String email = new String(f.getEmail());
		try {
			DaoUtente dao = (DaoUtente) DAO.getDaoInstance(Tabella.Utente);
			if(dao.getEmail(email)){
				String user = dao.recuperaUsername(email);
				String pass = dao.recuperaPassword(user);
				MailJava.MandaUserPass(email, user, pass);
				request.setAttribute("feedback", "L'Username e la password sono stati inviati alla mail indicata");
				return mapping.findForward("success");
			}
			else {
				request.setAttribute("errore_utente_mancante", "Nessun utente è registrato con questa mail");
				return mapping.findForward("failure_utente_mancante");
			}
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}
		
	}
	
	

}