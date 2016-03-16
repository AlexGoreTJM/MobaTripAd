package moba.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.model.utilita.MailJava;

public class ContactUs  extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String messaggio = request.getParameter("messaggio");
		int valore = Integer.parseInt(request.getParameter("valore"));
		if(valore == 7){
			MailJava.ContattaMail(nome,email,messaggio);
			return mapping.findForward("success");
		}
		return mapping.findForward("failure");
		
	}

}
