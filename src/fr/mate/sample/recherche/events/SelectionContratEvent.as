package fr.mate.sample.recherche.events 
{
	import flash.events.Event;
	import fr.mate.sample.model.ContratVo;
	import fr.mate.sample.recherche.model.CritereRecherche;
	
	/**
	 * Evenement de sélection d'un contrat pour voir les remboursements.
	 */
	public class SelectionContratEvent extends Event 
	{
		public static const EVENT:String = "fr.mate.sample.recherche.events.SelectionContratEvent";
		
		private var _contrat:ContratVo;
		
		public function SelectionContratEvent(contrat:ContratVo) 
		{ 
			super(EVENT);
			this._contrat = contrat;
		} 
		
		public function get contrat():ContratVo {
			return _contrat;
		}
		
		public override function clone():Event 
		{ 
			return new RechercheEvent(this._contrat);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("SelectionContratEvent", "_contrat"); 
		}
		
	}
	
}