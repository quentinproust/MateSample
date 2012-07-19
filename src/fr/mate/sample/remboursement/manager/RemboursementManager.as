package fr.mate.sample.remboursement.manager
{
	import flash.events.IEventDispatcher;
	import fr.mate.sample.application.*;
	import fr.mate.sample.model.ContratVo;
	import fr.mate.sample.recherche.events.SelectionPersonneEvent;
	import fr.mate.sample.remboursement.events.VoirRemboursementEnAttenteEvent;
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
		public var remboursementsEnAttente:ArrayCollection;
		
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
		 * Gérer les évènements de navigation.
		 * @param	event Event.
		 */
		public function gererEventNavigation(event:ApplicationNavigationEvent):void
		{
			if ((event.etat == ApplicationStates.VALIDATION || event.etat == ApplicationStates.SYNTHESE) && contratSelectionne == null)
			{
				_dispatcher.dispatchEvent(new ApplicationNavigationEvent(ApplicationStates.RECHERCHE));
				Alert.show("Aucun contrat n'a été sélectionné. \nFaite une recherche pour sélectionner un contrat");
				return;
			}
			
			if (event.etat == ApplicationStates.VALIDATION)
			{
				_dispatcher.dispatchEvent(new VoirRemboursementEnAttenteEvent(contratSelectionne.id));
			}
		}
		
		/**
		 * Sélection d'un contrat.On redirige vers la synthèse des informations.
		 * @param	contrat Personne qui a été sélectionnée.
		 */
		public function selectionContrat(contrat:ContratVo):void
		{
			contratSelectionne = contrat;
		}
		
		/**
		 * Chargement des remboursements dans le manager.
		 * @param	remboursements Remboursements en attente trouvés pour le contrat.
		 */
		public function chargerRemboursements(remboursements:ArrayCollection):void
		{
			trace("Nombre de remboursements trouvés : " + remboursements.length);
			
			if (remboursements == null || remboursements.length <= 0)
			{
				Alert.show("Aucun remboursement en attente n'a été trouvé.");
			}
			else
			{
				this.remboursements = remboursements;
			}
		}
		
		/**
		 * Chargement des remboursements en attente dans le manager.
		 * @param	remboursements Remboursements en attente trouvés pour le contrat.
		 */
		public function chargerRemboursementsEnAttente(remboursements:ArrayCollection):void
		{
			trace("Nombre de remboursements en attente trouvés : " + remboursements.length);
			
			if (remboursements == null || remboursements.length <= 0)
			{
				Alert.show("Aucun remboursement en attente n'a été trouvé.");
			}
			else
			{
				this.remboursementsEnAttente = remboursements;
			}
		}
	}

}