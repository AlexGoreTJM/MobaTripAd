package moba.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.eccezioni.DAONonTrovatoException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Categoria;
import moba.model.entity.Gioco;
import moba.model.entity.GiocoPiatta;
import moba.model.entity.Piattaforma;
import moba.model.entity.Utente;

public class DaoGioco extends DAO {

	protected DaoGioco() throws DAOException {
		super();
	}

	@Override
	public <T> int insert(T entity) throws DAOException {
		Gioco gioco = (Gioco) entity;
		String sql = "INSERT INTO GIOCO"
				+ " (titolo, sh, players, web, datauscita, etamin, costolancio,idcategoria,valutazionesito,pro,contro,img1,img2,urlvideo,urlsh,requisiti,info) "
				+ "values=(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try (PreparedStatement pst = con.prepareStatement(sql, new String[] { "idgioco" })) {

			pst.setString(1, gioco.getTitolo());
			pst.setString(2, gioco.getSh());
			pst.setDouble(3, gioco.getPlayers());
			pst.setDouble(4, (gioco.isWeb()) ? 1 : 0);
			pst.setDate(5, gioco.getDataUscita());
			pst.setDouble(6, gioco.getEtaMin());
			pst.setDouble(7, gioco.getCostoLancio());
			pst.setDouble(8, gioco.getCategoria().getIdCategoria());
			pst.setDouble(9, gioco.getValutazioneSito());
			pst.setString(10, gioco.getPro());
			pst.setString(11, gioco.getContro());
			pst.setString(12, gioco.getImg1());
			pst.setString(13, gioco.getImg2());
			pst.setString(14, gioco.getUrlVideo());
			pst.setString(15, gioco.getUrlSh());
			pst.setString(16, gioco.getRequisiti());
			pst.setString(17, gioco.getInfo());

			pst.executeUpdate();

			res = pst.getGeneratedKeys();
			res.next();
			return res.getInt(1);

		}

		catch (SQLException e) {
			throw new DAOException("ERRORE NELL'INSERIMENTO");
		}
	}

	@Override
	public <T> T delete(int pk) throws DAOException {

		Gioco gioco = this.select(pk);

		String sql = "DELETE FROM MOBA.GIOCO WHERE IDGIOCO=?";

		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, pk);

			pst.executeUpdate();

			return (T) gioco;

		} catch (SQLException e) {
			throw new DAOException("ERRORE NELLA CANCELLAZIONE");
		}

	}

	@Override
	public <T> ArrayList<T> select() throws DAOException {
		throw new DAOException("WARNING: COMANDO NON IMPLEMENTATO");
	}

	@Override
	public <T> T select(int pk) throws DAOException {
		String sql = "SELECT idgioco, titolo, sh, players, web, datauscita, etamin, costolancio, idcategoria, valutazionesito, pro, contro, img1, img2, urlvideo, urlsh, requisiti, info, datareg FROM MOBA.GIOCO WHERE IDGIOCO=? ";

		try (PreparedStatement pst = con.prepareStatement(sql)) {

			pst.setInt(1, pk);

			res = pst.executeQuery();

			if (res.next())
				return componiEntity();
			else
				throw new DAONonTrovatoException("ERRORE SELECT GIOCO CON ID " + pk);

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT GIOCO x pk: " + pk + ". Causa: " + e.getMessage() + " Errorcode: "
					+ e.getErrorCode());
		}

	}

	public <T> T selectLast() throws DAOException {
		String sql = "SELECT idgioco, titolo, sh, players, web, datauscita, etamin, costolancio, idcategoria, valutazionesito, pro, contro, img1, img2, urlvideo, urlsh, requisiti, info, datareg "
					+ "FROM gioco "
					+ "WHERE datauscita IN (SELECT max(datauscita) from gioco) ";

		try (PreparedStatement pst = con.prepareStatement(sql)) {

			res = pst.executeQuery();

			if (res.next())
				return componiEntity();
			else
				throw new DAONonTrovatoException("WARNING:  ");

		} catch (SQLException e) {
			throw new DAOException(
					"ERRORE SELECT GIOCO x pk: " + ". Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}

	}

	private <T> T componiEntity() throws SQLException, DAOException {

		ArrayList<Piattaforma> piattaforme = new ArrayList<>();
		ArrayList<GiocoPiatta> giocopiatta = new DaoGiocoPiatta().selectByIdGioco(res.getInt("idgioco"));
		for (GiocoPiatta giocoPiatta2 : giocopiatta) {
			piattaforme.add(new DaoPiattaforma().select(giocoPiatta2.getIdPiattaforma()));
		}

		double valutazione = new DaoValutazione().getAvgValutazioneByIdGioco(res.getInt("idgioco"));

		return (T) new Gioco(res.getInt("idgioco"), res.getString("titolo"), res.getString("sh"), res.getInt("players"),
				(res.getInt("web") == 1) ? true : false, res.getDate("datauscita"), res.getInt("etamin"),
				res.getDouble("costolancio"), ((Categoria) new DaoCategoria().select(res.getInt("idcategoria"))),
				res.getDouble("valutazionesito"), res.getString("pro"), res.getString("contro"), res.getString("img1"),
				res.getString("img2"), res.getString("urlvideo"), res.getString("urlsh"), res.getString("requisiti"),
				res.getString("info"), res.getTimestamp("datareg"), piattaforme,
				new DaoRecensione().select(res.getInt("idgioco")), valutazione);

	}

	// metodo main ESCLUSIVAMENTE x testare tutti i metodi
	public static void main(String[] args) {

		try {
			DaoGioco dao = (DaoGioco) DAO.getDaoInstance(Tabella.Gioco);

			System.out.println("" + dao.selectLast());

		} catch (DAOException e) {
			System.out.println(e.getMessage());
		}

	}

}
