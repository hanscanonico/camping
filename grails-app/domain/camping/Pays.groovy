package camping

class Pays {
	String nom;
	
	@Override
	public String toString() {
		return this.nom;
	}
	
	static belongsTo = [continent:Continent]
	static hasMany = [villages: Village]
    static constraints = {
    }
}
