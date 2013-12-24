package com.wow.view.comps
{
	import com.wow.themes.UIAssets;
	
	import ext.wm.feathers.FeaSprite;
	
	import feathers.controls.ImageLoader;
	
	import starling.display.Image;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	
	public class CardSmall extends FeaSprite
	{
		private var _costTf:TextField;
		private var _attackTf:TextField;
		private var _hpTf:TextField;
		private var _imgContent:ImageLoader;
		protected var _bg:Image;
		private var _type:int;//type = 0 为背面，type ＝ 1 为正面
		
		public function CardSmall(type:int = 0)
		{
			super();
			_type = type;
			if(type == 1)
			{
				_bg = new Image(UIAssets.instance.cardSmallFaceTexture);
			}
			else 
			{
				_bg = new Image(UIAssets.instance.cardSmallBackTexture);
			}
			addChild(_bg);
			addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		protected function onTouch(e:TouchEvent):void
		{
			var t:Touch = e.getTouch(stage);
			if (t && t.phase == TouchPhase.ENDED)
			{
				clickCardSmall();
			}
		}
		
		protected function clickCardSmall():void
		{
			if(_type == 1)
			{
				trace("show detail card's info panel");
			}
		}
		
		override protected function initialize():void
		{
			if(_type == 1)
			{
				_imgContent = new ImageLoader();
				addChild(_imgContent);
				_imgContent.x = 12;
				_imgContent.y = 25;
				_imgContent.source = "/assets/images/cards/small/jbubing.jpg";
			}
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