package fr.mate.sample.application
{
	
	/**
	 * Etats de l'application.
	 */
	public final class ApplicationStates
	{
		
		public static const RECHERCHE:String = "EtatRecherche";
		public static const LISTE_PERSONNES:String = "EtatListeDesPersonnes";
		public static const LISTE_CONTRATS:String = "EtatListeDesContrats";
		public static const SYNTHESE:String = "EtatSynthese";
		public static const VALIDATION:String = "EtatValidation";
	
		public static const etats:Array = new Array(RECHERCHE, LISTE_PERSONNES, LISTE_CONTRATS, SYNTHESE, VALIDATION);
		
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