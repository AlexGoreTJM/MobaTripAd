package moba.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

import moba.model.dao.eccezioni.DAOConnessioneException;
import moba.model.dao.eccezioni.DAOException;

public class ConnessioneSingleton {
	
	private static ConnessioneSingleton istanza;
	private Connection con;
	
	private ConnessioneSingleton() throws DAOException {
		try {  //Connessione al DB:
			ResourceBundle rb = ResourceBundle.getBundle("moba.info.db");
			
			Class.forName(rb.getString("driver"));
			con = DriverManager.getConnection(rb.getString("url")
											 +rb.getString("sid")
											 ,rb.getString("usr")
											 ,rb.getString("psw"));
			
			System.out.println("\n>>> Connessione OK ==> "+con);
			
		} catch (ClassNotFoundException e) {
			throw new DAOConnessioneException("Driver DB Mancante!");
		} catch (SQLException e) {
			throw new DAOConnessioneException("url DB e/o userid/psw errati!");
		}
	}

	static ConnessioneSingleton getIstanza() throws DAOException {
		//devo tornare solo una volta me stesso
		if(istanza==null)
			istanza = new ConnessioneSingleton();
		
		return istanza;
	}

	Connection getCon() {
		return con;
	}

	public void annullaIstanza() throws SQLException {
		con.close();
		istanza = null;
	}


}
