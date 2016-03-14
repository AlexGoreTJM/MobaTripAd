package moba.model.utilita;

public class Utilita {
	

	public static boolean verificaPassword(String password) {
		
		if(!(password.matches("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,20})"))) 
			return false;
		
		return true;
	}
	

	public static boolean verificaEmail(String email) {
		
		if(!(email.matches("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
				+"[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")))
			return false;
		
		return true;
	}

}
