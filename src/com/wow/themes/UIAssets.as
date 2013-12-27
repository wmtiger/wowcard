package com.wow.themes
{
	import starling.textures.Texture;

	public class UIAssets
	{
		private static var _instance:UIAssets;
		
		public function UIAssets()
		{
		}

		public static function get instance():UIAssets
		{
			if(_instance == null)
				_instance = new UIAssets();
			return _instance;
		}
		
		public var cardSmallFaceTexture:Texture;
		public var cardSmallBackTexture:Texture;
		public var cardLargeFaceTexture:Texture;
		public var cardLargeBackTexture:Texture;

	}
}