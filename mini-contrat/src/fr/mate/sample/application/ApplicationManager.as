package fr.mate.sample.application 
{
	import mx.core.Application;
	
	/**
	 * Manager des informations globales à l'application comme la navigation ...
	 */
	public class ApplicationManager 
	{
		
		/**
		 * Etat courant de l'application. 
		 * L'état par défaut de l'application est la page de recherche.
		 */
		[Bindable]
		public static var etatCourant:String = ApplicationStates.RECHERCHE;
		
		/**
		 * Changer l'état en cours de l'application.
		 * @param	etat Nouvel état.
		 */
		public function changerEtatCourant(etat:String):void {
			// On ne change d'état que si le nouvel état qui nous a été transmis est un état connu de l'application.
			if (ApplicationStates.isEtatExistant(etat)) {
				etatCourant = etat;
				
				Application.application.currentState = etatCourant;
			}
		}
	}

}