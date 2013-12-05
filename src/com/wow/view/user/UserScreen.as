package com.wow.view.user
{
	import com.wow.setting.Setting;
	
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.Button;
	import feathers.core.IFeathersControl;
	import feathers.layout.AnchorLayout;
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class UserScreen extends WmPanelScreen
	{
		private var _cardMgrButton:Button;
		private var _friendButton:Button;
		
		public function UserScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();
			
			this.headerProperties.title = "User";
			
			this._friendButton = new Button();
			this._friendButton.label = "Friend";
			this._friendButton.addEventListener(Event.TRIGGERED, friendButton_triggeredHandler);
//			addChild(_friendButton);
			
			this._cardMgrButton = new Button();
			this._cardMgrButton.nameList.add(Button.ALTERNATE_NAME_FORWARD_BUTTON);
			this._cardMgrButton.label = "CardMgr";
			this._cardMgrButton.addEventListener(Event.TRIGGERED, cardMgrButton_triggeredHandler);
			
			this.headerProperties.rightItems = new <DisplayObject>
				[
					this._cardMgrButton
				];
			
			this.footerFactory = function ():IFeathersControl
			{
				return _friendButton;
			}
				
		}
		
		private function onCardMgrButton():void
		{
			this.dispatchEventWith(Setting.SHOW_CARD_MGR);
		}
		
		private function friendButton_triggeredHandler(e:Event):void
		{
			this.dispatchEventWith(Setting.SHOW_FRIEND);
		}
		
		private function cardMgrButton_triggeredHandler(e:Event):void
		{
			onCardMgrButton();
		}
		
		override protected function removeHeader():void {}
		
	}
}