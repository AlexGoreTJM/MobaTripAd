package moba.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Gioco;

public class DaoNews extends DAO{

	protected DaoNews() throws DAOException {
		super();
	
	}

	public <T> int insert(String email) throws DAOException {

		String sql = "INSERT INTO NEWS"
				+ " (email) "
				+ "values (?)";
		
		try (PreparedStatement pst = con.prepareStatement(sql, new String[] { "email" })) {

			pst.setString(1, email);
			return pst.executeUpdate();
			
		}

		catch (SQLException e) {
			throw new DAOException("ERRORE NELL'INSERIMENTO" + e.getMessage());
		}
		
	}	
		
		public boolean getEmail(String email) throws DAOException {

			String sql = "SELECT email FROM news " + "WHERE email = ?";

			try (PreparedStatement pst = con.prepareStatement(sql)) {

				pst.setString(1, email);
				res = pst.executeQuery();
				if (res.next())
					return true;
				else
					return false;
			} catch (SQLException e) {
				throw new DAOException("ERRORE SELECT UTENTE x recupero email: " + email + ". Causa: " + e.getMessage()
						+ " Errorcode: " + e.getErrorCode());
			}
		}	
		
		
		
		
	

	
	public  <T> int delete(String email) throws DAOException {
		String sql = "DELETE FROM news WHERE email = ?";
		
		try (PreparedStatement pst = con.prepareStatement(sql)){
			pst.setString(1, email);
			return pst.executeUpdate();
			
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE DELETE NEWS: " + email
					+ ". Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
			
		}	
	}

	@Override
	public <T> ArrayList<T> select() throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> T select(int pk) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> int insert(T entity) throws DAOException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public <T> T delete(int pk) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	/*
	public static void main(String[] args) {

		try {
			DaoNews dao = (DaoNews) DAO.getDaoInstance(Tabella.News);

			dao.delete("kuno98200@yahoo.it");

		} catch (DAOException e) {
			System.out.println(e.getMessage());
		}

	}
	*/
	

}


