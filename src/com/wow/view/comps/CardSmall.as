package com.wow.view.comps
{
	import ext.wm.feathers.FeaSprite;
	
	import feathers.controls.ImageLoader;
	
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class CardSmall extends FeaSprite
	{
		private var _costTf:TextField;
		private var _attackTf:TextField;
		private var _hpTf:TextField;
		
		public function CardSmall()
		{
			super();
		}
		
		override protected function initialize():void
		{
			var q:Quad = new Quad(80,115);
			q.alpha = 0;
			addChild(q);
			var img:ImageLoader = new ImageLoader();
			addChild(img);
			img.addEventListener(Event.COMPLETE, onComp);
			img.source = "/assets/images/cards/sf.jpg";
		}
		
		private function onComp(e:Event):void
		{
			_costTf = new TextField(30,30,"99","Verdana", 18,0xffffff,true);
			addChild(_costTf);
			
			_attackTf = new TextField(30,30,"44","Verdana", 18,0xffffff,true);
			addChild(_attackTf);
			_attackTf.y = height - _attackTf.height;
			
			_hpTf = new TextField(30,30,"99","Verdana", 18,0xffffff,true);
			addChild(_hpTf);
			_hpTf.x = width - _hpTf.width;
			_hpTf.y = height - _hpTf.height;
		}
	}
}