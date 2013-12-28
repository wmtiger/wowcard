package com.wow.view.comps
{
	import com.wow.common.constant.Constant;
	import com.wow.common.utils.NormalUtil;
	import com.wow.themes.UIAssets;
	import com.wow.view.fight.IBattleField;
	
	import ext.wm.feathers.FeaSprite;
	
	import feathers.controls.ImageLoader;
	import feathers.core.PopUpManager;
	
	import starling.display.Image;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	
	public class CardSmall extends FeaSprite implements ICardSmall
	{
		protected var _costTf:TextField;
		protected var _attackTf:TextField;
		protected var _hpTf:TextField;
		protected var _imgContent:ImageLoader;
		protected var _bg:Image;
		protected var _type:int;//type = 0 为背面，type ＝ 1 为正面
		protected var _data:Object;
		protected var _handle:IBattleField;
		
		public function CardSmall(handle:IBattleField, type:int = 0)
		{
			_handle = handle;
			super();
			_type = type;
			init();
			addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		protected function init():void
		{
			if(_type == 1)
			{
				_bg = new Image(UIAssets.instance.cardSmallFaceTexture);
			}
			else 
			{
				_bg = new Image(UIAssets.instance.cardSmallBackTexture);
			}
			addChild(_bg);
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
				var cip:CardInfoPanel = new CardInfoPanel(data);
				cip.setCallBack(usefun, nofun);
				PopUpManager.addPopUp(cip);
				
				function usefun():void
				{
					_handle.addToArmyField(data.id, Constant.FROM_HAND);
					deleteCip();
				}
				
				function nofun():void
				{
					deleteCip();
				}
				
				function deleteCip():void
				{
					PopUpManager.removePopUp(cip,true);
					cip = null;
				}
			}
		}
		
		override protected function initialize():void
		{
			if(_type == 1)
			{
				_imgContent = new ImageLoader();
				addChild(_imgContent);
				setImgXY();
				setImg();
			}
		}
		
		protected function setImgXY():void
		{
			_imgContent.x = 12;
			_imgContent.y = 25;
		}
		
		protected function setImg():void
		{
			_imgContent.source = NormalUtil.getCardImgByTid(data.tid, Constant.CARD_SIZE_SMALL);
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

		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data = value;
		}

	}
}