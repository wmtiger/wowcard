package com.wow.view.login
{
	import com.wow.mgr.GameMgr;
	import com.wow.setting.Setting;
	
	import ext.wm.feathers.AlertInput;
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.Alert;
	import feathers.controls.Button;
	import feathers.data.ListCollection;
	import feathers.layout.VerticalLayout;
	
	import starling.display.Quad;
	import starling.events.Event;
	
	public class LoginScreen extends WmPanelScreen
	{
		private var _normalButton:Button;
		private var _backButton:Button;
		
		public function LoginScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			const verticalLayout:VerticalLayout = new VerticalLayout();
			verticalLayout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_CENTER;
			verticalLayout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_MIDDLE;
			verticalLayout.padding = 20 * this.dpiScale;
			verticalLayout.gap = 16 * this.dpiScale;
			verticalLayout.manageVisibility = true;
			this.layout = verticalLayout;
			
			this._normalButton = new Button();
			this._normalButton.label = "Login";
			this._normalButton.addEventListener(Event.TRIGGERED, normalButton_triggeredHandler);
			this.addChild(this._normalButton);
		}
		
		private function normalButton_triggeredHandler(e:Event):void
		{
			if(GameMgr.instance.getDataFromSetting() == null)
			{
				this.dispatchEventWith(Setting.SHOW_CREATE_ROLE);
			}
			else
			{
				this.dispatchEventWith(Setting.SHOW_USER);
			}
//			Alert.show("input your new CardGroup name", "NewCardGroup", new ListCollection(
//				[
//					{ label: "OK" }
//				]), null,true,true,function():AlertInput
//				{
//					var a:AlertInput = new AlertInput();
//					return a;
//				},function():Quad
//				{
//					var quad:Quad = new Quad(10, 10, 0x000000);
//					quad.alpha = 0.75;
//					return quad;
//				}
//			);
			
//			Alert.show("I just wanted you to know that I have a very important message to share with you.", "Alert", new ListCollection(
//				[
//					{ label: "OK" }
//				]));
		}
	}
}