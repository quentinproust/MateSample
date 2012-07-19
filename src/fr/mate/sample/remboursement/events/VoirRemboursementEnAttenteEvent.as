package fr.mate.sample.remboursement.events
{
	import flash.events.Event;
	import fr.mate.sample.remboursement.model.CritereRemboursement;
	
	/**
	 * Evenement de lancement d'une recherche des remboursements.
	 */
	public class VoirRemboursementEnAttenteEvent extends Event
	{
		public static const GET:String = "fr.mate.sample.remboursement.events.VoirRemboursementEnAttenteEvent";
		
		private var _numeroContrat:Number;
		
		public function VoirRemboursementEnAttenteEvent(numeroContrat:Number)
		{
			super(GET);
			this._numeroContrat = numeroContrat;
		}
		
		public function get numeroContrat():Number
		{
			return _numeroContrat;
		}
		
		public override function clone():Event
		{
			return new VoirRemboursementEnAttenteEvent(this._numeroContrat);
		}
		
		public override function toString():String
		{
			return formatToString("RemboursementEvent", "_numeroContrat");
		}
	
	}

}