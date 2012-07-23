package fr.mate.sample.remboursement.manager
{
	import flash.events.IEventDispatcher;
	import fr.mate.sample.application.*;
	import fr.mate.sample.model.ContratVo;
	import fr.mate.sample.recherche.events.SelectionPersonneEvent;
	import fr.mate.sample.remboursement.events.RemboursementEvent;
	import fr.mate.sample.remboursement.events.VoirRemboursementEnAttenteEvent;
	import fr.mate.sample.remboursement.model.CritereRemboursement;
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
		
		/** Années de couverture du contrat durant lesquels on peut voir des remboursements. */
		[Bindable]
		public var anneesCouvertureContrat:ArrayCollection;
		
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
			
			if (event.etat == ApplicationStates.SYNTHESE)
			{
				_dispatcher.dispatchEvent(new RemboursementEvent(new CritereRemboursement(contratSelectionne.id, anneesCouvertureContrat.getItemAt(0) as Number)));
			}
		}
		
		/**
		 * Sélection d'un contrat.On redirige vers la synthèse des informations.
		 * @param	contrat Personne qui a été sélectionnée.
		 */
		public function selectionContrat(contrat:ContratVo):void
		{
			contratSelectionne = contrat;
			creerAnnees();
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
				this.remboursements = new ArrayCollection();
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
				this.remboursementsEnAttente = new ArrayCollection();
				Alert.show("Aucun remboursement en attente n'a été trouvé.");
			}
			else
			{
				this.remboursementsEnAttente = remboursements;
			}
		}
		
		/**
		 * Création des années en fonction du contrat sélectionné.
		 */
		private function creerAnnees():void
		{
			var anneesCrees:ArrayCollection = new ArrayCollection();
			
			if (contratSelectionne != null)
			{
				var anneeDebut:Number = contratSelectionne.dateOuverture.fullYear;
				var anneeFin:Number = contratSelectionne.dateCloture == null ? new Date().fullYear : contratSelectionne.dateCloture.fullYear;
				
				trace("Creation des annees de ", anneeDebut, " à ", anneeFin);
				
				// Création des années
				for (var i:Number = anneeDebut; i <= anneeFin; i++)
				{
					anneesCrees.addItemAt(i, 0);
				}
				
				// Demande des remboursements de l'années de fin
				_dispatcher.dispatchEvent(new RemboursementEvent(new CritereRemboursement(contratSelectionne.id, anneeFin)));
			}
			
			anneesCouvertureContrat = anneesCrees;
		}
	}

}