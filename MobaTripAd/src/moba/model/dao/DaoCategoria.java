package moba.model.dao;

//Classe java contenente i dao della tabella Categoria.

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.eccezioni.DAONonTrovatoException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Categoria;

public class DaoCategoria extends DAO {

	protected DaoCategoria() throws DAOException {
		super();
	}

	@Override
	public <T> int insert(T entity) throws DAOException {

		// WARNING
		throw new DAONonTrovatoException("ERRORE INSERT CATEGORIA NON IMPLEMENTATO");
	}

	@Override
	public <T> T delete(int pk) throws DAOException {

		// WARNING
		throw new DAONonTrovatoException("ERRORE DELETE CATEGORIA NON IMPLEMENTATO " + pk);
	}

	@Override
	public <T> ArrayList<T> select() throws DAOException {
		String sql = "SELECT idcategoria, nome, img, info FROM moba.categoria ORDER BY nome ";
		ArrayList<T> lista = new ArrayList<T>();
		try (PreparedStatement pst = con.prepareStatement(sql)) {

			res = pst.executeQuery();

			while (res.next())
				lista.add(componiEntity());
			if (lista.size() == 0)
				throw new DAONonTrovatoException("ERRORE SELECT CATEGORIA");
			return lista;
		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT ALL. Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}

	}

	@Override
	public <T> T select(int pk) throws DAOException {
		String sql = "SELECT idcategoria, nome, img, info FROM moba.categoria WHERE idcategoria=? ";

		try (PreparedStatement pst = con.prepareStatement(sql)) {

			pst.setInt(1, pk);

			res = pst.executeQuery();

			if (res.next())
				return componiEntity();
			else
				throw new DAONonTrovatoException("ERRORE SELECT CATEGORIA");

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT CATEGORIA x pk: " + pk + ". Causa: " + e.getMessage() + " Errorcode: "
					+ e.getErrorCode());
		}

	}

	@SuppressWarnings("unchecked")
	private <T> T componiEntity() throws SQLException {
		return (T) new Categoria(res.getInt("idcategoria"), res.getString("nome"), res.getString("img"),
				res.getString("info"));
	}
	
	
	//metodo main ESCLUSIVAMENTE x testare tutti i metodi
		public static void main(String[] args) {
			
			try {
				DaoCategoria dao = (DaoCategoria) DAO.getDaoInstance(Tabella.Categoria);
				
				
				System.out.println("\nselect(pk): "+dao.select(1));
				
				
				System.out.println("\nselect all: "+dao.select());
		
				
			} catch (DAOException e) {
				System.out.println(e.getMessage());
			}

		}

}
