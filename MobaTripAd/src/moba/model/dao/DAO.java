package moba.model.dao;

//Classe astratta DAO che viene estesa dai singoli DAO.

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;

public abstract class DAO {
	
	protected Connection con;
	protected ResultSet res;
	
	protected DAO() throws DAOException {
		con = ConnessioneSingleton.getIstanza().getCon();
	}
	
	public static DAO getDaoInstance(Tabella entity) throws DAOException{
		//Pattern FACTORY:
		String path = DAO.class.getPackage().getName();
		try {
			@SuppressWarnings("unchecked")
			Class<DAO> dao = 
		   (Class<DAO>) Class.forName(path+".Dao"+entity);
			
			return dao.newInstance(); //adopera costruttore di default 
			
		} catch (ClassNotFoundException e) {
			throw new DAOException
			("ERRORE Factory DAO: stringa invalida x tabella: "+entity);
		} catch (InstantiationException | IllegalAccessException e) {
			throw new DAOException
			("ERRORE Factory DAO: istanziazione fallita x tabella: "+entity);
		}
	}
	
	public void chiudiConnessione() throws DAOException {
		try {
			ConnessioneSingleton.getIstanza().annullaIstanza();
			
		} catch (SQLException | DAOException e) {
			throw new DAOException
			("ERRORE chiusura DB Connection! Causa: "+e.getMessage());
		}
	}
	
	
	public abstract <T> int insert(T entity) throws DAOException;
	
	public abstract <T> T delete(int pk) throws DAOException;
	
	public abstract <T> ArrayList<T> select() throws DAOException;
	public abstract <T> T select(int pk) throws DAOException;

}
