package fr.mate.sample.recherche.events 
{
	import flash.events.Event;
	import fr.mate.sample.model.PersonneVo;
	
	/**
	 * Evenement de sélection d'une personne pour voir ses contrats.
	 */
	public class SelectionPersonneEvent extends Event 
	{
		/** Nom de l'event. */
		public static const EVENT:String = "fr.mate.sample.recherche.events.SelectionPersonne";
		
		/** Personne qui a été sélectionnée. */
		private var _personne:PersonneVo;
		
		/**
		 * Constructeur.
		 * @param	personne Personne qui a été sélectionnée.
		 */
		public function SelectionPersonneEvent(personne:PersonneVo) 
		{ 
			super(EVENT);
			_personne = personne;
		} 
		
		/**
		 * Personne qui a été sélectionnée.
		 */
		public function get personne():PersonneVo {
			return _personne;
		}
		
		public override function clone():Event 
		{ 
			return new SelectionPersonneEvent(this._personne);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("SelectionPersonneEvent", "_personne"); 
		}
		
	}
	
}