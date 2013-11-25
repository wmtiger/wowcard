package com.wow.common.cfg
{
	public class CardConfig
	{
		private static var _instance:CardConfig;
		
		public var cfg:Array;
		
		public function CardConfig()
		{
			cfg = [];
		}
		
		public static function get instance():CardConfig
		{
			if (_instance == null)
				_instance = new CardConfig();
			return _instance;
		}

	}
}