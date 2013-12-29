package com.wow.common.cfg
{
	import flash.utils.Dictionary;

	public class CardConfig
	{
		private static var _instance:CardConfig;
		
		public var cfg:Array;
		public var dict:Dictionary;
		
		public function CardConfig()
		{
			cfg = [];
			dict = new Dictionary();
		}
		
		public static function get instance():CardConfig
		{
			if (_instance == null)
				_instance = new CardConfig();
			return _instance;
		}

	}
}