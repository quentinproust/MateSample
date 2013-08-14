package fr.mate.sample.recherche.model 
{
	import flash.events.IEventDispatcher;
	import fr.mate.core.ViewModel;
	import fr.mate.sample.recherche.events.RechercheEvent;
	/**
	 * View model correspondant au formulaire de recherche.
	 */
	public class RechercheVM extends ViewModel
	{
		/** 
		 * Type de recherche en cours.
		 * Par défaut, on fait une recherche par nom.
		 */
		[Bindable]
		public var informationsRecherche:CritereRecherche = new CritereRecherche();
		
		/**
		 * Constructeur.
		 * @param	dispatcher Dispatcher. Voir ViewModel.
		 */
		public function RechercheVM(dispatcher:IEventDispatcher) 
		{
			super(dispatcher);
			informationsRecherche.initialiser(TypeRecherche.PAR_NOM);
		}
		
		/**
		 * Changement du type de recherche en cours.
		 * @param	typeRecherche Type de recherche. Voir TypeRecherche.
		 */
		public function rechercherPar(typeRecherche:String):void {
			informationsRecherche.initialiser(typeRecherche);
		}
		
		public function rechercher(criteres:CritereRecherche):void {
			// On remplace les informations de recherche par celle qui nous ont été transmises.
			criteres.typeRecherche = informationsRecherche.typeRecherche;
			informationsRecherche = criteres;
			
			// On lance la recherche.
			dispatcher.dispatchEvent(new RechercheEvent(informationsRecherche));
		}
	}

}