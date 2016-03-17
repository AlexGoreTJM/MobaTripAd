package moba.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.eccezioni.DAONonTrovatoException;
import moba.model.entity.Piattaforma;
import moba.model.entity.Shop;

public class DaoShop extends DAO{

	protected DaoShop() throws DAOException {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public <T> int insert(T entity) throws DAOException {
		// WARNING
				throw new DAONonTrovatoException("ERRORE INSERT SHOP NON IMPLEMENTATO");
	}

	@Override
	public <T> T delete(int pk) throws DAOException {
		// WARNING
				throw new DAONonTrovatoException("ERRORE DELETE SHOP NON IMPLEMENTATO");
	}

	@Override
	public <T> ArrayList<T> select() throws DAOException {
		// WARNING
				throw new DAONonTrovatoException("ERRORE SELECT SHOP NON IMPLEMENTATO");
	}

	@Override
	public <T> T select(int idGioco) throws DAOException {
		
		ArrayList<T> lista = new ArrayList<T>();
		String sql = "SELECT idgioco, idpiattaforma, link FROM moba.shop WHERE idgioco=? ";

		try (PreparedStatement pst = con.prepareStatement(sql)) {

			pst.setInt(1, idGioco);

			res = pst.executeQuery();

			while (res.next())
				lista.add(componiEntity());
			return (T) lista;
		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT ALL. Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}
		
	}

	private <T> T componiEntity() throws SQLException{
		return (T) new Shop(res.getInt("idGioco"), res.getInt("idPiattaforma"), res.getString("link"));
	}

	
}
