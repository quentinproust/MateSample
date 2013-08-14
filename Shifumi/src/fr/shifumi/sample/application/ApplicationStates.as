package fr.shifumi.sample.application
{
	
	/**
	 * Etats de l'application.
	 */
	public final class ApplicationStates
	{
		
		public static const JOUER:String = "EtatJouer";
		public static const RESULTATS:String = "EtatResultat";
	
		public static const etats:Array = new Array(JOUER, RESULTATS);
		
		public static function isEtatExistant(etat:String):Boolean {
			var etatExistant:Boolean = false;
			
			for each (var etatConnu:String in ApplicationStates.etats) {
				if (etat == etatConnu) {
					etatExistant = true;
				}
			}
			
			return etatExistant;
		}
	}

}