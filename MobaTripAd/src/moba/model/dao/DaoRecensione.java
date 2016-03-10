package moba.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import moba.model.entity.Grado;
import moba.model.entity.Recensione;
import moba.model.entity.Utente;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.eccezioni.DAONonTrovatoException;
import moba.model.dao.enumeratori.Tabella;

public class DaoRecensione extends DAO {
	
	protected DaoRecensione() throws DAOException {
		super();
	}

	
public <T> int insert(T entity) throws DAOException {
		
		Recensione r = (Recensione) entity;
	
		/*
        IDUTENTE	NUMBER
        IDGIOCO	NUMBER
        CTRLIKE	NUMBER
        CTRDISLIKE	NUMBER
        SEGNALATA	NUMBER
        INFO	VARCHAR2(1000 BYTE)
        DATAREC	TIMESTAMP(6)
		 */
		
		String sql = "INSERT INTO recensione "
				+ "(idutente,idgioco,ctrlike,ctrdislike,segnalata,info,datarec) "
				+ "VALUES (?,?,?,?,?,?,?)";
		
		try (PreparedStatement pst = con.prepareStatement(sql)) {
			
			pst.setInt(1, r.getUtente().getIdUtente());
			pst.setInt(2, r.getGioco().getIdGioco());
			pst.setInt(3, r.getCtrLike());
			pst.setInt(4, r.getCtrDislike());
			pst.setInt(5, r.getSegnalata());
			pst.setString(6, r.getInfo());
			pst.setTimestamp(7, r.getDataRec());
			
			//esegue la query così preparata:
			return pst.executeUpdate();
		
		} catch (SQLException e) {

			throw new DAOException("ERRORE INSERT RECENSIONE. "
					+ "Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}
	}

	
	public <T> T delete(int idUtente, int idGioco) throws DAOException {
		throw new DAOException("WARNING: COMANDO NON IMPLEMENTATO!");
	}

		
	public <T> ArrayList<T> select() throws DAOException {
		throw new DAOException("WARNING: COMANDO NON IMPLEMENTATO!");
	}
	
	
	public  Recensione select(int idUtente, int idGioco) throws DAOException {
		String sql = 
		"SELECT idutente, idgioco, ctrlike, ctrdislike, segnalata, info, datarec "
		+"FROM RECENSIONE "
		+"WHERE idutente = ? and idgioco = ?";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			pst.setInt(2, idGioco);
			res = pst.executeQuery(); //esegue la query così preparata
			if(res.next())
				return  componiEntity();
			else
				throw new DAONonTrovatoException
				("WARNING: dati non trovati in GRADO x idUtente: "+idUtente + " e X idGioco "+idGioco);
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT GRADO x nome: "+idUtente
			+". Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}
	
	}
	
	private Recensione componiEntity() throws SQLException, DAOException {
		//SELECT idutente, idgioco, ctrlike, ctrdislike, segnalata, info, datarec 
		return new Recensione(
				 new DaoUtente().select(res.getInt("idutente"))
				,new DaoGioco().select(res.getInt("idgioco")) 
				,res.getInt("ctrlike")
				,res.getInt("ctrdislike")
				,res.getInt("segnalata")
				,res.getString("info")
				,res.getTimestamp("datarec")
				);
	}




	@Override
	public <T> T delete(int pk) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public <T> T select(int idGioco) throws DAOException {
		String sql = 
		"SELECT idutente, idgioco, ctrlike, ctrdislike, segnalata, info, datarec "
		+"FROM RECENSIONE "
		+"WHERE idgioco = ?";
		ArrayList<Recensione> lista = new ArrayList<Recensione>();
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idGioco);
			res = pst.executeQuery(); //esegue la query così preparata
			while(res.next())
				lista.add(componiEntity());
			
			if(lista.size() == 0)
				throw new DAONonTrovatoException
				("WARNING: dati non trovati in RECENSIONE X idGioco "+idGioco);
			return (T) lista;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT RECENSIONE x nome: "+idGioco
			+". Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}
	}
	
	public static void main(String[] args) {
		
		try {
			DaoRecensione dao = (DaoRecensione) DAO.getDaoInstance(Tabella.Recensione);
			
			
		} catch (DAOException e) {
			System.out.println(e.getMessage());
		}

	}
	
	
	
	

}
