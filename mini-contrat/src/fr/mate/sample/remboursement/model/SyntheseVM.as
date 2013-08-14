package fr.mate.sample.remboursement.model
{
	import flash.events.*;
	import fr.mate.core.*;
	import fr.mate.sample.model.*;
	import fr.mate.sample.recherche.events.*;
	import fr.mate.sample.recherche.model.CritereRecherche;
	import fr.mate.sample.remboursement.events.RemboursementEvent;
	import mx.charts.chartClasses.NumericAxis;
	import mx.collections.*;
	import mx.events.*;
	import mx.utils.*;
	import flash.utils.*;
	
	/**
	 * UI d'affichage de la synthèse des remboursements du contrat.
	 */
	public class SyntheseVM extends ViewModel
	{
		/** Le contrat qui a été sélectionné lors de la recherche. */
		[Bindable]
		public var contratSelectionne:ContratVo;
		
		/**
		 * Les différents années qui seront affichées.
		 * Les années commencent à la date d'ouverture du contrat et vont jusqu'à la date de cloture ou l'année actuelle
		 */
		[Bindable]
		public var annees:ArrayCollection;
		
		/**
		 * Les remboursements d'une année (celle sélectionnée dans l'UI).
		 */
		private var _remboursements:ArrayCollection;
		
		[Bindable]
		public function get remboursements():ArrayCollection
		{
			//trace("1.rmbs " + _remboursements.length);
			
			return _remboursements;
		}
		
		public function set remboursements(rmbs:ArrayCollection):void
		{
			var remboursementsTrouves:ArrayCollection = new ArrayCollection(rmbs.source);
			
			/* Création du tri des contrats et rafraichissement du tri de la liste. */
			var tris:Sort = new Sort();
			tris.fields = [new SortField("dateReceptionDemande"), new SortField("dateRemboursement"), new SortField("etatRemboursement")];
			remboursementsTrouves.sort = tris;
			remboursementsTrouves.refresh();
			
			_remboursements = remboursementsTrouves;
		}
		
		/**
		 * Constructeur.
		 * @param	dispatcher Dispatcher. Voir ViewModel.
		 */
		public function SyntheseVM(dispatcher:IEventDispatcher)
		{
			super(dispatcher);
		}
		
		public function chargerRemboursement(numeroContrat:Number, annee:Number):void {
			_remboursements = new ArrayCollection();
			
			dispatcher.dispatchEvent(new RemboursementEvent(new CritereRemboursement(numeroContrat, annee)));
		}
	}

}