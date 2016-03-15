package moba.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.eccezioni.DAONonTrovatoException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Categoria;
import moba.model.entity.Recensione;
import moba.model.entity.Utente;

public class DaoStatistica extends DAO {

	protected DaoStatistica() throws DAOException {
		super();
	}

    public int countUtenti() throws DAOException{
    	
    	String sql = "select count(*) as utenti from utente";
    	
    	try (PreparedStatement pst = con.prepareStatement(sql)) {
			res = pst.executeQuery(); // esegue la query così preparata
			if (res.next())
				return res.getInt("utenti");
			else
				throw new DAONonTrovatoException(
						"WARNING: dati non trovati in UTENTE");

		} catch (SQLException e) {
			throw new DAOException("ERRORE COUNT UTENTE . Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}    	
    }

    public int countGiochi() throws DAOException{
    	
    	String sql = "select count(*) as giochi from gioco";
    	
    	try (PreparedStatement pst = con.prepareStatement(sql)) {
			res = pst.executeQuery(); // esegue la query così preparata
			if (res.next())
				return res.getInt("giochi");
			else
				throw new DAONonTrovatoException(
						"WARNING: dati non trovati in GIOCO");

		} catch (SQLException e) {
			throw new DAOException("ERRORE COUNT GIOCO . Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}    	
    }
    
    
    public int countRecensioni() throws DAOException{
    	
    	String sql = "select count(*) as recensioni from recensione";
    	
    	try (PreparedStatement pst = con.prepareStatement(sql)) {
			res = pst.executeQuery(); // esegue la query così preparata
			if (res.next())
				return res.getInt("recensioni");
			else
				throw new DAONonTrovatoException(
						"WARNING: dati non trovati in RECENSIONE");

		} catch (SQLException e) {
			throw new DAOException("ERRORE COUNT RECENSIONE . Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}    	
    }
    
    
    
    public HashMap<String, Integer> countRecByUtente() throws DAOException{
    	
    	String sql = "select u.nickname as utente, count(r.idutente) as recensioni from utente u left join recensione r on u.idutente = r.idutente where u.admin = 0 group by u.nickname order by recensioni desc";
    	HashMap<String, Integer> map = new HashMap<String, Integer>();
   
    	try (PreparedStatement pst = con.prepareStatement(sql)) {
			res = pst.executeQuery(); // esegue la query così preparata
			
			while(res.next())
				map.put(res.getString("utente"), res.getInt("recensioni"));
			
			if (map.size() == 0)
				throw new DAONonTrovatoException("ERRORE COUNT RECENSIONI_PER_UTENTE");
			
			return map;

		} catch (SQLException e) {
			throw new DAOException("ERRORE COUNT RECENSIONI_PER_UTENTE . Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		} 
    	
    }
    
    
    

    
	@Override
	public <T> int insert(T entity) throws DAOException {
		// TODO Auto-generated method stub
		throw new DAONonTrovatoException("QUESTO METODO NON è IMPLEMENTATO PER LA CLASSE DAOSTATISTICA");
	}

	@Override
	public <T> T delete(int pk) throws DAOException {
		// TODO Auto-generated method stub
		throw new DAONonTrovatoException("QUESTO METODO NON è IMPLEMENTATO PER LA CLASSE DAOSTATISTICA");
	}

	@Override
	public <T> ArrayList<T> select() throws DAOException {
		// TODO Auto-generated method stub
		throw new DAONonTrovatoException("QUESTO METODO NON è IMPLEMENTATO PER LA CLASSE DAOSTATISTICA");
	}

	@Override
	public <T> T select(int pk) throws DAOException {
		// TODO Auto-generated method stub
		throw new DAONonTrovatoException("QUESTO METODO NON è IMPLEMENTATO PER LA CLASSE DAOSTATISTICA");
	}

}
