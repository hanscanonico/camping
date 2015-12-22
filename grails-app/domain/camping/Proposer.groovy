package camping

class Proposer {
	
	double prix;
	
	
	static belongsTo = [activite : Activite, village:Village]
    static constraints = {
    }
}
