package moba.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.eccezioni.DAONonTrovatoException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.dao.DaoGrado;
import moba.model.entity.Grado;
import moba.model.entity.Utente;

public class DaoUtente extends DAO{

	protected DaoUtente() throws DAOException {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public <T> int insert(T entity) throws DAOException {
		
		Utente u = (Utente) entity;
		System.out.println(u.getPassword());
		
		String sql = "INSERT INTO utente "
				+ "(admin, nickname, email, password, nome, cognome, grado, avatar, info) "
				+ "VALUES (?,?,?,?,?,?,?,?,?)";
		
		try (PreparedStatement pst = con.prepareStatement(sql, new String[] {"idutente"})) {
			
			pst.setInt(1, u.isAdmin()? 1 : 0);
			pst.setString(2, u.getNickname());
			pst.setString(3, u.getEmail());
			pst.setString(4, u.getPassword());
			pst.setString(5, u.getNome());
			pst.setString(6, u.getCognome());
			pst.setString(7, u.getGrado().getNome());
			pst.setString(8, u.getAvatar());
			pst.setString(9, u.getInfo());
			
			//esegue la query così preparata:
			pst.executeUpdate();
			
			//reperimento valore PK generata:
			res = pst.getGeneratedKeys();
			res.next();
			return res.getInt(1);
			
		} catch (SQLException e) {

			throw new DAOException("ERRORE INSERT UTENTE. "
					+ "Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}
	}

	
	@Override
	public <T> T delete(int pk) throws DAOException {

		Utente u = this.select(pk);
		
		String sql = "DELETE FROM utente WHERE idutente = ?";
		
		try (PreparedStatement pst = con.prepareStatement(sql)){
			
			pst.setInt(1, pk);
			pst.executeUpdate();
			
			return (T)u;
		} catch (SQLException e) {

			throw new DAOException("ERRORE DELETE UTENTE x pk="+pk
					+". Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}
		
	}

	
	@Override
	public <T> ArrayList<T> select() throws DAOException {
		throw new DAOException("WARNING: COMANDO NON IMPLEMENTATO!");
	}
	

	@Override
	public <T> T select(int pk) throws DAOException {

		String sql = 
		"SELECT idutente, admin, nickname, email, password, nome, cognome, grado, avatar, datareg, info "
		+"FROM utente "
		+"WHERE idutente = ?";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, pk);
			res = pst.executeQuery(); //esegue la query così preparata
			if(res.next())
				return componiEntity();
			else
				throw new DAONonTrovatoException
				("WARNING: dati non trovati in UTENTE x pk: "+pk);
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT UTENTE x pk: "+pk
			+". Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}
		
	}
	
	public Utente selectLogin(String login, String password) throws DAOException {

		String sql = 
		"SELECT idutente, admin, nickname, email, password, nome, cognome, grado, avatar, datareg, info "
		+"FROM utente "
		+"WHERE (nickname = ? or email = ?) and password = ?";
		
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setString(1, login);
			pst.setString(2, login);
			pst.setString(3, password);
			res = pst.executeQuery(); //esegue la query così preparata
			if(res.next())
				return componiEntity();
			else
				throw new DAONonTrovatoException
				("WARNING: dati non trovati in UTENTE x login: "+login+" and password: "+password);
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT UTENTE x login: "+login+" and password: "+password
			+". Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}
		
	}

	private <T> T componiEntity() throws SQLException,DAOException{
		
		return  (T) new Utente(res.getInt("idutente")
				,res.getInt("admin")==0 ? false : true
				,res.getString("nickname")
				,res.getString("email")
				,res.getString("password")
				,res.getString("nome")
				,res.getString("cognome") 
				,(Grado)new DaoGrado().select(res.getString("grado"))
				,res.getString("avatar") 
				,res.getTimestamp("datareg") 
				,res.getString("info"));
	}
	
	//metodo main ESCLUSIVAMENTE x testare tutti i metodi
	public static void main(String[] args) {
		
		try {
			DaoUtente dao = (DaoUtente) DAO.getDaoInstance(Tabella.Utente);
			
			Utente u = new Utente(false, "skyzzo", "skyzzo@christian.com","password", "Matteo", "Matteo", "Peone", "moba.jpg", null);
			int i = dao.insert(u);
			System.out.println("\ninsert(Utente): "+ i);

			System.out.println("\nselect(pk): "+dao.select(i));
			
			System.out.println("\ndelete(pk)" + dao.delete(i));

			System.out.println("\nselect(pk): "+dao.select(i));
			
			
			
			System.out.println("\nselect all: "+dao.select());
	
			
		} catch (DAOException e) {
			System.out.println(e.getMessage());
		}

	}
	
	

}
