package fr.mate.sample.remboursement.events
{
	import flash.events.Event;
	import fr.mate.sample.remboursement.model.CritereRemboursement;
	
	/**
	 * Evenement de lancement d'une recherche des remboursements.
	 */
	public class RemboursementEvent extends Event
	{
		public static const GET:String = "fr.mate.sample.remboursement.events.RemboursementEvent";
		
		private var _informationsRecherche:CritereRemboursement;
		
		public function RemboursementEvent(informationsRecherche:CritereRemboursement)
		{
			super(GET);
			this._informationsRecherche = informationsRecherche;
		}
		
		public function get informationsRecherche():CritereRemboursement
		{
			return _informationsRecherche;
		}
		
		public override function clone():Event
		{
			return new RemboursementEvent(this._informationsRecherche);
		}
		
		public override function toString():String
		{
			return formatToString("RemboursementEvent", "_informationsRecherche");
		}
	
	}

}