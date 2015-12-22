package camping

class Utilisateur {
	String login;
	String password;
	String email;
    static constraints = {
		login size: 1..15
		password size: 5..15
		email email:true, blank: false
    }
	
	@Override
	public String toString() {
		return this.login;
	}
	
}