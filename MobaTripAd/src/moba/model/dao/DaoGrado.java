package moba.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import moba.model.entity.Grado;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.eccezioni.DAONonTrovatoException;

public class DaoGrado extends DAO {

	protected DaoGrado() throws DAOException {
		super();
	}

	@Override
	public <T> int insert(T entity) throws DAOException {
		throw new DAOException("WARNING: COMANDO NON IMPLEMENTATO!");
	}

	@Override
	public <T> T delete(int pk) throws DAOException {
		throw new DAOException("WARNING: COMANDO NON IMPLEMENTATO!");
	}

	
	
	
	
	@Override
	public <T> ArrayList<T> select() throws DAOException {
		throw new DAOException("WARNING: COMANDO NON IMPLEMENTATO!");
	}
	
	
	
	
	
	


	public  Grado select(String pk) throws DAOException {
		String sql = 
		"SELECT nome,peso "
		+"FROM GRADO "
		+"WHERE nome = ?";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setString(1, pk);
			res = pst.executeQuery(); //esegue la query così preparata
			if(res.next())
				return  componiEntity();
			else
				throw new DAONonTrovatoException
				("WARNING: dati non trovati in GRADO x pk: "+pk);
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT GRADO x pk: "+pk
			+". Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}
	
	}
	
	private Grado componiEntity() throws SQLException, DAOException {
		return new Grado(res.getString("nome"),res.getDouble("peso"));
	}

	@Override
	public <T> T select(int pk) throws DAOException {
		throw new DAOException("WARNING: COMANDO NON IMPLEMENTATO!");
	}
	
	
	
	

	
	
}
