package ChargeurTransformice_fla
{
    import flash.display.MovieClip;
    import flash.display.Loader;
    import flash.display.LoaderInfo;
    import com.bit101.components.PushButton;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.events.KeyboardEvent;
    import flash.utils.ByteArray;
    import __AS3__.vec.Vector;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.text.*;
    import com.bit101.components.*;
    import flash.ui.*;
    import flash.system.*;
    import flash.net.*;
    import __AS3__.vec.*;

    public class MainTimeline extends MovieClip 
    {

        public static var Instance:MainTimeline;

        public var _C:MovieClip;
        public var Charge:Number;
        public var Chargeur:Loader;
        public var P:Number;
        protected var LoaderInfoDomain:LoaderInfo;
        public var tfm:Object;
        public var attMsgPrive:Boolean = false;
        public var attMsgNormal:Boolean = false;
        public var LoopPrive:Boolean = false;
        public var LoopNormal:Boolean = true;
        public var LoopMsg:Boolean = false;
        public var timerInit:uint = 0;
        public var timerInitMsg:uint = 0;
        public var delayMsg:Number = 2000;
        public var delayRoom:Number = 1000;
        public var ratoindex:int = 0;
        public var roomindex:int = 0;
        public var TIMER_MSG:Number = 1000;
        public var MsgTxt:String = "Mensagem";
        var Message_Chat = "TokMsg";
        var ClipJoueur = "TokClip";
        var Moteur = "TokMoteur";
        var Satellite = "TokSat";
        var envoie = "TokEnvoie";
        var ListeJoueur = "TokListe";
        var NomJoueur = "TokNomJou";
        var ChatComando = "TokChatComando";
        var ProxyTribulle = "TokProxyTri";
        var ProxyInstance = "TokProxyIns";
        var envoieMsgPrive = "TokEnvPrive";
        var ChatTribulle = "TokChatTri";
        var validationMessage = "TokValidation";
        var GetAdmin = "TokGetAdmin";
        var Admin = "TokAdmin";
        var AFKc = "TokAFKc";
        var AFK1 = "TokAFK1";
        var AFK2 = "TokAFK2";
        var ReceptionDone = "TokReception";
        var loaderBytes = "TokBytes";
        var loaderUrl = "TokURL";
        var btnAtivar:PushButton;
        var RoomArray:Array;
        var RatoArray:Array;
        var TypeRoomArray:Array;

        public function MainTimeline()
        {
            this.RoomArray = new Array();
            this.RatoArray = new Array();
            this.TypeRoomArray = new Array();
            super();
            Instance = this;
            addFrameScript(0, this.frame1);
        }

        public function Chargement_Ok(event:Event):void
        {
            this.Chargeur.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.Chargement_Ok);
            this.Chargeur.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, this.Chargement_EnCours);
            this.Charge = 0;
            removeChild(this._C);
            this.tfm = event.target.content;
            this.LoaderInfoDomain = LoaderInfo(event.target);
            this.Moteur = this.PegarClass(this.Moteur);
            this.ProxyTribulle = this.PegarClass(this.ProxyTribulle);
            this.ChatTribulle = this.PegarClass(this.ChatTribulle);
            this.GetAdmin = this.PegarClass(this.GetAdmin);
            this.tfm[this.loaderBytes] = 8125;
            this.tfm[this.loaderUrl] = "http://transformice.com/";
            trace("Carregado");
            this.btnAtivar = new PushButton(stage, 580, 3, "Abrir Menu", function ()
            {
                addChild(new Menu());
                stage.addEventListener(KeyboardEvent.KEY_DOWN, HackKeys);
                stage.addEventListener(Event.ENTER_FRAME, enterFrame);
                btnAtivar.visible = false;
                TypeRoomArray.push(1);
                AFKc[AFK1][AFK2] = 9999999999999;
                MsgChat("<a:hover>Hack Feito Por iCooper™!!!");
            });
        }

        public function Chargement_EnCours(_arg1:ProgressEvent):void
        {
            if (_arg1.bytesLoaded > this.Charge)
            {
                this.Charge = _arg1.bytesLoaded;
            };
            var _local2:* = _arg1.bytesTotal;
            this.P = (this.Charge / _local2);
            this._C._B.width = (this.P * 200);
        }

        public function Ativando(_arg1:int, _arg2:Boolean, _arg3:Number=0):void
        {
            if (_arg1 == 0)
            {
                this.attMsgNormal = _arg2;
                this.LoopNormal = _arg2;
                trace(("Msg normal: " + this.attMsgNormal));
            }
            else
            {
                if (_arg1 == 1)
                {
                    this.attMsgPrive = _arg2;
                    this.LoopPrive = _arg2;
                    trace(("Msg prive: " + this.attMsgPrive));
                }
                else
                {
                    if (_arg1 == 2)
                    {
                        this.LoopMsg = _arg2;
                        trace(("Iniciar: " + this.LoopMsg));
                        if (this.LoopMsg)
                        {
                            this.MsgChat("Iniciando...");
                        };
                    }
                    else
                    {
                        if (_arg1 == 3)
                        {
                            trace(((("Bool: " + _arg2) + ", value: ") + _arg3));
                            if (_arg2)
                            {
                                if (this.TypeRoomArray.indexOf(_arg3) == -1)
                                {
                                    this.TypeRoomArray.push(_arg3);
                                };
                            }
                            else
                            {
                                if (this.TypeRoomArray.indexOf(_arg3) != -1)
                                {
                                    this.TypeRoomArray.removeAt(this.TypeRoomArray.indexOf(_arg3));
                                };
                            };
                        };
                    };
                };
            };
        }

        public function MsgChat(_arg1:String):void
        {
            var _local2 = this.tfm;
            (_local2[this.Message_Chat](("<ROSE> [BOT] <T>" + _arg1)));
        }

        private function HackKeys(_arg1:KeyboardEvent):void
        {
            switch (_arg1.keyCode)
            {
                case Keyboard.G:
                    return;
                case Keyboard.J:
                    return;
                case Keyboard.H:
                    return;
            };
        }

        public function ChangeMsgTxt(_arg1:String):void
        {
            this.MsgTxt = _arg1;
            trace(("Mensagem: " + this.MsgTxt));
        }

        function GetListeJoueur():void
        {
            var _local1:int;
            while (_local1 < this.RoomArray.length)
            {
                setTimeout(this.AddinListeJoueur, this.delayRoom);
                this.delayRoom = (this.delayRoom + 1500);
                setTimeout(this.TrocarSala, this.delayRoom, this.RoomArray[_local1]);
                setTimeout(this.AddinListeJoueur, (this.delayRoom + 1500));
                _local1++;
            };
            setTimeout(this.SendCochicho, (this.delayRoom + 5000));
            this.delayRoom = 2000;
        }

        function SendMsgNormal():void
        {
            var _local1:int;
            while (_local1 < this.RoomArray.length)
            {
                this.delayRoom = (this.delayRoom + 3000);
                setTimeout(this.TrocarSala, this.delayRoom, this.RoomArray[_local1]);
                setTimeout(this.ChatNormal, (this.delayRoom + 2000), this.MsgTxt);
                _local1++;
            };
            this.TIMER_MSG = this.delayRoom;
            this.LoopMsg = true;
            this.MsgChat(("Timer: " + this.TIMER_MSG));
            this.MsgChat(("Total de Salas: <N>" + this.RoomArray.length));
            this.delayRoom = 2000;
        }

        function SendCochicho():void
        {
            var _local1:int;
            while (_local1 < this.RatoArray.length)
            {
                setTimeout(this.ChatPrive, this.delayMsg, this.RatoArray[_local1], this.MsgTxt);
                this.delayMsg = (this.delayMsg + 1500);
                _local1++;
            };
            this.TIMER_MSG = this.delayMsg;
            this.LoopMsg = true;
            this.MsgChat(("Timer: " + this.TIMER_MSG));
            this.MsgChat(("Total de Salas: <N>" + this.RoomArray.length));
            this.MsgChat(("Total de Ratos: <N>" + this.RatoArray.length));
            trace(((("Lista de salas: (" + this.RoomArray.length) + ") ") + this.RoomArray));
            trace(((("Lista de ratos: (" + this.RatoArray.length) + ") ") + this.RatoArray));
            this.delayMsg = 2000;
        }

        function AddinListeJoueur():void
        {
            var _local1:* = null;
            for each (_local1 in this.tfm[this.ListeJoueur])
            {
                if (_local1[this.NomJoueur] != this.tfm[this.ClipJoueur][this.NomJoueur])
                {
                    if (this.RatoArray.indexOf(_local1[this.NomJoueur]) == -1)
                    {
                        this.RatoArray.push(_local1[this.NomJoueur]);
                        this.MsgChat(("Rato adicionado: <N>" + _local1[this.NomJoueur]));
                    };
                };
            };
        }

        function GetRoomName(_arg1:int):void
        {
            var _local2:ByteArray = new ByteArray();
            _local2.writeByte(_arg1);
            this.SendPacket(26, 35, _local2);
        }

        function TrocarSala(_arg1:String):void
        {
            var _local2 = this.tfm;
            (_local2[this.ChatComando](("sala " + _arg1)));
            this.MsgChat(("Trocando de sala: <N>" + _arg1));
        }

        function TrocarSalaPW(_arg1:String, _arg2:String):void
        {
            var _local3:ByteArray = new ByteArray();
            _local3.writeUTF(_arg1);
            _local3.writeUTF(_arg2);
            this.SendPacket(5, 39, _local3);
        }

        function SetPassword(_arg1:String):void
        {
            var _local2 = this.tfm;
            (_local2[this.ChatComando](("pw " + _arg1)));
        }

        function ChatPrive(_arg1:String, _arg2:String):void
        {
            trace(("Mensagem privada para: " + _arg1));
            var _local3 = this.ProxyTribulle[this.ProxyInstance];
            (_local3[this.envoieMsgPrive](_arg1, _arg2));
        }

        function ChatNormal(_arg1:String):void
        {
            this.GetAdmin[this.Admin] = true;
            var _local2 = this.ChatTribulle[this.ProxyInstance];
            (_local2[this.validationMessage](_arg1));
        }

        function LoopGetRoomName():void
        {
            var _local1:Number = 100;
            trace(this.TypeRoomArray.length);
            if (this.TypeRoomArray.length == 0)
            {
                this.MsgChat("Nenhum tipo de sala selecionado. Adicionando automaticamente todas os tipos de sala.");
                this.TypeRoomArray = new Array(1, 2, 3, 8, 9, 10, 16, 18);
            };
            var _local2:int;
            while (_local2 < this.TypeRoomArray.length)
            {
                setTimeout(this.GetRoomName, _local1, this.TypeRoomArray[_local2]);
                _local1 = (_local1 + 500);
                _local2++;
            };
        }

        function ReceptionMessage(_arg1:ByteArray):void
        {
            var _local4:Vector.<int>;
            var _local5:*;
            var _local6:*;
            var _local7:*;
            var _local8:*;
            var _local9:*;
            var _local10:*;
            var _local11:*;
            var _local12:*;
            var _local13:*;
            var _local14:*;
            var _local15:*;
            var _local16:*;
            var _local17:*;
            var _local18:*;
            var _local19:*;
            _arg1.position = 0;
            var _local2:* = _arg1.readByte();
            var _local3:* = _arg1.readByte();
            if (_local2 == 26)
            {
                if (_local3 == 35)
                {
                    _local5 = _arg1.readByte();
                    _local4 = new Vector.<int>(_local5, true);
                    _local6 = -1;
                    _local7 = 0;
                    while (++_local6 < _local5)
                    {
                        _local9 = _arg1.readByte();
                        _local4[_local6] = _local9;
                    };
                    _local8 = _arg1.readByte();
                    while (_arg1.bytesAvailable)
                    {
                        _local7 = _arg1.readByte();
                        if (_local7 == 0)
                        {
                            _local10 = _arg1.readUnsignedByte();
                            _local11 = _arg1.readUTF();
                            _local12 = _arg1.readUnsignedShort();
                            _local13 = _arg1.readUnsignedByte();
                            _local14 = _arg1.readBoolean();
                            if (this.RoomArray.indexOf(_local11) == -1)
                            {
                                this.MsgChat(("Sala adicionada: <N>" + _local11));
                                this.RoomArray.push(_local11);
                            };
                        }
                        else
                        {
                            if (_local7 == 1)
                            {
                                _local15 = _arg1.readUnsignedByte();
                                _local16 = _arg1.readUTF();
                                _local17 = _arg1.readUTF();
                                _local18 = _arg1.readUTF();
                                _local19 = _arg1.readUTF();
                            };
                        };
                    };
                };
            };
        }

        function SendPacket(_arg1:int, _arg2:int, _arg3:ByteArray):void
        {
            var _local4:ByteArray = new ByteArray();
            _local4.writeByte(_arg1);
            _local4.writeByte(_arg2);
            _local4.writeBytes(_arg3);
            var _local5 = this.Moteur[this.Satellite];
            (_local5[this.envoie](_local4));
        }

        function PegarClass(encript:String):Class
        {
            try
            {
                trace(("Classe: " + encript));
                return (Class(this.LoaderInfoDomain.applicationDomain.getDefinition(encript)));
            }
            catch(E:Error)
            {
                trace(("Classe não encontrada: " + encript));
                return;
            };
        }

        function enterFrame(_arg1:Event):void
        {
            this.ReceptionMessage(this.Moteur[this.Satellite][this.ReceptionDone]);
            if (this.LoopMsg)
            {
                if (!this.timerInit)
                {
                    this.timerInit = getTimer();
                };
                Menu.lbtempo.text = (getTimer() - this.timerInit);
                if ((getTimer() - this.timerInit) >= this.TIMER_MSG)
                {
                    if (this.LoopPrive)
                    {
                        trace("acabouuuu prive");
                        this.RoomArray.length = 0;
                        this.RatoArray.length = 0;
                        this.LoopMsg = false;
                        this.timerInit = 0;
                        this.LoopGetRoomName();
                        setTimeout(this.GetListeJoueur, 7000);
                    }
                    else
                    {
                        if (this.LoopNormal)
                        {
                            trace("acabouuuu normal");
                            this.RoomArray.length = 0;
                            this.RatoArray.length = 0;
                            this.LoopMsg = false;
                            this.timerInit = 0;
                            this.LoopGetRoomName();
                            setTimeout(this.SendMsgNormal, 7000);
                        };
                    };
                    return;
                };
            };
        }

        function frame1()
        {
            this.Charge = 0;
            this.Chargeur = new Loader();
            this.Chargeur.mouseEnabled = false;
            this.P = 0;
            Security.allowDomain("*");
            this._C._B.width = 1;
            this._C.mouseEnabled = false;
            this._C.mouseChildren = false;
            this.Chargeur.contentLoaderInfo.addEventListener(Event.COMPLETE, this.Chargement_Ok);
            this.Chargeur.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.Chargement_EnCours);
            addChild(this.Chargeur);
            this.Chargeur.load(new URLRequest("Transformice.swf"));
        }
    }
}