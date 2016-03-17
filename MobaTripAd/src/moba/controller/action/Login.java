package moba.controller.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.controller.form.LoginForm;
import moba.model.dao.DAO;
import moba.model.dao.DaoGioco;
import moba.model.dao.DaoRecensione;
import moba.model.dao.DaoUtente;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.eccezioni.DAONonTrovatoException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Gioco;
import moba.model.entity.Recensione;
import moba.model.entity.Utente;

public class Login extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		
		LoginForm f = (LoginForm) form;
		
		try {
			DaoUtente dao = (DaoUtente) DAO.getDaoInstance(Tabella.Utente);
			DaoRecensione daoR = (DaoRecensione) DAO.getDaoInstance(Tabella.Recensione);
			DaoGioco daoG = (DaoGioco) DAO.getDaoInstance(Tabella.Gioco);
			
			Utente u = dao.selectLogin(f.getUsername(), f.getPassword());
			List<Recensione> listaRec = daoR.selectByIdUtente(u.getIdUtente());
			
			List<Gioco> listaG = new ArrayList<Gioco>();
			
			for (Recensione rec : listaRec) {
				listaG.add(daoG.select(rec.getIdGioco()));
			}

			request.getSession().setAttribute("utente", u);
			request.getSession().setAttribute("listaRecensioniUtente", listaRec);
			request.getSession().setAttribute("listaGiochi", listaG);
			
			
			return mapping.findForward("success");
			
		} catch (DAONonTrovatoException e) {
			request.setAttribute("erroreLogin", "Credenziali invalide!");
			return mapping.findForward("stay");
		}catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}
		
	}
	
}
