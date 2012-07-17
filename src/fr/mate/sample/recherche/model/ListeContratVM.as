package fr.mate.sample.recherche.model
{
	import flash.events.*;
	import fr.mate.core.*;
	import fr.mate.sample.model.*;
	import fr.mate.sample.recherche.events.SelectionContratEvent;
	import fr.mate.sample.recherche.events.SelectionPersonneEvent;
	import mx.collections.*;
	import mx.utils.*;
	
	/**
	 * UI d'affichage des résultats de la recherche de personnes.
	 */
	public class ListeContratVM extends ViewModel
	{
		/**
		 * La personne qui a été sélectionné lors de la recherche.
		 */
		[Bindable]
		public var personneSelectionnee:PersonneVo;
		
		/**
		 * Constructeur.
		 * @param	dispatcher Dispatcher. Voir ViewModel.
		 */
		public function ListeContratVM(dispatcher:IEventDispatcher)
		{
			super(dispatcher);
		}
		
		/**
		 * Liste des contrats de la personne sélectionnée dans la recherche.
		 */
		public function get contrats():ArrayCollection
		{
			var contrats:ArrayCollection = new ArrayCollection(personneSelectionnee.contrats.source);
			
			var triDateCloture:SortField = new SortField("dateCloture");
			var triDateOuverture:SortField = new SortField("dateOuverture");
			var triTypeContrat:SortField = new SortField("type");
			
			/* Création du tri des contrats et rafraichissement du tri de la liste. */
			var tris:Sort = new Sort();
			tris.fields = [triDateCloture, triDateOuverture, triTypeContrat];
			contrats.sort = tris;
			contrats.refresh();
			
			return contrats;
		}
		
		/**
		 * Sélection d'un contrat dans le but de voir les informations qui lui sont rattachées.
		 * @param	contrat Contrat sélectionné.
		 */
		public function selectionnerContrat(contrat:ContratVo):void
		{
			dispatcher.dispatchEvent(new SelectionContratEvent(contrat));
		}
	}

}