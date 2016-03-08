package moba.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Colonna;
import moba.model.dao.enumeratori.Tabella;

public abstract class DAO<T> {
	
	protected Connection con;
	protected ResultSet res;

	protected DAO() throws DAOException {
		con = ConSingleton.getIstanza().getCon();
		System.out.println("\nConnessione OK ==> @con: "+con);
	}
	
	public void chiudiConnessione() throws DAOException{
		ConSingleton.getIstanza().annullaIstanza();
	}
	
	public static DAO getDAO(Tabella entity) throws DAOException{
		
		String path = DAO.class.getPackage().getName();
		try {
			Class cdao = Class.forName(path+".DAO"+entity);
			return (DAO) cdao.newInstance();
			
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
			throw new DAOException("Factory DAO Fallita x entity: "+entity);
		}	
	}

	//metodi C.R.U.D.:
	
	public abstract int insert(T entity) throws DAOException;
	
	public abstract T select(int id) throws DAOException;
	public abstract ArrayList<T> select() throws DAOException;
	public abstract ArrayList<T> select(Colonna colonna, Object valore) throws DAOException;
	public abstract ArrayList<T> selectLike(String criterio) throws DAOException;
	
	public abstract T update(T entity) throws DAOException;
	
	public abstract T delete(int id) throws DAOException;
	
}
