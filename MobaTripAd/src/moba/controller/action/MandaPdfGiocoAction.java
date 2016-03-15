package moba.controller.action;

import java.io.File;
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
import moba.model.dao.DaoUtente;
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
	//	int idUtente = Integer.parseInt(request.getParameter("idUtente"));
		
		try{
			
			System.out.println("PROVA");
			DaoGioco daoGioco = (DaoGioco) DAO.getDaoInstance(Tabella.Gioco);
			request.setAttribute("gioco", daoGioco.select(idGioco));
			Gioco g = (Gioco) request.getAttribute("gioco");
			System.out.println("DATI GIOCO: "+g.getTitolo()+" "+g.getCategoria().getNome());
			
			/*
		    DaoUtente daoUtente = (DaoUtente) DAO.getDaoInstance(Tabella.Utente);
		    request.setAttribute("utente", daoUtente.select(idUtente));
			Utente u = (Utente) request.getAttribute("utente");
	        System.out.println("DATI UTENTE: "+ u.getNickname());
	        */
			String path = JavaPDF.creaGiocoPDF(g.getTitolo(), 
					g.getSh(),
					g.getPlayers(),
					g.isWeb(),
					g.getDataReg(),
					g.getEtaMin(),
					g.getCostoLancio(),
					g.getCategoria().getNome(),
					g.getValutazioneSito(),
					g.getInfo());
			
			MailJava.MandaGiocoPDFMail("kuno98200@yahoo.it", path, g.getTitolo());
		    System.out.println(path);
		    File file = new File(path);
		    file.delete();
			

			return mapping.findForward("success");
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
	
	}

}
}

