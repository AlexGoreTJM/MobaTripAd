package moba.controller.action;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import moba.controller.form.InserisciGiocoForm;
import moba.model.dao.DAO;
import moba.model.dao.DaoGioco;
import moba.model.dao.DaoNews;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Gioco;
import moba.model.utilita.MailJava;

public class InserisciGioco extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		InserisciGiocoForm igf = (InserisciGiocoForm) form;
		FormFile file1 = igf.getFile1();
		FormFile file2 = igf.getFile2();

		// Get the servers upload directory real path name
		String filePath = "C:\\Users\\ats\\git\\MobaTripAd\\MobaTripAd\\WebContent\\IMGDB\\Gioco";
//		String tomcat = "C:\\Program Files\\apache-tomcat-8.0.32\\webapps\\MobaTripAd\\IMGDB\\Gioco";

		// create the upload folder if not exists
		File folder = new File(filePath);
		if (!folder.exists()) {
			folder.mkdir();
		}

		Date d = new Date(Integer.parseInt(igf.getYear()) - 1900, Integer.parseInt(igf.getMonth()),
				Integer.parseInt(igf.getDay()));

		int idGioco;

		try {
			DaoGioco daoGioco = (DaoGioco) DAO.getDaoInstance(Tabella.Gioco);
			idGioco = daoGioco.insert(new Gioco(igf.getTitolo(), igf.getSh(), Integer.parseInt(igf.getPlayers()),
					(igf.getWeb() == "1") ? true : false, d, Integer.parseInt(igf.getEtaMin()),
					Double.parseDouble(igf.getCostoLancio()), Integer.parseInt(igf.getIdCategoria()),
					Double.parseDouble(igf.getValutazioneSito()), igf.getPro(), igf.getContro(), "tempImg1", "tempImg2",
					igf.getUrlVideo(), igf.getUrlSh(), igf.getRequisiti(), igf.getInfo()));
			
			DaoNews daoNews = (DaoNews) DAO.getDaoInstance(Tabella.News);
			ArrayList<String> listaMail = daoNews.selectAll();
			
			for (int i=0;i<listaMail.size();i++){
				String email = listaMail.get(i);
				MailJava.NewsMail(email, igf.getTitolo(),"http://localhost:8080/MobaTripAd/schedaGioco.do?idGioco="+idGioco);
			}
			

		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}

		String fileName1 = "G0000" + idGioco + "_1.jpg";
		String fileName2 = "G0000" + idGioco + "_2.jpg";

		if (!("").equals(fileName1) && !("").equals(fileName2)) {

			System.out.println("Server path:" + filePath);
			File newFile1 = new File(filePath, fileName1);
			File newFile2 = new File(filePath, fileName2);

			if (!newFile1.exists() && !newFile1.exists()) {
				FileOutputStream fos1 = new FileOutputStream(newFile1);
				fos1.write(file1.getFileData());
				fos1.flush();
				fos1.close();

				FileOutputStream fos2 = new FileOutputStream(newFile2);
				fos2.write(file2.getFileData());
				fos2.flush();
				fos2.close();

				DaoGioco dao = (DaoGioco) DAO.getDaoInstance(Tabella.Gioco);
				dao.updateImg(idGioco, fileName1, fileName2);


			}
		}

		return mapping.findForward("success");
	}
	
	

}

