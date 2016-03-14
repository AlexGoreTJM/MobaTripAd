package moba.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.eccezioni.DAONonTrovatoException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Valutazione;

public class DaoValutazione extends DAO {

	protected DaoValutazione() throws DAOException {
		super();
		// TODO Auto-generated constructor stub
	}

public <T> int insert(T entity) throws DAOException {
		
		Valutazione v = (Valutazione) entity;
	
		/*
        IDUTENTE	NUMBER
        IDGIOCO	NUMBER
        VOTO NUMBER
		 */
		
		String sql = "INSERT INTO valutazione "
				+ "(idutente,idgioco,voto) "
				+ "VALUES (?,?,?)";
		
		try (PreparedStatement pst = con.prepareStatement(sql)) {
			
			pst.setInt(1, v.getUtente().getIdUtente());
			pst.setInt(2, v.getGioco().getIdGioco());
			pst.setInt(3, v.getVoto());
			
			//esegue la query così preparata:
			return pst.executeUpdate();
						
		} catch (SQLException e) {

			throw new DAOException("ERRORE INSERT RECENSIONE. "
					+ "Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}
	}

	@Override
	public <T> T delete(int pk) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> ArrayList<T> select() throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	public  Valutazione select(int idUtente, int idGioco) throws DAOException {
		String sql = 
		"SELECT idutente, idgioco, voto "
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
				("WARNING: dati non trovati in VALUTAZIONE x idUtente: "+idUtente + " e X idGioco "+idGioco);
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT GRADO x nome: "+idUtente
			+". Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}
	
	}
	
	
	private Valutazione componiEntity() throws SQLException, DAOException {
		//SELECT idutente, idgioco, voto
		return new Valutazione(
				 new DaoUtente().select(res.getInt("idutente"))
				,new DaoGioco().select(res.getInt("idgioco")) 
				,res.getInt("voto")
				);
	}

	@Override
	public <T> T select(int pk) throws DAOException {
		throw new DAOException("WARNING: COMANDO NON IMPLEMENTATO");
	}
	
	
	public double getAvgValutazioneByIdGioco(int idGioco) throws DAOException{
		
		String sql = 
				"SELECT avg(voto) as votoMedio "
				+"FROM valutazione "
				+"WHERE idgioco = ?";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idGioco);
			res = pst.executeQuery(); //esegue la query così preparata
			if(res.next())
				return  res.getDouble("votoMedio");
			else
				throw new DAONonTrovatoException
				("WARNING: dati non trovati in VALUTAZIONE x idGioco "+idGioco);
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT GRADO x nome: "+idGioco
			+". Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}
		
		
	}
	
	  public static void main(String[] args) {
			try {
				DaoValutazione dao = (DaoValutazione) getDaoInstance(Tabella.Valutazione);
				System.out.println("getAvgValutazione: " + dao.getAvgValutazioneByIdGioco(1));
			} catch (DAOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	

}
