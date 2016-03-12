package moba.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.model.dao.DAO;
import moba.model.dao.DaoGioco;
import moba.model.dao.DaoRecensione;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Recensione;

public class RecensioneAction extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		int idGioco = Integer.parseInt(request.getParameter("idGioco"));
		int idUtente = Integer.parseInt(request.getParameter("idUtente"));
		String recensione = request.getParameter("recensione");
		
		try {
			DaoRecensione daoRecensione = (DaoRecensione) DAO.getDaoInstance(Tabella.Recensione);

			daoRecensione.insert(new Recensione(idUtente, idGioco, recensione));
			request.setAttribute("riscontro", 1);

			return mapping.findForward("success");

		} catch (DAOException e) {
			request.setAttribute("riscontro", 0);
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}

	}
	
}
