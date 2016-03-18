package moba.controller.action;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import moba.controller.form.ValidaFile;
import moba.model.dao.DAO;
import moba.model.dao.DaoUtente;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Utente;

public class Upload extends Action {
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
	    throws Exception {
		
	    ValidaFile fileUploadForm = (ValidaFile)form;
		
	    FormFile file = fileUploadForm.getFile();
		
	    //Get the servers upload directory real path name
	    String filePath = "C:\\Program Files\\apache-tomcat-8.0.32\\webapps\\MobaTripAd\\IMGDB\\Utente";
	   // String filePath = "C:\\Users\\ats\\git\\MobaTripAd\\MobaTripAd\\WebContent\\IMGDB\\Gioco";
               
	    
	    //create the upload folder if not exists
	    File folder = new File(filePath);
	    if(!folder.exists()){
	    	folder.mkdir();
	    }
	    
	    int idUtente = ((Utente) request.getSession().getAttribute("utente")).getIdUtente();
	    
	    String fileName = "U0000" + idUtente + ".jpg";
	    
	    
	    
	    if(!("").equals(fileName)){  
	    	
	        System.out.println("Server path:" +filePath);
	        File newFile = new File(filePath, fileName);
	       
              

	        	FileOutputStream fos = new FileOutputStream(newFile);
	        	fos.write(file.getFileData());
	        	fos.flush();
	        	fos.close();
	          
	        	DaoUtente dao = (DaoUtente) DAO.getDaoInstance(Tabella.Utente);
		        dao.updateImg(idUtente, fileName);
		        
		        ((Utente) request.getSession().getAttribute("utente")).setAvatar(fileName);
		        
		        request.setAttribute("uploadedFilePath",newFile.getAbsoluteFile());
		        request.setAttribute("uploadedFileName",newFile.getName());
		        
	        
	    }
		return mapping.findForward("success");
	}
}
