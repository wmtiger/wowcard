package com.wow.view.comps
{
	import ext.wm.feathers.FeaSprite;
	
	import feathers.controls.Button;
	
	import starling.display.Quad;
	import starling.events.Event;
	
	public class CardInfoPanel extends FeaSprite
	{
		private var _bg:Quad;
		private var _cardShow:CardLarge;
		private var _useBtn:Button;
		private var _cancelBtn:Button;
		private var _useFun:Function;
		private var _cancelFun:Function;
		private var _data:Object;
		
		public function CardInfoPanel(d:Object)
		{
			_data = d;
			super();
			
			_bg = new Quad(360,600);
			addChild(_bg);
		}
		
		override protected function initialize():void
		{
			_cardShow = new CardLarge();
			_cardShow.data = _data;
			addChild(_cardShow);
			_cardShow.x = 20;
			_cardShow.y = 20;
			
			_useBtn = new Button();
			addChild(_useBtn);
			_useBtn.width = 100;
			_useBtn.x = 20;
			_useBtn.y = _cardShow.y + 480;
			_useBtn.label = "Use";
			_useBtn.addEventListener(Event.TRIGGERED, onTriUse);
			
			_cancelBtn = new Button();
			addChild(_cancelBtn);
			_cancelBtn.width = 100;
			_cancelBtn.x = 240;
			_cancelBtn.y = _cardShow.y + 480;
			_cancelBtn.label = "Cancel";
			_cancelBtn.addEventListener(Event.TRIGGERED, onTriCancel);
		}
		
		public function setCallBack(useFun:Function, cancelFun:Function):void
		{
			_useFun = useFun;
			_cancelFun = cancelFun;
		}
		
		private function onTriUse(e:Event):void
		{
			if(_useFun != null)
			{
				_useFun();
			}
		}
		
		private function onTriCancel(e:Event):void
		{
			if(_cancelFun != null)
			{
				_cancelFun();
			}
		}

	}
}