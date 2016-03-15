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
import moba.model.entity.Gioco;
import java.sql.Date;

public class InserisciGioco extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		Date d = new Date(Integer.parseInt(request.getParameter("year")), Integer.parseInt(request.getParameter("month")), Integer.parseInt(request.getParameter("day")));
		try {
			DaoGioco daoGioco = (DaoGioco) DAO.getDaoInstance(Tabella.Gioco);
			daoGioco.insert(new Gioco(request.getParameter("InputTitolo"), 
					request.getParameter("InputSh"),
					Integer.parseInt(request.getParameter("InputPlayers")), 
					(request.getParameter("InputWeb")=="1")? true : false,
					d, 
					Integer.parseInt(request.getParameter("InputEtaMin")),
					Double.parseDouble(request.getParameter("InputCostoLancio")), 
					Integer.parseInt(request.getParameter("InputIdCategoria")),
					Double.parseDouble(request.getParameter("InputValutazioneSito")), 
					request.getParameter("InputPro"),
					request.getParameter("InputContro"), 
					"tempImg1",
					"tempImg2", 
					request.getParameter("InputUrlVideo"),
					request.getParameter("InputUrlSh"),
					request.getParameter("InputRequisiti"),
					request.getParameter("InputInfo")));
			
			return mapping.findForward("success");
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}
		
	}

}
