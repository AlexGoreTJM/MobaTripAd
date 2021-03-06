package moba.controller.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.controller.form.RecensioneForm;
import moba.model.dao.DAO;
import moba.model.dao.DaoGioco;
import moba.model.dao.DaoRecensione;
import moba.model.dao.DaoValutazione;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Gioco;
import moba.model.entity.Recensione;
import moba.model.entity.Utente;
import moba.model.entity.Valutazione;

public class AggiungiRecensione extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		
		RecensioneForm rf = (RecensioneForm) form;
		HttpSession session = request.getSession();
		
		int idGioco = Integer.parseInt(request.getParameter("idGioco"));
		int idUtente = ((Utente)session.getAttribute("utente")).getIdUtente();
		
		try {
			DaoRecensione daoRecensione = (DaoRecensione) DAO.getDaoInstance(Tabella.Recensione);
			DaoValutazione daoValutazione = (DaoValutazione) DAO.getDaoInstance(Tabella.Valutazione);
			DaoGioco daoG = (DaoGioco) DAO.getDaoInstance(Tabella.Gioco);

			daoRecensione.insert(new Recensione(idUtente, idGioco, rf.getRecensione()));
			daoValutazione.insert(new Valutazione(idUtente, idGioco, Integer.parseInt(request.getParameter("voto"))));
			
			List<Recensione> listaRec = daoRecensione.selectByIdUtente(idUtente);
			List<Gioco> listaG = new ArrayList<Gioco>();
			
			for (Recensione rec : listaRec) {
				listaG.add(daoG.select(rec.getIdGioco()));
			}
			session.setAttribute("listaRecensioniUtente", listaRec);
			session.setAttribute("listaGiochi", listaG);
			
			return mapping.findForward("success");

		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}

	}
	
}
