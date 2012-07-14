package fr.mate.core
{
	import mx.formatters.DateFormatter;
	import mx.controls.advancedDataGridClasses.*;
	
	/**
	 * Utilitaire pour des formatters.
	 */
	public final class FormatterUtils
	{
		
		private static var _dateFormatter:DateFormatter;
		
		public static function get dateFormatter():DateFormatter
		{
			if (_dateFormatter == null)
			{
				_dateFormatter = new DateFormatter();
				_dateFormatter.formatString = "DD/MM/YYYY";
			}
			
			return _dateFormatter;
		}
		
		public static function formatDate(item:Object, column:AdvancedDataGridColumn):String {
			var date:Date = item[column.dataField];
			return dateFormatter.format(date);
		}
	}

}