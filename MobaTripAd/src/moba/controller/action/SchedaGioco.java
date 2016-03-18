package moba.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.model.dao.DAO;
import moba.model.dao.DaoGioco;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;

public class SchedaGioco extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		int idGioco = Integer.parseInt(request.getParameter("idGioco"));
		try {
			DaoGioco daoGioco = (DaoGioco) DAO.getDaoInstance(Tabella.Gioco);

			request.getSession().setAttribute("gioco", daoGioco.select(idGioco));
			
			if(request.getSession().getAttribute("utente") != null){
				
				//DaoRecensione daoRecensione = (DaoRecensione) DAO.getDaoInstance(Tabella.Recensione);
				
//				if(daoRecensione.selectVerifica(((Utente)request.getSession().getAttribute("utente")).getIdUtente(), idGioco) != null)
//					request.getSession().setAttribute("recensioneInserita", 1);
			}

			return mapping.findForward("success");

		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}

	}
	
}
