package moba.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

import moba.model.dao.eccezioni.DAOConnessioneException;

public class ConSingleton {
	
	private static ConSingleton istanza;
	private Connection con;

	private ConSingleton() throws DAOConnessioneException {
		//tutta la logica JDBC x ottenere la Connection:
		try {
			ResourceBundle rb = ResourceBundle.getBundle("popolazione.info.db");
			
			Class.forName(rb.getString("drv")); //"oracle.jdbc.driver.OracleDriver"
			con = DriverManager.getConnection(rb.getString("url")+rb.getString("sid")
											 ,rb.getString("usr")
											 ,rb.getString("psw"));
			
		} catch (ClassNotFoundException | MissingResourceException e) {
			throw new DAOConnessioneException
			("ERRORE Connessione: MasterClass NON trovata o file info DB non trovato!");
		} catch (SQLException e) {
			throw new DAOConnessioneException("ERRORE Connessione: url/credenziali invalide!");
		}
	}

	public static ConSingleton getIstanza() throws DAOConnessioneException {
		if(istanza==null)
			istanza= new ConSingleton();
		
		return istanza;
	}

	public Connection getCon() {
		return con;
	}
	
	public void annullaIstanza() throws DAOConnessioneException{
		try {
			con.close();
			istanza = null;
		} catch (SQLException e) {
			throw new DAOConnessioneException("ERRORE Chiusura Connessione! Causa: "+e.getMessage());
		}
	}
	
}
