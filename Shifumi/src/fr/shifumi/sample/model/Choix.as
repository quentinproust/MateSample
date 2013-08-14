package fr.shifumi.sample.model 
{
	/**
	 * Choixs possibles dand une partie de shifumi.
	 * @author Quentin PROUST
	 */
	public class Choix 
	{
		public static const FEUILLE:Choix = new Choix("Feuille");
		public static const CISEAUX:Choix = new Choix("Ciseaux");
		public static const PIERRE:Choix = new Choix("Pierre");
		
		public static const POSSIBILITES:Array = new Array(FEUILLE, CISEAUX, PIERRE);
		
		private var _choix:String;
		
		public function Choix(choix:String) 
		{
			_choix = choix;
		}
		
		public function toString() :String {
			return _choix;
		}
		
	}

}