package moba.controller.action;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.model.entity.Utente;

public class Logout extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		
		//recupera il nick Utente dalla sessione:
		Utente utente = (Utente) request.getSession().getAttribute("utente");
		
		Enumeration<String> beanInSessione = 		
		request.getSession().getAttributeNames();
		
		//scorre TUTTI i bean in sessione e li rimuove uno-ad-uno:
		System.out.println("\nLOGOUT ==> rimozione bean da Session:");
		while (beanInSessione.hasMoreElements()) {
			String bean = (String) beanInSessione.nextElement();
			System.out.println(bean);
			request.getSession().removeAttribute( bean );
		}
		
		request.setAttribute
		("feedback","Ciao "+utente.getNickname()+", alla prossima! :)");
		
		return mapping.findForward("success");
	}

}
