package moba.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.model.dao.DAO;
import moba.model.dao.DaoGioco;
import moba.model.dao.DaoRecensione;
import moba.model.dao.DaoUtente;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;

public class VisualizzaStatistiche extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		HttpSession session = request.getSession();
		
		try {
			DaoUtente daoUtente = (DaoUtente) DAO.getDaoInstance(Tabella.Utente);
			DaoGioco daoGioco = (DaoGioco) DAO.getDaoInstance(Tabella.Gioco);
			DaoRecensione daoRecensione = (DaoRecensione) DAO.getDaoInstance(Tabella.Recensione);
			
			System.out.println("ciao lucas");
			session.setAttribute("numeroUtenti", daoUtente.countUtenti());
			System.out.println(daoUtente.countUtenti());
			session.setAttribute("numeroGiochi", daoGioco.countGiochi());
			System.out.println(daoGioco.countGiochi());
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
