package camping

class Continent {

	String nom;
	@Override
	public String toString() {
		return this.nom;
	}
	
	static hasMany = [pays: Pays]
    static constraints = {
    }
}
