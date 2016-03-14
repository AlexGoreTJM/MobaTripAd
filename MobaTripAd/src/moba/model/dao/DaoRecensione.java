package moba.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.eccezioni.DAONonTrovatoException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Recensione;

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
			pst.setInt(2, r.getIdGioco());
			pst.setInt(3, r.getCtrLike());
			pst.setInt(4, r.getCtrDislike());
			pst.setInt(5, r.getSegnalata());
			pst.setString(6, r.getInfo());
			pst.setTimestamp(7, r.getDataRec());
			
			//esegue la query cos� preparata:
			int update = pst.executeUpdate();
			
			new DaoUtente().updateUtenteGrado(r.getUtente().getIdUtente());
			
			return update;
			
		
		} catch (SQLException e) {

			throw new DAOException("ERRORE INSERT RECENSIONE. "
					+ "Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}
	}

	
	public <T> T delete(int idUtente, int idGioco) throws DAOException {
		
		Recensione r = this.select(idUtente, idGioco);
		
		String sql = "DELETE FROM RECENSIONE WHERE idutente = ? and idgioco = ?";
		
		try (PreparedStatement pst = con.prepareStatement(sql)) {
			
			pst.setInt(1, r.getUtente().getIdUtente());
			pst.setInt(2, r.getIdGioco());
			
			pst.executeUpdate();		
			
			new DaoUtente().updateUtenteGrado(r.getUtente().getIdUtente());	
			
			return (T) r;
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE DELETE RECENSIONE x idUtente: "+idUtente + " e X idGioco "+idGioco
					+". Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}	
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
			res = pst.executeQuery(); //esegue la query cos� preparata
			if(res.next())
				return  componiEntity();
			else
				throw new DAONonTrovatoException
				("WARNING: dati non trovati in RECENSIONE x idUtente: "+idUtente + " e x idGioco "+idGioco);
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT RECENSIONE x idUtente: "+idUtente + " e x idGioco "+idGioco
			+". Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}
	
	}
	
	private Recensione componiEntity() throws SQLException, DAOException {
		//SELECT idutente, idgioco, ctrlike, ctrdislike, segnalata, info, datarec 
		return new Recensione(
				 new DaoUtente().select(res.getInt("idutente"))
				,res.getInt("idgioco")
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
		+"WHERE idgioco = ? and segnalata = 0";
		ArrayList<Recensione> lista = new ArrayList<Recensione>();
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idGioco);
			res = pst.executeQuery(); //esegue la query cos� preparata
			while(res.next())
				lista.add(componiEntity());
			
			/*if(lista.size() == 0)
				throw new DAONonTrovatoException
				("WARNING: dati non trovati in RECENSIONE X idGioco "+idGioco);*/
			return (T) lista;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT RECENSIONE x nome: "+idGioco
			+". Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}
	}
	
	public int addLike(int idUtente, int idGioco) throws DAOException {
		
		String sql = "UPDATE RECENSIONE SET ctrlike = ctrlike + 1 where idutente = ? and idgioco = ?";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			pst.setInt(2, idGioco);
			
			int update = pst.executeUpdate();
			
			new DaoUtente().updateUtenteGrado(idUtente);
			
			return update;
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE UPDATE RECENSIONE ADD LIKE. "
					+ "Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}
	}
	
	public int addDislike(int idUtente, int idGioco) throws DAOException {
		
		String sql = "UPDATE RECENSIONE SET ctrdislike = ctrdislike + 1 where idutente = ? and idgioco = ?";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			pst.setInt(2, idGioco);
			
			int update = pst.executeUpdate();
			
			new DaoUtente().updateUtenteGrado(idUtente);
			
			return update;
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE UPDATE RECENSIONE ADD DISLIKE. "
					+ "Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}
	}
	
	public int removeLike(int idUtente, int idGioco) throws DAOException {
		
		String sql = "UPDATE RECENSIONE SET ctrlike = ctrlike - 1 where idutente = ? and idgioco = ?";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			pst.setInt(2, idGioco);
			
			int update = pst.executeUpdate();
			
			new DaoUtente().updateUtenteGrado(idUtente);
			
			return update;
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE UPDATE RECENSIONE REMOVE LIKE. "
					+ "Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}
	}
	
	public int removeDislike(int idUtente, int idGioco) throws DAOException {
		
		String sql = "UPDATE RECENSIONE SET ctrdislike = ctrdislike - 1 where idutente = ? and idgioco = ?";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			pst.setInt(2, idGioco);
			
			int update = pst.executeUpdate();
			
			new DaoUtente().updateUtenteGrado(idUtente);
			
			return update;
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE UPDATE RECENSIONE REMOVE DISLIKE. "
					+ "Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}
	}
	
	public int countRecensioniByUtente(int idUtente) throws DAOException {
		String sql = "SELECT COUNT(*) AS recensioni FROM RECENSIONE WHERE idutente = ? GROUP BY idutente";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			res = pst.executeQuery();
			
			if (res.next())
				return res.getInt("recensioni");
			else
				throw new DAONonTrovatoException
				("WARNING: dati non trovati in RECENSIONE X idUtente "+idUtente);
						

		} catch (SQLException e) {
			throw new DAOException("ERRORE COUNT RECENSIONE X idutente: "+idUtente
			+". Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}
	}
	
	public int countLikeByUtente(int idUtente) throws DAOException {
		String sql = "SELECT SUM(ctrlike) AS likes FROM RECENSIONE WHERE idutente = ? GROUP BY idutente";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			res = pst.executeQuery();
			
			if (res.next())
				return res.getInt("likes");
			else
				throw new DAONonTrovatoException
				("WARNING: like non trovati in RECENSIONE X idUtente "+idUtente);
						

		} catch (SQLException e) {
			throw new DAOException("ERRORE COUNT LIKE X idutente: "+idUtente
			+". Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}
	}
	
	public int countDislikeByUtente(int idUtente) throws DAOException {
		String sql = "SELECT SUM(ctrdislike) AS dislikes FROM RECENSIONE WHERE idutente = ? GROUP BY idutente";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			res = pst.executeQuery();
			
			if (res.next())
				return res.getInt("dislikes");
			else
				throw new DAONonTrovatoException
				("WARNING: dislike non trovati in RECENSIONE X idUtente "+idUtente);
						

		} catch (SQLException e) {
			throw new DAOException("ERRORE COUNT DISLIKE X idutente: "+idUtente
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
