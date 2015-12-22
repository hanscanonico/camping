package camping

class Langue {

	String designatic;
	
	@Override
	public String toString() {
		return this.designatic;
	}
	
	static hasMany = [villages: Village]
	static belongsTo = Village
    static constraints = {
    }
}
