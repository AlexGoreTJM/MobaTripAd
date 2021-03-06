package moba.controller.action;

//Action che si occupa di inviare un pdf ad un utente tramite email.

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import moba.model.entity.Gioco;
import moba.model.entity.Utente;
import moba.model.utilita.JavaPDF;
import moba.model.utilita.MailJava;

public class MandaPdfGiocoAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws DocumentException, MalformedURLException, IOException {
		HttpSession session = request.getSession();
		int idGioco = Integer.parseInt(request.getParameter("idGioco"));
		System.out.println(idGioco);
		int idUtente = ((Utente) session.getAttribute("utente")).getIdUtente();

		try {

			DaoGioco daoGioco = (DaoGioco) DAO.getDaoInstance(Tabella.Gioco);
			request.setAttribute("gioco", daoGioco.select(idGioco));
			Gioco g = (Gioco) request.getAttribute("gioco");

			DaoUtente daoUtente = (DaoUtente) DAO.getDaoInstance(Tabella.Utente);
			request.setAttribute("utente", daoUtente.select(idUtente));
			String email = daoUtente.recuperaEmail(idUtente);
			String path_img = "C:/Users/ats/git/MobaTripAd/MobaTripAd/WebContent/IMGDB/Gioco/" + g.getImg1();
			String path = JavaPDF.creaGiocoPDF(g.getTitolo(), path_img, g.getSh(), g.getPlayers(), g.isWeb(),
					g.getDataReg(), g.getEtaMin(), g.getCostoLancio(), g.getCategoria().getNome(),
					g.getValutazioneSito(), g.getInfo());

			MailJava.MandaGiocoPDFMail(email, path, g.getTitolo());
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
