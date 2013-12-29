package com.wow.view.login
{
	import com.wow.common.model.UserModel;
	import com.wow.common.vo.UserVO;
	import com.wow.evt.WmEvent;
	import com.wow.mgr.EvtMgr;
	import com.wow.mgr.GameMgr;
	import com.wow.net.SocketCmd;
	import com.wow.net.SocketService;
	import com.wow.setting.Setting;
	
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.Button;
	import feathers.controls.TextInput;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.VerticalLayout;
	
	import starling.events.Event;
	
	public class LoginScreen extends WmPanelScreen
	{
		private var _normalButton:Button;
		private var _backButton:Button;
		private var _input:TextInput;
		private var _inputPwd:TextInput;
		private var _regButton:Button;
		
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
			
			this._input = new TextInput();
			this._input.prompt = "Type Your Name";
			this._input.isEditable = true;
			const inputLayoutData:AnchorLayoutData = new AnchorLayoutData();
			inputLayoutData.horizontalCenter = 0;
			inputLayoutData.verticalCenter = 0;
			this._input.layoutData = inputLayoutData;
			this.addChild(this._input);
			
			this._inputPwd = new TextInput();
			this._inputPwd.prompt = "";
			this._inputPwd.isEditable = true;
			this._inputPwd.displayAsPassword = true;
			const inputLayoutData1:AnchorLayoutData = new AnchorLayoutData();
			inputLayoutData1.horizontalCenter = 0;
			inputLayoutData1.verticalCenter = 0;
			this._inputPwd.layoutData = inputLayoutData1;
			this.addChild(this._inputPwd);
			
			this._normalButton = new Button();
			this._normalButton.label = "Login";
			this._normalButton.addEventListener(Event.TRIGGERED, normalButton_triggeredHandler);
			this.addChild(this._normalButton);
			
			this._regButton = new Button();
			this._regButton.label = "Rigister";
			this._regButton.addEventListener(Event.TRIGGERED, regButton_triggeredHandler);
			this.addChild(this._regButton);
		}
		
		private function regButton_triggeredHandler(e:Event):void
		{
			this.dispatchEventWith(Setting.SHOW_CREATE_ROLE);
		}
		
		private function normalButton_triggeredHandler(e:Event):void
		{
			
			this.dispatchEventWith(Setting.SHOW_USER);//test
//			this.dispatchEventWith(Setting.SHOW_BATTLE_FIELD);//test
			return;
			if(_input.text.length > 0 && _input.text != _input.prompt)
			{
				EvtMgr.instance.addEventListener(SocketCmd.SOCKET_CONNECTED, onConnected);
				SocketService.instance.connect();
			}
		}
		
		private function onConnected(e:WmEvent):void 
		{
			SocketService.instance.send(SocketCmd.LOGIN, { username:_input.text + "", password:_inputPwd.text+"" }, showUserView );
		}
		
		private function showUserView(obj:Object):void
		{
			if(obj.state == 1)
			{
				trace("成功");
				var vo:UserVO = new UserVO();
				vo.userid = obj.userid;
				UserModel.instance.userVO = vo;
				this.dispatchEventWith(Setting.SHOW_USER);
			}
			else if(obj.state == 2)
			{
				trace("未注册");
			}
			else if(obj.state == 3)
			{
				trace("被踢");
			}
		}
		
		override public function dispose():void
		{
			EvtMgr.instance.removeEventListener(SocketCmd.SOCKET_CONNECTED, onConnected);
			super.dispose();
		}
		
	}
}