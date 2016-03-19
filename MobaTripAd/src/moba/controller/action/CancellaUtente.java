package moba.controller.action;

//Action che permette all'admin di cancellare un utente.

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.model.dao.DAO;
import moba.model.dao.DaoNews;
import moba.model.dao.DaoUtente;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Utente;

public class CancellaUtente extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		DaoUtente dao;
		DaoNews dao_news;
		int idUtenteCancellazione = Integer.parseInt(request.getParameter("idUtenteCanc"));
		String email = request.getParameter("email");
		try {
			dao = (DaoUtente) DAO.getDaoInstance(Tabella.Utente);
			dao_news = (DaoNews) DAO.getDaoInstance(Tabella.News);	
			if(dao_news.getEmail(email)){
				dao_news.delete(email);}
			dao.delete(idUtenteCancellazione);
			return mapping.findForward("success");
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}
	}
}
