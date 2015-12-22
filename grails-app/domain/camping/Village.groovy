package camping

class Village {

	String nom;
	static belongsTo = [pays:Pays]
	static hasMany = [langues: Langue,proposer : Proposer]
	
    static constraints = {
    }
	
	
	@Override
	public String toString() {
		return this.nom;
	}
}
