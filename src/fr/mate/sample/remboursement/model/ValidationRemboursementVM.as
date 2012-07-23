package fr.mate.sample.remboursement.model
{
	import flash.events.*;
	import fr.mate.core.*;
	import fr.mate.sample.model.*;
	import fr.mate.sample.recherche.events.*;
	import fr.mate.sample.recherche.model.CritereRecherche;
	import fr.mate.sample.remboursement.events.ChangerEtatRemboursementEvent;
	import fr.mate.sample.remboursement.events.RemboursementEvent;
	import mx.charts.chartClasses.NumericAxis;
	import mx.collections.*;
	import mx.events.*;
	import mx.utils.*;
	import flash.utils.*;
	
	/**
	 * UI d'affichage de la synthèse des remboursements du contrat.
	 */
	public class ValidationRemboursementVM extends ViewModel
	{
		/** Le contrat qui a été sélectionné lors de la recherche. */
		[Bindable]
		public var contratSelectionne:ContratVo;
		
		/**
		 * Les remboursements d'une année (celle sélectionnée dans l'UI).
		 */
		private var _remboursements:ArrayCollection;
		
		[Bindable]
		public function get remboursements():ArrayCollection
		{
			return _remboursements;
		}
		
		public function set remboursements(rmbs:ArrayCollection):void
		{
			var remboursementsTrouves:ArrayCollection = new ArrayCollection(rmbs.source);
			
			/* Création du tri des contrats et rafraichissement du tri de la liste. */
			var tris:Sort = new Sort();
			tris.fields = [new SortField("dateReceptionDemande"), new SortField("dateRemboursement")];
			remboursementsTrouves.sort = tris;
			remboursementsTrouves.refresh();
			
			_remboursements = remboursementsTrouves;
		}
		
		/**
		 * Constructeur.
		 * @param	dispatcher Dispatcher. Voir ViewModel.
		 */
		public function ValidationRemboursementVM(dispatcher:IEventDispatcher)
		{
			super(dispatcher);
		}
		
		/**
		 * Valider le remboursement. Il passera à l'état EtatRemboursement.A_REMBOURSER.
		 * @param	remboursement Remboursement à valider.
		 */
		public function validerRemboursement(remboursement:RemboursementVo) :void {
			dispatcher.dispatchEvent(new ChangerEtatRemboursementEvent(remboursement, EtatRemboursement.A_REMBOURSER));
		}
		
		/**
		 * Refuser le remboursement. Il passera à l'état EtatRemboursement.INVALIDE.
		 * @param	remboursement Remboursement à refuser.
		 */
		public function refuserRemboursement(remboursement:RemboursementVo) :void {
			dispatcher.dispatchEvent(new ChangerEtatRemboursementEvent(remboursement, EtatRemboursement.INVALIDE));
		}
	}

}