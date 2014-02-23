package com.wow.view.comps
{
	import com.wow.view.fight.IBattleField;
	
	import feathers.controls.ImageLoader;
	
	import starling.display.Quad;
	
	
	public class CardInField extends CardSmall
	{
		public function CardInField(handle:IBattleField)
		{
			super(handle);
		}
		
		override protected function init():void
		{
			var q:Quad = new Quad(60,80);
			addChild(q);
		}
		
		override protected function initialize():void
		{
			_imgContent = new ImageLoader();
			addChild(_imgContent);
			setImgXY();
			setImg();
		}
		
		override protected function clickCardSmall():void
		{
			trace("click card here");
		}
		
		override protected function setImgXY():void
		{
			_imgContent.x = 2;
			_imgContent.y = 2;
		}
	}
}