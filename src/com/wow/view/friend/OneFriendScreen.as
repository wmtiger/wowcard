package com.wow.view.friend
{
	import com.wow.setting.Setting;
	
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.Button;
	import feathers.layout.VerticalLayout;
	import feathers.system.DeviceCapabilities;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class OneFriendScreen extends WmPanelScreen
	{
		private var _backButton:Button;
		public function OneFriendScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			const verticalLayout:VerticalLayout = new VerticalLayout();
			verticalLayout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_CENTER;
			verticalLayout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_TOP;
			verticalLayout.padding = 20 * this.dpiScale;
			verticalLayout.gap = 16 * this.dpiScale;
			verticalLayout.manageVisibility = true;
			this.layout = verticalLayout;
			
			this.headerProperties.title = "OneFriend";
			
			if(!DeviceCapabilities.isTablet(Starling.current.nativeStage))
			{
				this._backButton = new Button();
				this._backButton.nameList.add(Button.ALTERNATE_NAME_BACK_BUTTON);
				this._backButton.label = "Friend";
				this._backButton.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);
				
				this.headerProperties.leftItems = new <DisplayObject>
					[
						this._backButton
					];
				
				this.backButtonHandler = this.onBackButton;
			}
		}
		
		private function backButton_triggeredHandler(event:Event):void
		{
			this.onBackButton();
		}
		
		private function onBackButton():void
		{
			this.dispatchEventWith(Setting.SHOW_FRIEND);
		}
		
		override protected function removeHeader():void {}
		
	}
}