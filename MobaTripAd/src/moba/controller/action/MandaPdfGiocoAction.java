package moba.controller.action;

import java.io.FileNotFoundException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.itextpdf.text.DocumentException;

import moba.model.dao.DAO;
import moba.model.dao.DaoGioco;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Categoria;
import moba.model.entity.Gioco;
import moba.model.entity.Utente;
import moba.model.utilita.JavaPDF;
import moba.model.utilita.MailJava;

public class MandaPdfGiocoAction extends Action {
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws FileNotFoundException, DocumentException {

		int idGioco = Integer.parseInt(request.getParameter("idGioco"));
		try {
			DaoGioco daoGioco = (DaoGioco) DAO.getDaoInstance(Tabella.Gioco);

			
			Gioco g = (Gioco)request.getSession().getAttribute("gioco");
			Utente u = (Utente)request.getSession().getAttribute("utente");
			Categoria categoria = (Categoria)request.getSession().getAttribute("categoria");
			
			String path = JavaPDF.creaGiocoPDF(g.getTitolo(), g.getSh(), g.getPlayers(), g.isWeb(), g.getDataReg(), g.getEtaMin(), g.getCostoLancio(), categoria.getNome(), g.getValutazioneSito());
			MailJava.MandaGiocoPDFMail(u.getEmail(), path, g.getTitolo());
		    
			

			return mapping.findForward("success");

		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}

	}

}
