package moba.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.model.dao.DAO;
import moba.model.dao.DaoGioco;
import moba.model.dao.DaoPiattaforma;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;

/**
 * Dato l'id della piattaforma, ritorna le informazioni e i giochi supportati
 * 
 * @author chris
 * @version 1.0
 */
public class GiochiPiattaforma extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		
		int idPiattaforma = Integer.parseInt(request.getParameter("idPiattaforma"));
		try {
			DaoGioco daoGioco = (DaoGioco) DAO.getDaoInstance(Tabella.Gioco);
			DaoPiattaforma daoPiattaforma = (DaoPiattaforma) DAO.getDaoInstance(Tabella.Piattaforma);

			request.setAttribute("piattaforma",daoPiattaforma.select(idPiattaforma));
			request.setAttribute("listaGioco", daoGioco.selectByIdPiattaforma(idPiattaforma));

			return mapping.findForward("success");

		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}

	}

}
