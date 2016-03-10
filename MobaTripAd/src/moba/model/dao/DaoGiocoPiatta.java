package moba.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.eccezioni.DAONonTrovatoException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.GiocoPiatta;

public class DaoGiocoPiatta extends DAO {

	protected DaoGiocoPiatta() throws DAOException {
		super();
	}

	@Override
	public <T> int insert(T entity) throws DAOException {

		GiocoPiatta u = (GiocoPiatta) entity;
		
		String sql = "INSERT INTO giocopiatta (idgioco, idpiattaforma) VALUES (?,?)";
		
		try (PreparedStatement pst = con.prepareStatement(sql)) {
			
			pst.setInt(1, u.getIdGioco());
			pst.setInt(2, u.getIdPiattaforma());
			
			//esegue la query così preparata:
			pst.executeUpdate();
			
			return u.getIdGioco();
			
		} catch (SQLException e) {

			throw new DAOException("ERRORE INSERT GIOCOPIATTA. "
					+ "Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}
	}

	@Override
	public <T> T delete(int pk) throws DAOException {

		// WARNING
		throw new DAONonTrovatoException("ERRORE DELETE CATEGORIA NON IMPLEMENTATO " + pk);
	}

	@Override
	public <T> ArrayList<T> select() throws DAOException {
		// WARNING
				throw new DAONonTrovatoException("ERRORE SELECT GIOCOPIATTA NON IMPLEMENTATO ");

	}

	@Override
	public <T> T select(int pk) throws DAOException {
		// WARNING
		throw new DAONonTrovatoException("ERRORE SELECT GIOCOPIATTA PER PK NON IMPLEMENTATO ");
	}
	
	
	//metodo main ESCLUSIVAMENTE x testare tutti i metodi
		public static void main(String[] args) {
			
			try {
				DaoGiocoPiatta dao = (DaoGiocoPiatta) DAO.getDaoInstance(Tabella.GiocoPiatta);
				
				
				System.out.println("\ninsert(entity): "+dao.insert(new GiocoPiatta(1, 1)));
				
				
				System.out.println("\nselect all: "+dao.select());
		
				
			} catch (DAOException e) {
				System.out.println(e.getMessage());
			}

		}

}

