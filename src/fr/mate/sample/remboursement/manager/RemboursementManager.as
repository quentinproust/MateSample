package fr.mate.sample.remboursement.manager
{
	import flash.events.IEventDispatcher;
	import fr.mate.sample.application.*;
	import fr.mate.sample.model.ContratVo;
	import fr.mate.sample.recherche.events.SelectionPersonneEvent;
	import mx.controls.Alert;
	import mx.collections.ArrayCollection;
	
	/**
	 * Manager contenant le code business de la recherche (coté client).
	 */
	public class RemboursementManager
	{
		/**
		 * Dispatcher pour envoyer des evenements vers la map.
		 */
		private var _dispatcher:IEventDispatcher;
		
		[Bindable]
		public var remboursements:ArrayCollection;
		
		[Bindable]
		public var contratSelectionne:ContratVo;
		
		/**
		 * Constructeur.
		 * @param	dispatcher Dispatcher (correspond à celui de la map de la recherche).
		 */
		public function RemboursementManager(dispatcher:IEventDispatcher)
		{
			_dispatcher = dispatcher;
		}
		
		/**
		 * Sélection d'un contrat.On redirige vers la synthèse des informations.
		 * @param	contrat Personne qui a été sélectionnée.
		 */
		public function selectionContrat(contrat:ContratVo):void
		{
			contratSelectionne = contrat;
			_dispatcher.dispatchEvent(new ApplicationNavigationEvent(ApplicationStates.SYNTHESE));
		}
		
		/**
		 * Chargement des remboursements dans le manager.
		 * Les remboursements sont affichés dans des onglets. Il n'y a donc aucune redirection à effectuer.
		 * @param	remboursements Remboursements trouvés pour le contrat et l'année demandée.
		 */
		public function chargerRemboursements(remboursements:ArrayCollection):void
		{
			trace("Nombre de remboursements trouvés : " + remboursements.length);
			
			if (remboursements == null || remboursements.length <= 0)
			{
				Alert.show("Aucun remboursement n'a été trouvé.");
			}
			else
			{
				this.remboursements = remboursements;
			}
		}
	}

}