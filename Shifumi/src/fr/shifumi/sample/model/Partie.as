package fr.shifumi.sample.model 
{
	import mx.utils.StringUtil;
	
	/**
	 * Une partie de shifumi (un seul mouvement).
	 * @author Quentin PROUST
	 */
	public class Partie 
	{
		public var joueur:Choix;
		public var ordinateur:Choix;
		
		public var pointJoueur:Number;
		public var pointOrdi:Number;
		
		public function Partie() 
		{
			
		}
		
		public function toString() :String {
			if (joueur == null || ordinateur == null) {
				return "";
			} else if (pointJoueur == 1) {
				return StringUtil.substitute("Partie gagné par le joueur 1 : {0} / {1}", joueur, ordinateur);
			} else if (pointOrdi == 2) {
				return StringUtil.substitute("Partie gagné par le joueur 2 : {0} / {1}", joueur, ordinateur);
			} else {
				return StringUtil.substitute("Partie : {0} / {1}", joueur, ordinateur);
			}
		}
		
	}

}