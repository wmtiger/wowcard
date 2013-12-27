package com.wow.view.comps
{
	import com.wow.themes.UIAssets;
	
	import flash.geom.Rectangle;
	
	import ext.wm.feathers.FeaSprite;
	
	import feathers.controls.ImageLoader;
	
	import starling.display.Image;
	
	public class CardLarge extends FeaSprite
	{
		private var _imgContent:ImageLoader;
		protected var _bg:Image;
		
		public function CardLarge()
		{
			super();
			_bg = new Image(UIAssets.instance.cardLargeFaceTexture);
			addChild(_bg);
		}
		
		override protected function initialize():void
		{
			_imgContent = new ImageLoader();
			addChild(_imgContent);
			_imgContent.x = 46;
			_imgContent.y = 98;
			_imgContent.clipRect = new Rectangle(0,0,230,230);
			_imgContent.source = "/assets/images/cards/large/jbubing.png";
		}
	}
}