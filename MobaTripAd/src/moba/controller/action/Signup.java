package moba.controller.action;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.controller.form.SignupForm;
import moba.model.dao.DAO;
import moba.model.dao.DaoUtente;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.eccezioni.DAOUnivocoException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Grado;
import moba.model.entity.Utente;
import moba.model.utilita.MailJava;

public class Signup extends Action{
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		
		SignupForm f = (SignupForm) form;

		Utente utente = new Utente(f.getUsername()
								 , f.getEmail()
								 , f.getPassword()
								 , f.getNome()
								 , f.getCognome()
								 , new Grado("Peone",1)
								 , "MOBAavatar.png"
								 , f.getInfo());
		try {
			@SuppressWarnings("unused")
			DaoUtente dao = (DaoUtente) DAO.getDaoInstance(Tabella.Utente);

			
			
			final String token = UUID.randomUUID().toString();
			request.getSession().setAttribute("token", token);
			request.getSession().setAttribute("utente", utente);
			MailJava.MandaSignMail(utente.getEmail(), token);
			
			request.setAttribute
			("feedback", "Controlla la tua mail ("+utente.getEmail()+") e conferma la registrazione!");
			System.out.println("Registrazione a buon fine!");
			return mapping.findForward("success");
			
		} catch (DAOUnivocoException e) {
			request.setAttribute("erroreSignup", e.getMessage());
			return mapping.findForward("stay");
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}
		
	}
	
	

}
