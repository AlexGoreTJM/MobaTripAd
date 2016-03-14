package moba.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.controller.form.RecensioneForm;
import moba.model.dao.DAO;
import moba.model.dao.DaoRecensione;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Gioco;
import moba.model.entity.Recensione;
import moba.model.entity.Utente;

public class RecensioneAction extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		
		RecensioneForm rf = (RecensioneForm) form;
		HttpSession session = request.getSession();
		
		int idGioco = Integer.parseInt(request.getParameter("idGioco"));
		int idUtente = ((Utente)session.getAttribute("utente")).getIdUtente();
		
		try {
			DaoRecensione daoRecensione = (DaoRecensione) DAO.getDaoInstance(Tabella.Recensione);

			daoRecensione.insert(new Recensione(idUtente, idGioco, rf.getRecensione()));
			request.setAttribute("riscontro", 1);

			return mapping.findForward("success");

		} catch (DAOException e) {
			request.setAttribute("riscontro", 0);
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}

	}
	
}
