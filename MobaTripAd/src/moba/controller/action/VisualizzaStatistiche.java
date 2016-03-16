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
import moba.model.dao.DaoStatistica;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;

public class VisualizzaStatistiche extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		HttpSession session = request.getSession();
		
		try {
			DaoStatistica daoUtente = (DaoStatistica) DAO.getDaoInstance(Tabella.Utente);
			DaoStatistica daoGioco = (DaoStatistica) DAO.getDaoInstance(Tabella.Gioco);
			DaoRecensione daoRecensione = (DaoRecensione) DAO.getDaoInstance(Tabella.Recensione);
			
			session.setAttribute("numeroUtenti", daoUtente.countUtenti());
			session.setAttribute("numeroGiochi", daoGioco.countGiochi());
			session.setAttribute("numeroRecensioni", daoRecensione.countRecensioni());
			
			session.setAttribute("recPerUtente", daoRecensione.countRecensioniByUtente());
			
			session.setAttribute("recensioni",daoRecensione.selectLikesDislikesByRecensione());

			return mapping.findForward("success");

		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}

	}
	
}
