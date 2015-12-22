package camping

class Activite {

	String designatic;
	
	static hasMany = [proposer: Proposer]
	
    static constraints = {
    }
	@Override
	public String toString() {
		return this.designatic;
	}
}
