package com.wow.view.comps
{
	import ext.wm.starling.WmSprite;
	
	import feathers.controls.ImageLoader;
	
	import starling.display.Image;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class CardRender extends WmSprite
	{
		private var _nameTf:TextField;
		private var _costTf:TextField;
		private var _attackTf:TextField;
		private var _hpTf:TextField;
		private var _data:Object;
		
		public function CardRender()
		{
			super();
		}
		
		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data = value;
		}

		override protected function init():void
		{
			width = 320;
			height = 460;
			var q:Quad = new Quad(320,460);
			q.alpha = 0;
			addChild(q);
			var img:ImageLoader = new ImageLoader();
			addChild(img);
			img.addEventListener(Event.COMPLETE, onComp);
			img.source = "/assets/images/cards/0.png";
			
		}
		
		private function onComp(e:Event):void
		{
			_costTf = new TextField(30,20,"99","Verdana", 18,0xffffff,true);
			addChild(_costTf);
			
			_attackTf = new TextField(30,20,"44","Verdana", 18,0xffffff,true);
			addChild(_attackTf);
			_attackTf.y = height - 20;
			
			_hpTf = new TextField(30,20,"99","Verdana", 18,0xffffff,true);
			addChild(_hpTf);
			_hpTf.x = width - 30;
			_hpTf.y = height - 20;
		}
	}
}