package moba.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.controller.form.InserisciGiocoForm;
import moba.model.dao.DAO;
import moba.model.dao.DaoGioco;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Gioco;
import java.sql.Date;

public class InserisciGioco extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		InserisciGiocoForm igf = (InserisciGiocoForm) form;
		Date d = new Date(Integer.parseInt(igf.getYear()), Integer.parseInt(igf.getMonth()), Integer.parseInt(igf.getDay()));
		try {
			DaoGioco daoGioco = (DaoGioco) DAO.getDaoInstance(Tabella.Gioco);
			daoGioco.insert(new Gioco(igf.getTitolo(), 
					igf.getSh(),
					Integer.parseInt(igf.getPlayers()), 
					(igf.getWeb()=="1")? true : false,
					d, 
					Integer.parseInt(igf.getEtaMin()),
					Double.parseDouble(igf.getCostoLancio()), 
					Integer.parseInt(igf.getIdCategoria()),
					Double.parseDouble(igf.getValutazioneSito()), 
					igf.getPro(),
					igf.getContro(), 
					"tempImg1",
					"tempImg2", 
					igf.getUrlVideo(),
					igf.getUrlSh(),
					igf.getRequisiti(),
					igf.getInfo()));
			
			return mapping.findForward("success");
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}
		
	}

}
