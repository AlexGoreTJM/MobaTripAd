package moba.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;

public abstract class DAO2 {
	
	protected Connection con;
	protected ResultSet res;
	
	protected DAO2() throws DAOException {
		con = ConnessioneSingleton.getIstanza().getCon();
//		System.out.println("Connessione OK ==> "+con);
	}
	
	public static DAO2 getDaoInstance(Tabella entity) throws DAOException{
		//Pattern FACTORY:
		String path = DAO2.class.getPackage().getName();
		try {
			Class<DAO2> dao = 
		   (Class<DAO2>) Class.forName(path+".Dao"+entity);
			
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
	
	
	//DICHIARAZIONI PROTOTIPI METODI C.R.U.D.:

	public abstract <T> int insert(T entity) throws DAOException;
	
	public abstract <T> T delete(int pk) throws DAOException;
	
	public abstract <T> ArrayList<T> select() throws DAOException;
	public abstract <T> T select(int pk) throws DAOException;

}
