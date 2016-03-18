package moba.controller.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.model.dao.DAO;
import moba.model.dao.DaoNews;

import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Utente;


public class DisiscrizioneNews extends Action{
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		Utente u2 = (Utente) session.getAttribute("utente");
		String email_utente = u2.getEmail();

		try {
			DaoNews dao = (DaoNews) DAO.getDaoInstance(Tabella.News);	
			if(dao.getEmail(email_utente)){
				dao.delete(email_utente);
				request.setAttribute
				("feedback_news_dis", "sei stato cancellato dalla newsletter");
				System.out.println("Cancellazione news a buon fine!");
				return mapping.findForward("success");
				
			}else {
				request.setAttribute
				("feedback_news_dis", "Impossibile cancellare perchè non sei registrato alla newsletter");
				return mapping.findForward("success");
			}
		} catch (DAOException e) {
			request.setAttribute("errore_news_cancellazione", e.getMessage());
			return mapping.findForward("failure");
		}
		
	}
	
	

}