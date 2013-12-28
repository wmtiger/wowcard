package com.wow.view.user
{
	import com.wow.mgr.GameMgr;
	import com.wow.setting.Setting;
	
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	import feathers.core.IFeathersControl;
	import feathers.data.ListCollection;
	import feathers.layout.AnchorLayout;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class UserScreen extends WmPanelScreen
	{
		private var _cardMgrButton:Button;
		private var _friendButton:Button;
		private var _buttonGroup:ButtonGroup;
		
		public function UserScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();
			
			initHeader();
			initFooter();
		}
		
		private function initHeader():void
		{
			this.headerProperties.title = "Hi," +GameMgr.instance.getDataFromSetting();
			
			this._cardMgrButton = new Button();
			this._cardMgrButton.nameList.add(Button.ALTERNATE_NAME_FORWARD_BUTTON);
			this._cardMgrButton.label = "CardMgr";
			this._cardMgrButton.addEventListener(Event.TRIGGERED, cardMgrButton_triggeredHandler);
			
			this.headerProperties.rightItems = new <DisplayObject>
				[
					this._cardMgrButton
				];
		}
		
		private function initFooter():void
		{
			this._buttonGroup = new ButtonGroup();
			this._buttonGroup.dataProvider = new ListCollection(
				[
					{ label: "Friend", triggered: friend_triggeredHandler },
					{ label: "SpeedFight", triggered: speedFight_triggeredHandler }
				]);
			this._buttonGroup.direction = ButtonGroup.DIRECTION_HORIZONTAL;
			
			this.footerFactory = function ():IFeathersControl
			{
				return _buttonGroup;
			}
		}
		
		private function friend_triggeredHandler(event:Event):void
		{
			this.dispatchEventWith(Setting.SHOW_FRIEND);
		}
		
		private function speedFight_triggeredHandler(event:Event):void
		{
			this.dispatchEventWith(Setting.SHOW_BATTLE_FIELD);
		}
		
		private function onCardMgrButton():void
		{
			this.dispatchEventWith(Setting.SHOW_CARD_MGR);
		}
		
		private function cardMgrButton_triggeredHandler(e:Event):void
		{
			onCardMgrButton();
		}
		
		override protected function removeHeader():void {}
		
	}
}