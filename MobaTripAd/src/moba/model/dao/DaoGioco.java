package moba.model.dao;

//Classe Java contente i dao della tabella Gioco.

import java.sql.Date;
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
import moba.model.entity.Recensione;
import moba.model.entity.Shop;

public class DaoGioco extends DAO {

	protected DaoGioco() throws DAOException {
		super();
	}

	@Override
	public <T> int insert(T entity) throws DAOException {
		
		Gioco gioco = (Gioco) entity;
		
		String sql = "INSERT INTO GIOCO"
				+ " (titolo, sh, players, web, datauscita, etamin, costolancio,idcategoria,valutazionesito,pro,contro,img1,img2,urlvideo,urlsh,requisiti,info) "
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		System.out.println(gioco.toString());
		try (PreparedStatement pst = con.prepareStatement(sql, new String[] { "idgioco" })) {

			pst.setString(1, gioco.getTitolo());
			pst.setString(2, gioco.getSh());
			pst.setInt(3, gioco.getPlayers());
			pst.setInt(4, (gioco.isWeb()) ? 1 : 0);
			pst.setDate(5, gioco.getDataUscita());
			pst.setDouble(6, gioco.getEtaMin());
			pst.setDouble(7, gioco.getCostoLancio());
			pst.setInt(8, gioco.getCategoria().getIdCategoria());
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
			throw new DAOException("ERRORE NELL'INSERIMENTO" + e.getMessage());
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

	public ArrayList<Gioco> selectRecente() throws DAOException {
		String sql = "SELECT idgioco, titolo, sh, players, web, datauscita, etamin, costolancio, idcategoria, valutazionesito, pro, contro, img1, img2, urlvideo, urlsh, requisiti, info, datareg"
				+ " FROM gioco ORDER BY datauscita DESC";
		ArrayList<Gioco> giochi = new ArrayList<>();
		try (PreparedStatement pst = con.prepareStatement(sql)) {

			res = pst.executeQuery();

			if (!res.next())
				throw new DAONonTrovatoException("ERRORE SELECT ULTIMI GIOCHI");

			giochi.add(componiEntity());

			while (res.next()) {
				giochi.add(componiEntity());
			}
		} catch (SQLException e) {
			throw new DAOException(
					"ERRORE SELECT GIOCO" + ". Causa: " + e.getMessage() + " Errorcode: " + e.getErrorCode());
		}
		return giochi;
	}

	public ArrayList<Gioco> selectByIdCategoria(int idCategoria) throws DAOException {

		String sql = "SELECT idgioco, titolo, sh, players, web, datauscita, etamin, costolancio, idcategoria, valutazionesito, pro, contro, img1, img2, urlvideo, urlsh, requisiti, info, datareg FROM MOBA.GIOCO WHERE IDCATEGORIA = ?";

		ArrayList<Gioco> giochi = new ArrayList<>();

		try (PreparedStatement pst = con.prepareStatement(sql)) {

			pst.setInt(1, idCategoria);

			res = pst.executeQuery();

			if (!res.next())
				throw new DAONonTrovatoException("ERRORE SELECT GIOCHI CON CATEGORIA " + idCategoria);

			giochi.add(componiEntity());
			while (res.next())
				giochi.add(componiEntity());

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT GIOCHI x idcategoria: " + idCategoria + ". Causa: " + e.getMessage()
					+ " Errorcode: " + e.getErrorCode());
		}

		return giochi;
	}

	public ArrayList<Gioco> selectByIdPiattaforma(int idPiattaforma) throws DAOException {

		String sql = "SELECT A.idgioco, A.titolo, A.sh, A.players, A.web, A.datauscita, A.etamin, A.costolancio, A.idcategoria, A.valutazionesito, A.pro, A.contro, A.img1, A.img2, A.urlvideo, A.urlsh, A.requisiti, A.info, A.datareg "
				+ "FROM MOBA.GIOCO A, MOBA.GIOCOPIATTA B WHERE A.idgioco = B.idgioco AND B.IDPIATTAFORMA = ?";

		ArrayList<Gioco> giochi = new ArrayList<>();

		try (PreparedStatement pst = con.prepareStatement(sql)) {

			pst.setInt(1, idPiattaforma);

			res = pst.executeQuery();

			if (!res.next())
				throw new DAONonTrovatoException("ERRORE SELECT GIOCHI CON PIATTAFORMA " + idPiattaforma);

			giochi.add(componiEntity());

			while (res.next())
				giochi.add(componiEntity());

		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT GIOCHI x idpiattaforma: " + idPiattaforma + ". Causa: "
					+ e.getMessage() + " Errorcode: " + e.getErrorCode());
		}

		return giochi;
	}

	public ArrayList<Gioco> selectPopolare() throws DAOException {

		String sql = "select g.idgioco, g.titolo, g.sh, g.players, g.web, g.datauscita, g.etamin, g.costolancio, g.idcategoria, g.valutazionesito, g.pro, g.contro, g.img1, g.img2, g.urlvideo, g.urlsh, g.requisiti, g.info, g.datareg, count(*) as ctr"
				+ " from gioco g join recensione r on (g.idgioco= r.idgioco) group by g.idgioco, g.titolo, g.sh, g.players, g.web, g.datauscita, g.etamin, g.costolancio, g.idcategoria, g.valutazionesito, g.pro, g.contro, g.img1, g.img2, g.urlvideo,"
				+ " g.urlsh, g.requisiti, g.info, g.datareg order by ctr desc";

		ArrayList<Gioco> giochi = new ArrayList<>();

		try (PreparedStatement pst = con.prepareStatement(sql)) {

			res = pst.executeQuery();

			if (!res.next())
				throw new DAONonTrovatoException("ERRORE SELECT GIOCHI POPOLARI");

			giochi.add(componiEntity());
			int carosello = 0;

			while (res.next() && carosello < 2) {
				giochi.add(componiEntity());
				carosello++;
			}
		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT GIOCHI x popolarita': " + ". Causa: " + e.getMessage()
					+ " Errorcode: " + e.getErrorCode());
		}

		return giochi;
	}
	
public int countGiochi() throws DAOException{
    	
    	String sql = "select count(*) as giochi from gioco";
    	
    	try (PreparedStatement pst = con.prepareStatement(sql)) {
			res = pst.executeQuery(); // esegue la query così preparata
			if (res.next())
				return res.getInt("giochi");
			else
				throw new DAONonTrovatoException(
						"WARNING: dati non trovati in GIOCO");

		} catch (SQLException e) {
			throw new DAOException("ERRORE COUNT GIOCO . Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
		}    	
    }

	private <T> T componiEntity() throws SQLException, DAOException {

		ArrayList<Shop> shop = new DaoShop().select(res.getInt("idgioco"));
		ArrayList<Piattaforma> piattaforme = new ArrayList<>();
		ArrayList<GiocoPiatta> giocopiatta = new DaoGiocoPiatta().selectByIdGioco(res.getInt("idgioco"));
		ArrayList<Recensione> recensione = new DaoRecensione().select(res.getInt("idgioco"));
		for (GiocoPiatta giocoPiatta2 : giocopiatta) {
			piattaforme.add(new DaoPiattaforma().select(giocoPiatta2.getIdPiattaforma()));
		}

		double valutazione = new DaoValutazione().getAvgValutazioneByIdGioco(res.getInt("idgioco"));


		return (T) new Gioco(res.getInt("idgioco"), res.getString("titolo"), res.getString("sh"), res.getInt("players"),
				(res.getInt("web") == 1) ? true : false, res.getDate("datauscita"), res.getInt("etamin"),
				res.getDouble("costolancio"), ((Categoria) new DaoCategoria().select(res.getInt("idcategoria"))),
				res.getDouble("valutazionesito"), res.getString("pro"), res.getString("contro"), res.getString("img1"),
				res.getString("img2"), res.getString("urlvideo"), res.getString("urlsh"), res.getString("requisiti"),
				res.getString("info"), res.getTimestamp("datareg"), piattaforme, recensione, valutazione, shop);

	}
	
	
	public  ArrayList<Gioco> selectByTitolo(String titoloGioco) throws DAOException {
		ArrayList<Gioco> giochi = new ArrayList<>();
		
		String sql = "SELECT idgioco, titolo, sh, players, web, datauscita, etamin, costolancio, idcategoria, valutazionesito, pro, contro, img1, img2, urlvideo, urlsh, requisiti, info, datareg FROM MOBA.GIOCO WHERE upper (titolo) LIKE upper ('%"+titoloGioco+"%') ";

		try (PreparedStatement pst = con.prepareStatement(sql)) {

			//pst.setString(1, titoloGioco);

			res = pst.executeQuery();

			while (res.next() ) {
				giochi.add(componiEntity());
			}
			
		} catch (SQLException e) {
			throw new DAOException("ERRORE SELECT GIOCO x pk: " + titoloGioco + ". Causa: " + e.getMessage() + " Errorcode: "
					+ e.getErrorCode());
		}
		return giochi;

	}

	// metodo main ESCLUSIVAMENTE x testare tutti i metodi
	public static void main(String[] args) {

		try {
			DaoGioco dao = (DaoGioco) DAO.getDaoInstance(Tabella.Gioco);

			int i = dao.insert(new Gioco("PROVAAAAaaaaaaaa", "PROVAA", 1, true, new
			Date(100,12,1), 1, 1, 1, 1, "ddd", "ppp", "ddd", "dddd", "ddd", null,
			null, null));

			System.out.println(i);

		} catch (DAOException e) {
			System.out.println(e.getMessage());
		}

	}

	public void updateImg(int idGioco, String fileName1, String fileName2) throws DAOException {

		String sql = "UPDATE gioco SET IMG1 = ?, IMG2 = ? "
				+ "WHERE idgioco = ? ";
		
		try (PreparedStatement pst = con.prepareStatement(sql)){
			
			pst.setString(1, fileName1);
			pst.setString(2, fileName2);
			pst.setInt(3, idGioco);
			
			pst.executeUpdate();
		} catch (SQLException e) {
			throw new DAOException
			("ERRORE UPDATE GIOCO Causa: "+e.getMessage()+" Errorcode: "+e.getErrorCode());
			
		}
		
	}

}
