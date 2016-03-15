package moba.controller.action;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.FileStore;
import java.nio.file.FileSystem;

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
	    String filePath = "C:\\Users\\ats\\git\\MobaTripAd\\MobaTripAd\\WebContent\\IMGDB\\Utente";
               
	    
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
	       
              
	        if(!newFile.exists()){
	        	FileOutputStream fos = new FileOutputStream(newFile);
	        	fos.write(file.getFileData());
	        	fos.flush();
	        	fos.close();
	          
	        	DaoUtente dao = (DaoUtente) DAO.getDaoInstance(Tabella.Utente);
		        dao.updateImg(idUtente, fileName);
		        
		        ((Utente) request.getSession().getAttribute("utente")).setAvatar(fileName);
	        } else {
	        	int i = 0;
	        	while(newFile.exists()){
	        		i++;
	        		String newFileName = "U0000" + idUtente  + "(" + i + ")" + ".jpg";
	        		newFile.renameTo(new File(filePath, newFileName));
	        		
	    	        DaoUtente dao = (DaoUtente) DAO.getDaoInstance(Tabella.Utente);
	    	        dao.updateImg(idUtente, newFileName);
	    	        
	    	        ((Utente) request.getSession().getAttribute("utente")).setAvatar(newFileName);
	    	        
	        	}
	        	FileOutputStream fos = new FileOutputStream(newFile);
		        fos.write(file.getFileData());
		        fos.flush();
		        fos.close();
	        }
	        
	        request.setAttribute("uploadedFilePath",newFile.getAbsoluteFile());
	        request.setAttribute("uploadedFileName",newFile.getName());
	        
	    }
		return mapping.findForward("success");
	}
}
