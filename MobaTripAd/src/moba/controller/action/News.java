package moba.controller.action;

package moba.controller.action;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.controller.form.NewsForm;
import moba.controller.form.SignupForm;
import moba.model.dao.DAO;
import moba.model.dao.DaoUtente;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.eccezioni.DAOUnivocoException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Grado;
import moba.model.entity.Utente;
import moba.model.utilita.MailJava;

public class News extends Action{
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		
		NewsForm f = (NewsForm) form;
		
		String email_news = f.getEmail();
		try {
			DaoNews dao = (DaoNews) DAO.getDaoInstance(Tabella.News);
			dao.insert(email_news);

			request.setAttribute
			("feedback_news", "sei stato registrato alla news!");
			System.out.println("Registrazione news a buon fine!");
			return mapping.findForward("success");
			
		} catch (DAOUnivocoException e) {
			request.setAttribute("errore_news", e.getMessage());
			return mapping.findForward("stay");
		} catch (DAOException e) {
			request.setAttribute("errore_news", e.getMessage());
			return mapping.findForward("failure");
		}
		
	}
	
	

}