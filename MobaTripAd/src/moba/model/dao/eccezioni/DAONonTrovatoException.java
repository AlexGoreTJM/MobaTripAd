package moba.model.dao.eccezioni;

@SuppressWarnings("serial")
public class DAONonTrovatoException extends DAOException {

	public DAONonTrovatoException() {
	}

	public DAONonTrovatoException(String message) {
		super(message);
	}

}
