package moba.model.dao;

//Classe java contenente i dao della tabella Recensione.

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;

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
		String sql = "INSERT INTO recensione " + "(idutente,idgioco,ctrlike,ctrdislike,segnalata,info) "
				+ "VALUES (?,?,?,?,?,?)";

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, r.getUtente().getIdUtente());
			pst.setInt(2, r.getIdGioco());
			pst.setInt(3, r.getCtrLike());
			pst.setInt(4, r.getCtrDislike());
			pst.setInt(5, r.getSegnalata());
			pst.setString(6, r.getInfo());
			System.out.println(r.toString());
			int update = pst.executeUpdate();

//			new DaoUtente().updateUtenteGrado(r.getUtente().getIdUtente());
			return update;

		} catch (SQLException e) {

			throw new DAOException(
					"ERRORE INSERT RECENSIONE. " + "Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}
	}

	@SuppressWarnings("unchecked")
	public <T> T delete(int idUtente, int idGioco) throws DAOException {

		Recensione r = this.select(idUtente, idGioco);

		String sql = "DELETE FROM RECENSIONE WHERE idutente = ? and idgioco = ?";

		try (PreparedStatement pst = con.prepareStatement(sql)) {

			pst.setInt(1, r.getUtente().getIdUtente());
			pst.setInt(2, r.getIdGioco());

			pst.executeUpdate();

//			new DaoUtente().updateUtenteGrado(r.getUtente().getIdUtente());

			return (T) r;

		} catch (SQLException e) {
			throw new DAOException("ERRORE DELETE RECENSIONE x idUtente: " + idUtente + " e X idGioco " + idGioco
					+ ". Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}
	}

	@SuppressWarnings("unchecked")
	public <T> ArrayList<T> select() throws DAOException {

		String sql = "SELECT idutente, idgioco, ctrlike, ctrdislike, segnalata, info, datarec "
				+ "FROM recensione order by (ctrlike - ctrdislike) desc";
		ArrayList<Recensione> lista = new ArrayList<Recensione>();

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			res = pst.executeQuery();

			while (res.next())
				lista.add(componiEntity());

			if (lista.size() == 0)
				throw new DAONonTrovatoException("ERRORE SELECT RECENSIONI");

			return (ArrayList<T>) lista;

		} catch (SQLException e) {
			throw new DAOException(
					"ERRORE SELECT RECENSIONI . Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}
	}

	public ArrayList<ArrayList<String>> selectLikesDislikesByRecensione() throws DAOException {

		String sql = "SELECT u.nickname as utente, g.titolo as gioco, r.ctrlike as likes, r.ctrdislike as dislikes "
				+ "FROM utente u, gioco g, recensione r " + "WHERE u.idutente = r.idutente and g.idgioco = r.idgioco "
				+ "ORDER BY (ctrlike - ctrdislike) desc";

		ArrayList<ArrayList<String>> lista = new ArrayList<>();

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			res = pst.executeQuery();

			while (res.next()) {
				lista.add(new ArrayList<String>(Arrays.asList(res.getString("utente"), res.getString("gioco"),
						Integer.toString(res.getInt("likes")), Integer.toString(res.getInt("dislikes")))));
			}

			if (lista.size() == 0)
				throw new DAONonTrovatoException("ERRORE SELECT RECENSIONI");

			return lista;

		} catch (SQLException e) {
			throw new DAOException(
					"ERRORE SELECT RECENSIONI . Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}
	}

	public Recensione select(int idUtente, int idGioco) throws DAOException {
		String sql = "SELECT idutente, idgioco, ctrlike, ctrdislike, segnalata, info, datarec " + "FROM RECENSIONE "
				+ "WHERE idutente = ? and idgioco = ?";

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			pst.setInt(2, idGioco);
			res = pst.executeQuery(); // esegue la query cosï¿½ preparata
			if (res.next())
				return componiEntity();
			else
				throw new DAONonTrovatoException(
						"WARNING: dati non trovati in RECENSIONE x idUtente: " + idUtente + " e x idGioco " + idGioco);

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT RECENSIONE x idUtente: " + idUtente + " e x idGioco " + idGioco
					+ ". Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}

	}

	public Recensione selectVerifica(int idUtente, int idGioco) throws DAOException {
		String sql = "SELECT idutente, idgioco, ctrlike, ctrdislike, segnalata, info, datarec " + "FROM RECENSIONE "
				+ "WHERE idutente = ? and idgioco = ?";

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			pst.setInt(2, idGioco);
			res = pst.executeQuery(); // esegue la query cosï¿½ preparata
			if (res.next())
				return componiEntity();
			else
				return null;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT RECENSIONE x idUtente: " + idUtente + " e x idGioco " + idGioco
					+ ". Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}

	}

	private Recensione componiEntity() throws SQLException, DAOException {
		return new Recensione(new DaoUtente().select(res.getInt("idutente")), res.getInt("idgioco"),
				res.getInt("ctrlike"), res.getInt("ctrdislike"), res.getInt("segnalata"), res.getString("info"),
				res.getTimestamp("datarec"));
	}

	@Override
	public <T> T delete(int pk) throws DAOException {
		return null;
	}

	@SuppressWarnings("unchecked")
	public <T> T select(int idGioco) throws DAOException {
		String sql = "SELECT idutente, idgioco, ctrlike, ctrdislike, segnalata, info, datarec " + "FROM RECENSIONE "
				+ "WHERE idgioco = ?";
		ArrayList<Recensione> lista = new ArrayList<Recensione>();
		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idGioco);
			res = pst.executeQuery(); // esegue la query cosï¿½ preparata
			while (res.next())
				lista.add(componiEntity());
			return (T) lista;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT RECENSIONE x nome: " + idGioco + ". Causa: " + e.getMessage()
					+ " Errorcode: " + e.getErrorCode());
		}
	}
	
	@SuppressWarnings("unchecked")
	public <T> T selectByIdUtente(int idUtente) throws DAOException {
		String sql = 
		"SELECT idutente, idgioco, ctrlike, ctrdislike, segnalata, info, datarec "
		+"FROM RECENSIONE "
		+"WHERE idutente = ?";
		ArrayList<Recensione> lista = new ArrayList<Recensione>();
		try(PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			res = pst.executeQuery(); //esegue la query cosï¿½ preparata
			while(res.next())
				lista.add(componiEntity());
			
			return (T) lista;

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT RECENSIONE x nome: "+idUtente
			+". Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}
	}

	public int addLike(int idUtente, int idGioco) throws DAOException {

		String sql = "UPDATE RECENSIONE SET ctrlike = ctrlike + 1 where idutente = ? and idgioco = ?";

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			pst.setInt(2, idGioco);

			int update = pst.executeUpdate();

			new DaoUtente().updateUtenteGrado(idUtente);

			return update;

		} catch (SQLException e) {
			throw new DAOException("ERRORE UPDATE RECENSIONE ADD LIKE. " + "Causa: " + e.getMessage() + " Errorcode: "
					+ e.getErrorCode());
		}
	}

	public int addDislike(int idUtente, int idGioco) throws DAOException {

		String sql = "UPDATE RECENSIONE SET ctrdislike = ctrdislike + 1 where idutente = ? and idgioco = ?";

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			pst.setInt(2, idGioco);

			int update = pst.executeUpdate();

			new DaoUtente().updateUtenteGrado(idUtente);

			return update;

		} catch (SQLException e) {
			throw new DAOException("ERRORE UPDATE RECENSIONE ADD DISLIKE. " + "Causa: " + e.getMessage()
					+ " Errorcode: " + e.getErrorCode());
		}
	}

	public int removeLike(int idUtente, int idGioco) throws DAOException {

		String sql = "UPDATE RECENSIONE SET ctrlike = ctrlike - 1 where idutente = ? and idgioco = ?";

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			pst.setInt(2, idGioco);

			int update = pst.executeUpdate();

			new DaoUtente().updateUtenteGrado(idUtente);

			return update;

		} catch (SQLException e) {
			throw new DAOException("ERRORE UPDATE RECENSIONE REMOVE LIKE. " + "Causa: " + e.getMessage()
					+ " Errorcode: " + e.getErrorCode());
		}
	}

	public int removeDislike(int idUtente, int idGioco) throws DAOException {

		String sql = "UPDATE RECENSIONE SET ctrdislike = ctrdislike - 1 where idutente = ? and idgioco = ?";

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			pst.setInt(2, idGioco);

			int update = pst.executeUpdate();

			new DaoUtente().updateUtenteGrado(idUtente);

			return update;

		} catch (SQLException e) {
			throw new DAOException("ERRORE UPDATE RECENSIONE REMOVE DISLIKE. " + "Causa: " + e.getMessage()
					+ " Errorcode: " + e.getErrorCode());
		}
	}

	public int countRecensioni() throws DAOException {

		String sql = "select count(*) as recensioni from recensione";

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			res = pst.executeQuery(); // esegue la query così preparata
			if (res.next())
				return res.getInt("recensioni");
			else
				throw new DAONonTrovatoException("WARNING: dati non trovati in RECENSIONE");

		} catch (SQLException e) {
			throw new DAOException(
					"ERRORE COUNT RECENSIONE . Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}
	}

	public int countRecensioniByUtente(int idUtente) throws DAOException {
		String sql = "SELECT COUNT(*) AS recensioni FROM RECENSIONE WHERE idutente = ? GROUP BY idutente";

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			res = pst.executeQuery();

			if (res.next())
				return res.getInt("recensioni");
			else
				throw new DAONonTrovatoException("WARNING: dati non trovati in RECENSIONE X idUtente " + idUtente);

		} catch (SQLException e) {
			throw new DAOException("ERRORE COUNT RECENSIONE X idutente: " + idUtente + ". Causa: " + e.getMessage()
					+ " Errorcode: " + e.getErrorCode());
		}
	}

	public HashMap<String, Integer> countRecensioniByUtente() throws DAOException {

		String sql = "select u.nickname as utente, count(r.idutente) as recensioni from utente u left join recensione r on u.idutente = r.idutente where u.admin = 0 group by u.nickname order by recensioni desc";
		LinkedHashMap<String, Integer> map = new LinkedHashMap<String, Integer>();

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			res = pst.executeQuery(); // esegue la query così preparata

			while (res.next())
				map.put(res.getString("utente"), res.getInt("recensioni"));

			if (map.size() == 0)
				throw new DAONonTrovatoException("ERRORE COUNT RECENSIONI_PER_UTENTE");

			return map;

		} catch (SQLException e) {
			throw new DAOException("ERRORE COUNT RECENSIONI_PER_UTENTE . Causa: " + e.getMessage() + " Errorcode: "
					+ e.getErrorCode());
		}

	}

	public int countLikeByUtente(int idUtente) throws DAOException {
		String sql = "SELECT SUM(ctrlike) AS likes FROM RECENSIONE WHERE idutente = ? GROUP BY idutente";

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			res = pst.executeQuery();

			if (res.next())
				return res.getInt("likes");
			else
				throw new DAONonTrovatoException("WARNING: like non trovati in RECENSIONE X idUtente " + idUtente);

		} catch (SQLException e) {
			throw new DAOException("ERRORE COUNT LIKE X idutente: " + idUtente + ". Causa: " + e.getMessage()
					+ " Errorcode: " + e.getErrorCode());
		}
	}

	public int countDislikeByUtente(int idUtente) throws DAOException {
		String sql = "SELECT SUM(ctrdislike) AS dislikes FROM RECENSIONE WHERE idutente = ? GROUP BY idutente";

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			res = pst.executeQuery();

			if (res.next())
				return res.getInt("dislikes");
			else
				throw new DAONonTrovatoException("WARNING: dislike non trovati in RECENSIONE X idUtente " + idUtente);

		} catch (SQLException e) {
			throw new DAOException("ERRORE COUNT DISLIKE X idutente: " + idUtente + ". Causa: " + e.getMessage()
					+ " Errorcode: " + e.getErrorCode());
		}
	}

	public void segnala(int idGioco, int idUtente) throws DAOException {

		int segnalazioni = this.countSegnalazioni(idUtente, idGioco);

		String sql = "UPDATE RECENSIONE SET segnalata = ? where idutente = ? and idgioco = ?";

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, segnalazioni + 1);
			pst.setInt(2, idUtente);
			pst.setInt(3, idGioco);

			pst.executeUpdate();

		} catch (SQLException e) {
			throw new DAOException("ERRORE UPDATE RECENSIONE REMOVE LIKE. " + "Causa: " + e.getMessage()
					+ " Errorcode: " + e.getErrorCode());
		}
	}

	public int countSegnalazioni(int idUtente, int idGioco) throws DAOException {
		String sql = "SELECT segnalata FROM RECENSIONE WHERE idutente = ? and idGioco= ? ";

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, idUtente);
			pst.setInt(2, idGioco);
			res = pst.executeQuery();

			if (res.next())
				return res.getInt("segnalata");
			else
				return -1;

		} catch (SQLException e) {
			throw new DAOException("ERRORE COUNT SEGNALAZIONI X idutente: " + idUtente + ". Causa: " + e.getMessage()
					+ " Errorcode: " + e.getErrorCode());
		}
	}

	public static void main(String[] args) {

		try {
			DaoRecensione dao = (DaoRecensione) DAO.getDaoInstance(Tabella.Recensione);

			// System.out.println(new DaoUtente().countUtenti());
			// System.out.println(new DaoGioco().countGiochi());
			// System.out.println(dao.countRecensioni());
			// System.out.println(dao.countRecensioniByUtente());
			System.out.println(dao.selectLikesDislikesByRecensione());

		} catch (DAOException e) {
			System.out.println(e.getMessage());
		}

	}

}
