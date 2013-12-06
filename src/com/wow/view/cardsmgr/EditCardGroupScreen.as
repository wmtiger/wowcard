package com.wow.view.cardsmgr
{
	import com.wow.setting.Setting;
	
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.Button;
	import feathers.controls.List;
	import feathers.layout.AnchorLayout;
	import feathers.system.DeviceCapabilities;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class EditCardGroupScreen extends WmPanelScreen
	{
		private var _list:List;
		
		public var selectedCardGroup:Object;
		private var _backButton:Button;
		
		public function EditCardGroupScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();
			
			initHeader();
//			initBody();
//			initFooter();
			
		}
		
		private function initHeader():void
		{
			if(!DeviceCapabilities.isTablet(Starling.current.nativeStage))
			{
				this._backButton = new Button();
				this._backButton.nameList.add(Button.ALTERNATE_NAME_BACK_BUTTON);
				this._backButton.label = "BackCardMgr";
				this._backButton.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);
				
				this.headerProperties.leftItems = new <DisplayObject>
					[
						this._backButton
					];
				
				this.backButtonHandler = this.onBackButton;
			}
			
			this.headerProperties.title = "" + selectedCardGroup.label;
			
		}
		
		private function backButton_triggeredHandler(e:Event):void
		{
			onBackButton();
		}
		
		private function onBackButton():void
		{
			this.dispatchEventWith(Setting.SHOW_CARD_MGR);
		}
		
		override protected function removeHeader():void {}
		
	}
}