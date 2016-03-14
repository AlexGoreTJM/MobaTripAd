package moba.controller.form;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

public class ValidaFile extends ActionForm {

	 private FormFile myFile;

     public void setMyFile(FormFile myFile) {
         this.myFile = myFile;
     }

     public FormFile getMyFile() {
         return myFile;
     }
}
