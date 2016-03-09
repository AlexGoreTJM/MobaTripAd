package moba.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Colonna;
import moba.model.dao.enumeratori.Tabella;

public abstract class DAO1<T> {
	
	protected Connection con;
	protected ResultSet res;

	protected DAO1() throws DAOException {
		con = ConnessioneSingleton.getIstanza().getCon();
		System.out.println("\nConnessione OK ==> @con: "+con);
	}
	
	public static DAO1 getDaoInstance(Tabella entity) throws DAOException{
		//Pattern FACTORY:
		String path = DAO1.class.getPackage().getName();
		try {
			Class dao = 
			Class.forName(path+".Dao"+entity);
			
			return (DAO1) dao.newInstance(); //adopera costruttore di default 
			
		} catch (ClassNotFoundException e) {
			throw new DAOException
			("ERRORE Factory DAO: stringa invalida x tabella: "+entity);
		} catch (InstantiationException | IllegalAccessException e) {
			throw new DAOException
			("ERRORE Factory DAO: istanziazione fallita x tabella: "+entity);
		}
	}
	
	public void chiudiConnessione() throws DAOException{
		try {
			ConnessioneSingleton.getIstanza().annullaIstanza();
			
		} catch (SQLException | DAOException e) {
			throw new DAOException
			("ERRORE chiusura DB Connection! Causa: "+e.getMessage());
		}
	}

	
	//DICHIARAZIONI PROTOTIPI METODI C.R.U.D.:
	
	public abstract int insert(T entity) throws DAOException;
	
	public abstract T select(int id) throws DAOException;
	public abstract ArrayList<T> select() throws DAOException;
	public abstract ArrayList<T> select(Colonna colonna, Object valore) throws DAOException;
	public abstract ArrayList<T> selectLike(String criterio) throws DAOException;
	
	public abstract T update(T entity) throws DAOException;
	
	public abstract T delete(int id) throws DAOException;
	
}
