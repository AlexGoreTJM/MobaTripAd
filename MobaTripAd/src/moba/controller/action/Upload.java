package moba.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.chain.contexts.ServletActionContext;
import org.apache.struts.upload.FormFile;
import org.apache.struts.upload.MultipartRequestWrapper;

import moba.controller.form.ValidaFile;

public class Upload extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ValidaFile myForm = (ValidaFile)form;

        FormFile myFile = myForm.getMyFile();
        String contentType = myFile.getContentType();
        String fileName    = myFile.getFileName();
        int fileSize       = myFile.getFileSize();
        byte[] fileData    = myFile.getFileData();
        
        
		
		return super.execute(mapping, form, request, response);
	}
}
