package moba.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.model.dao.DAO;
import moba.model.dao.DaoCategoria;
import moba.model.dao.DaoGioco;
import moba.model.dao.DaoPiattaforma;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;

public class Inizia extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		try {
			DaoGioco dao = (DaoGioco) DAO.getDaoInstance(Tabella.Gioco);
			DaoPiattaforma daop = (DaoPiattaforma) DAO.getDaoInstance(Tabella.Piattaforma);
			DaoCategoria daoc = (DaoCategoria) DAO.getDaoInstance(Tabella.Categoria);
			HttpSession session = request.getSession();
			
			request.setAttribute("giocoRecente", dao.selectRecente());
			request.setAttribute("listaGiocoPopolari", dao.selectPopolare());
			request.setAttribute("listaPiattaforma", daop.select());
			request.setAttribute("listaCategoria", daoc.select());
			
			session.setAttribute("pathCategoria", "/IMGDB/Categoria/");
			session.setAttribute("pathPiattaforma", "/IMGDB/Piattaforma/");
			session.setAttribute("pathGioco", "/IMGDB/Gioco/");
			
			return mapping.findForward("success");
		} catch (DAOException e) {

			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}

	}

}
