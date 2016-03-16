package moba.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.model.dao.DAO;
import moba.model.dao.DaoRecensione;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Utente;

public class IncrementaLike extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {

		int idUtente = Integer.parseInt(request.getParameter("idu"));
		int idGioco = Integer.parseInt(request.getParameter("idg"));
		
		try {
			DaoRecensione dao = (DaoRecensione) DAO.getDaoInstance(Tabella.Recensione);
			
			dao.addLike(idUtente, idGioco);
		
			return mapping.findForward("success");

		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}
	}
}
