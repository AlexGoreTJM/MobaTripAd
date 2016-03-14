package moba.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.eccezioni.DAONonTrovatoException;
import moba.model.dao.eccezioni.DAOUnivocoException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Grado;
import moba.model.entity.Utente;

public class DaoUtente extends DAO {

	protected DaoUtente() throws DAOException {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public <T> int insert(T entity) throws DAOException{

		Utente u = (Utente) entity;
		System.out.println(u.getPassword());

		String sql = "INSERT INTO utente " + "(admin, nickname, email, password, nome, cognome, grado, avatar, info) "
				+ "VALUES (?,?,?,?,?,?,?,?,?)";

		try (PreparedStatement pst = con.prepareStatement(sql, new String[] { "idutente" })) {

			pst.setInt(1, u.isAdmin() ? 1 : 0);
			pst.setString(2, u.getNickname());
			pst.setString(3, u.getEmail());
			pst.setString(4, u.getPassword());
			pst.setString(5, u.getNome());
			pst.setString(6, u.getCognome());
			pst.setString(7, u.getGrado().getNome());
			pst.setString(8, u.getAvatar());
			pst.setString(9, u.getInfo());

			// esegue la query così preparata:
			pst.executeUpdate();

			// reperimento valore PK generata:
			res = pst.getGeneratedKeys();
			res.next();
			return res.getInt(1);

		} catch (SQLException e) {

			if(e.getErrorCode() == 1){
				
				if (e.getMessage().matches("EMAIL")){
				
					throw new DAOUnivocoException("EMAIL già registrata");
					
				} else if(e.getMessage().matches("NICKNAME")){
					
					throw new DAOUnivocoException("NICKNAME già presente");
				}
			}
				
			throw new DAOException(
					"ERRORE INSERT UTENTE. " + "Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		} 
	}

	@Override
	public <T> T delete(int pk) throws DAOException {

		Utente u = this.select(pk);

		String sql = "DELETE FROM utente WHERE idutente = ?";

		try (PreparedStatement pst = con.prepareStatement(sql)) {

			pst.setInt(1, pk);
			pst.executeUpdate();

			return (T) u;
		} catch (SQLException e) {

			throw new DAOException("ERRORE DELETE UTENTE x pk=" + pk + ". Causa: " + e.getMessage() + " Errorcode: "
					+ e.getErrorCode());
		}

	}

	@Override
	public <T> ArrayList<T> select() throws DAOException {
		throw new DAOException("WARNING: COMANDO NON IMPLEMENTATO!");
	}

	@Override
	public <T> T select(int pk) throws DAOException {

		String sql = "SELECT idutente, admin, nickname, email, password, nome, cognome, grado, avatar, datareg, info "
				+ "FROM utente " + "WHERE idutente = ?";

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, pk);
			res = pst.executeQuery(); // esegue la query così preparata
			if (res.next())
				return componiEntity();
			else
				throw new DAONonTrovatoException("WARNING: dati non trovati in UTENTE x pk: " + pk);

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT UTENTE x pk: " + pk + ". Causa: " + e.getMessage() + " Errorcode: "
					+ e.getErrorCode());
		}

	}

	public Utente selectLogin(String username, String password) throws DAOException {

		String sql = "SELECT idutente, admin, nickname, email, password, nome, cognome, grado, avatar, datareg, info "
				+ "FROM utente " + "WHERE (nickname = ? or email = ?) and password = ?";

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setString(1, username);
			pst.setString(2, username);
			pst.setString(3, password);
			res = pst.executeQuery(); // esegue la query così preparata
			if (res.next())
				return componiEntity();
			else
				throw new DAONonTrovatoException(
						"Credenziali invalide: login: " + username + " and password: " + password);

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT UTENTE x login: " + username + " and password: " + password
					+ ". Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}

	}

	public String recuperaPassword(String username) throws DAOException {

		String sql = "SELECT password FROM utente " + "WHERE nickname = ? or email = ?";

		try (PreparedStatement pst = con.prepareStatement(sql)) {

			pst.setString(1, username);
			pst.setString(2, username);
			res = pst.executeQuery();
			if (res.next())
				return res.getString("password");
			else
				throw new DAONonTrovatoException("username o email " + username + " non registrato!");

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT UTENTE x login: " + username + ". Causa: " + e.getMessage()
					+ " Errorcode: " + e.getErrorCode());
		}
	}
	
	public Utente update(Utente utente) throws DAOException {
		
		Utente u = this.select(utente.getIdUtente());
		
		String sql = "UPDATE UTENTE SET idutente = ?, admin = ?, nickname = ?, email = ? password = ?, nome = ?, cognome = ? grado = ? avatar = ? datareg = ?, info = ?";
		
		try (PreparedStatement pst = con.prepareStatement(sql)){
			
			pst.setInt(1, utente.getIdUtente());
			pst.setInt(2, utente.isAdmin() ? 1 : 0);
			pst.setString(3, utente.getNickname());
			pst.setString(4, utente.getEmail());
			pst.setString(5, utente.getPassword());
			pst.setString(6, utente.getNome());
			pst.setString(7, utente.getCognome());
			pst.setString(8, utente.getGrado().getNome());
			pst.setString(9, utente.getAvatar());
			pst.setTimestamp(10, utente.getDataReg());
			pst.setString(11, utente.getInfo());
			
			pst.executeUpdate();
			
			return u;
			
		} catch (SQLException e) {
			throw new DAOException
			("ERRORE UPDATE UTENTE x pk="+utente.getIdUtente()
			+". Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}
	}
	
	public Utente updateProfilo(Utente utente, String password, String nome, String cognome, String info) throws DAOException {
		
		String sql = "UPDATE utente SET password = ?, nome = ?, cognome = ?, info = ? "
				+ "WHERE idutente = ?";
		
		try (PreparedStatement pst = con.prepareStatement(sql)){
			
			pst.setString(1, password);
			if(nome == null)
				pst.setString(2, ""); 
			else
				pst.setString(2, nome);
			if(cognome == null)
				pst.setString(3, ""); 
			else
				pst.setString(3, cognome);
			if(info == null)
				pst.setString(4, ""); 
			else
				pst.setString(4, info);
			
			System.out.println(utente.getIdUtente());
			pst.setInt(5, utente.getIdUtente());
			
			pst.executeUpdate();
			
			Utente u = this.select(utente.getIdUtente());
			
			return u;		//ritorno dell'utente modificato
			
		} catch (SQLException e) {
			throw new DAOException
			("ERRORE UPDATE UTENTE x pk="+utente.getIdUtente()
			+". Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}
	}
	
	public int updateUtenteGrado(int idUtente) throws DAOException {
		
		DaoRecensione dr = new DaoRecensione();
		
		int recensioni = dr.countRecensioniByUtente(idUtente);
		int differenzaLike = dr.countLikeByUtente(idUtente) - dr.countDislikeByUtente(idUtente);
		
		String sql = "UPDATE utente SET grado = ? where idutente = ?";
		String grado = null;
		
		if(recensioni < 3 || differenzaLike < 10)
			grado = "Peone";
		else if(recensioni < 6 || differenzaLike < 20)
			grado = "Recluta";
		else if(recensioni < 12 || differenzaLike < 40)
			grado = "Scudiero";
		else if(recensioni < 24 || differenzaLike < 80)
			grado = "Fante";
		else if(recensioni < 48 || differenzaLike < 160)
			grado = "Cavaliere";
		else if(recensioni < 96 || differenzaLike < 320)
			grado = "Capitano";
		else
			grado = "Generale";
		
		try (PreparedStatement pst = con.prepareStatement(sql)) {
			
			pst.setString(1, grado);
			pst.setInt(2, idUtente);
			
			return pst.executeUpdate();
			
		} catch (SQLException e) {
			throw new DAOException(
					"ERRORE UPDATE UTENTE. " + "Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}
	}

	private <T> T componiEntity() throws SQLException, DAOException {

		return (T) new Utente(res.getInt("idutente"), res.getInt("admin") == 0 ? false : true,
				res.getString("nickname"), res.getString("email"), res.getString("password"), res.getString("nome"),
				res.getString("cognome"), (Grado) new DaoGrado().select(res.getString("grado")),
				res.getString("avatar"), res.getTimestamp("datareg"), res.getString("info"));
	}

	// metodo main ESCLUSIVAMENTE x testare tutti i metodi
	public static void main(String[] args) {

		try {
			DaoUtente dao = (DaoUtente) DAO.getDaoInstance(Tabella.Utente);

			Utente u = new Utente(false, "skyzzo", "skyzzo@christian.com", "porcaccialatroia", "Matteo", "Matteo",
					"Peone", "moba.jpg", null);
			int i = dao.insert(u);
			System.out.println("\ninsert(Utente): " + i);

			System.out.println("\nselect(pk): " + dao.select(i));

			System.out.println("\ndelete(pk)" + dao.delete(i));

			// System.out.println("\nselect(pk): "+dao.select(i));

			i = dao.insert(u);
			System.out.println(dao.recuperaPassword("skyzzo") + "\n");
			System.out.println(dao.recuperaPassword("skyzzo@christian.com") + "\n");

		} catch (DAOException e) {
			System.out.println(e.getMessage());
		}

	}

}
