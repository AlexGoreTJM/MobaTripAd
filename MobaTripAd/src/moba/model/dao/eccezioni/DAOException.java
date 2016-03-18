package moba.model.dao.eccezioni;

@SuppressWarnings("serial")
public class DAOException extends Exception {

	public DAOException() {
	}

	public DAOException(String message) {
		super(message);
	}

}
