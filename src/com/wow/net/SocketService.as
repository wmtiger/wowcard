package com.wow.net
{
	import com.wow.evt.WmEvent;
	import com.wow.mgr.EvtMgr;
	
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author wmTiger
	 */
	public class SocketService
	{
		private static var _instance:SocketService;
		
		private var _socket:Socket;
		private var _host:String;
		private var _port:int;
		private var _bufferData:ByteArray;
		
		public function SocketService()
		{
			_socket = new Socket();
			_bufferData = new ByteArray();
		}
		
		public function init(host:String, port:int):void
		{
			_host = host;
			_port = port;
		}
		
		static public function get instance():SocketService
		{
			if (_instance == null)
			{
				_instance = new SocketService();
			}
			return _instance;
		}
		
		private function configureListeners():void
		{
			_socket.addEventListener(Event.CLOSE, closeHandler);
			_socket.addEventListener(Event.CONNECT, connectHandler);
			_socket.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			_socket.addEventListener(ProgressEvent.SOCKET_DATA, socketDataHandler);
		}
		
		private function removeListeners():void
		{
			_socket.removeEventListener(Event.CLOSE, closeHandler);
			_socket.removeEventListener(Event.CONNECT, connectHandler);
			_socket.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			_socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			_socket.removeEventListener(ProgressEvent.SOCKET_DATA, socketDataHandler);
		}
		
		private function socketDataHandler(e:ProgressEvent):void
		{
			trace("socketDataHandler->");
			_socket.readBytes(_bufferData, _bufferData.length);
			
			var pk:WmPacket = WmPacket.buildPacketFromByteArray(_bufferData);
			
			while (pk != null)
			{
				if (_bufferData == null)
				{
					return;
				}
				if (_bufferData.bytesAvailable == 0)
				{
					var backObj:Object = pk.content.readObject();
					traceObj(backObj);//test
					SocketListener.instance.doCallBack(backObj);
					
					_bufferData.position = 0;
					_bufferData.length = 0;
					return;
				}
				pk = WmPacket.buildPacketFromByteArray(_bufferData);
			}
		}
		
		private function traceObj(obj:Object):void
		{
			for(var i:String in obj)
			{
				trace(i, obj[i]);
			}
		}
		
		private function securityErrorHandler(e:SecurityErrorEvent):void
		{
			trace("安全沙箱socket："+e);
		}
		
		private function ioErrorHandler(e:IOErrorEvent):void
		{
			trace("socket io："+e);
		}
		
		private function connectHandler(e:Event):void
		{
			trace("connectHandler->", e);
			EvtMgr.instance.dispatchEvent(new WmEvent(SocketCmd.SOCKET_CONNECTED));
		}
		
		private function closeHandler(e:Event):void
		{
			trace(e);
			removeListeners();
		}
		
		public function connect():void
		{
			configureListeners();
			_socket.connect(_host, _port);
		}
		
		public function close():void
		{
			_socket.close();
		}
		
		public function isConnected():Boolean
		{
			return _socket.connected;
		}
		
		public function send(cmd:String, param:Object, callBack:Function = null):void
		{
			var obj:Object = { cmd:cmd, param:param };
			var p:WmPacket = new WmPacket();
			p.content.writeObject(obj);
			SocketListener.instance.regListener(cmd, callBack);
			sendRequest(p);
		}
		
		public function sendRequest(p:WmPacket):void
		{
			var buf:ByteArray = p.serialization();
			if (isConnected())
			{
				try
				{
					_socket.writeBytes(buf);
					_socket.flush();
					trace("send:" + buf.length, buf);
				}
				catch (e:IOError)
				{
					trace("connect error：" + e.getStackTrace());
				}
			}
			else
			{
				trace("not connected");
			}
		}
	}

}