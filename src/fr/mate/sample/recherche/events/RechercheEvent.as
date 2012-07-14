package fr.mate.sample.recherche.events 
{
	import flash.events.Event;
	import fr.mate.sample.recherche.model.CritereRecherche;
	
	/**
	 * Evenement de lancement d'une recherche.
	 */
	public class RechercheEvent extends Event 
	{
		public static const GET:String = "fr.mate.sample.recherche.events.RechercheEvent";
		
		private var _informationsRecherche:CritereRecherche;
		
		public function RechercheEvent(informationsRecherche:CritereRecherche) 
		{ 
			super(GET);
			this._informationsRecherche = informationsRecherche;
		} 
		
		public function get informationsRecherche():CritereRecherche {
			return _informationsRecherche;
		}
		
		public override function clone():Event 
		{ 
			return new RechercheEvent(this._informationsRecherche);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("RechercheEvent", "_informationsRecherche"); 
		}
		
	}
	
}