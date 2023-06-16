package 
{
    import flash.display.Sprite;
    import flash.display.Loader;
    import flash.display.LoaderInfo;
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.net.URLLoader;
    import com.bit101.components.PushButton;
    import flash.system.ApplicationDomain;
    import flash.system.Capabilities;
    import flash.text.TextFormat;
    import flash.net.URLLoaderDataFormat;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.net.URLRequest;
    import flash.system.LoaderContext;
    import flash.utils.clearTimeout;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;
    import flash.utils.Dictionary;
    import flash.utils.setTimeout;
    import flash.utils.getTimer;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import com.bit101.components.*;
    import flash.text.*;
    import flash.net.*;
    import flash.system.*;

    public class Chargeur extends Sprite 
    {

        public static var instance:Chargeur;

        public var date:Date;
        private var chargeurRessources:Loader;
        protected var hackedAppDomain:LoaderInfo;
        private var clipChargement:MovieClip;
        private var barreChargement:MovieClip;
        private var texteChargement:TextField;
        private var derniereTaille:int;
        private var chargeurBrut:URLLoader;
        public var tfm:Object;
        public var attDatt:Boolean = false;
        public var attAutoWin:Boolean = false;
        public var attAutoWinDep:Boolean = false;
        public var attAutoMort:Boolean = false;
        public var attAutoWinSha:Boolean = false;
        public var attTeleWin:Boolean = false;
        public var attTeleport:Boolean = false;
        public var attTeleCheese:Boolean = false;
        public var attTeleHole:Boolean = false;
        public var attEnterHole:Boolean = false;
        public var mainAccount:Boolean = false;
        public var changeRooms:Boolean = false;
        public var couting:Boolean = false;
        public var indexRoom:int = 0;
        public var timerInit:uint = 0;
        public var timerLoop:uint = 0;
        public var intervalID:uint;
        public var txtPass:String = "1";
        public var TIMER_ROOM:int = 600000;
        public var TIMER_IW:Number = 5000;
        public var TIMER_IW2:Number = 5600;
        public var TIMER_MOVE:Number = 4200;
        public var ListeRoom:Array;
        var Message_Chat = "TokMsg";
        var ClipJoueur = "TokClip";
        var Physique = "TokPhy";
        var SetXForm = "TokSetX";
        var b2Vec2 = "TokVec";
        var tocaclass = "TokTocac";
        var toca1 = "TokToca1";
        var toca2 = "TokToca2";
        var toca3 = "TokToca3";
        var qj = "TokQJ";
        var Mort = "TokMort";
        var Move = "TokMove";
        var AFKc = "TokAFKc";
        var AFK1 = "TokAFK1";
        var AFK2 = "TokAFK2";
        var Moteur = "TokMot";
        var Satellite = "TokSat";
        var envoie = "TokEnv";
        var MS_Mort = "TokMSMort";
        var Guide = "TokGuide";
        var Ppt1 = "Prot1";
        var Ppt2 = "Prot2";
        var ListeJoeur = "TokListe";
        var MudarSala = "TokMudarSala";
        var ChangeSetPw = "TokPwSet";
        var MudarSalaPw = "TokMudarPw";
        var btnAtivar:PushButton;

        public function Chargeur()
        {
            instance = this;
            this.chargementRessourcesOkay(null);
        }

        private function chargementRessourcesOkay(_arg1:Event):void
        {
            var _local2:* = null;
            this.clipChargement = (new (ApplicationDomain.currentDomain.getDefinition("$ClipChargementTransformice"))() as MovieClip);
            addChild(this.clipChargement);
            this.clipChargement.mouseEnabled = false;
            this.clipChargement.mouseChildren = false;
            this.clipChargement.x = ((800 - this.clipChargement.width) / 2);
            this.clipChargement.y = 150;
            this.barreChargement = this.clipChargement._B;
            this.barreChargement.scaleX = 0;
            var _local3 = "Lucida Console";
            try
            {
                _local2 = Capabilities.os.toLowerCase();
                if (_local2.indexOf("linux") != -1)
                {
                    _local3 = "Liberation Mono";
                }
                else
                {
                    if (_local2.indexOf("mac os") != -1)
                    {
                        _local3 = "Courier New";
                    };
                };
            }
            catch(E:Error)
            {
            };
            this.texteChargement = new TextField();
            this.texteChargement.defaultTextFormat = new TextFormat(_local3, 11, 4345711, true, null, null, null, null, "center");
            this.texteChargement.height = 50;
            this.texteChargement.multiline = true;
            this.texteChargement.wordWrap = false;
            this.texteChargement.width = this.clipChargement.width;
            this.texteChargement.y = 200;
            this.clipChargement.addChild(this.texteChargement);
            this.texteChargement.text = "0%";
            this.chargeurBrut = new URLLoader();
            this.chargeurBrut.dataFormat = URLLoaderDataFormat.BINARY;
            this.chargeurBrut.addEventListener(Event.COMPLETE, this.chargementBrutOkay);
            this.chargeurBrut.addEventListener(ProgressEvent.PROGRESS, this.chargementEnCours);
            this.chargeurBrut.load(new URLRequest("Mice.swf"));
        }

        private function chargementBrutOkay(_arg1:Event):void
        {
            if (((this.clipChargement) && (this.clipChargement.parent)))
            {
                this.clipChargement.parent.removeChild(this.clipChargement);
            };
            var _local2:LoaderContext = new LoaderContext();
            _local2.allowCodeImport = true;
            var _local3:Loader = new Loader();
            _local3.contentLoaderInfo.addEventListener(Event.COMPLETE, this.Loaded);
            _local3.loadBytes(_arg1.currentTarget.data, _local2);
            addChild(_local3);
        }

        private function Loaded(E:Event):void
        {
            this.tfm = E.target.content;
            this.hackedAppDomain = LoaderInfo(E.target);
            this.tfm[this.Ppt1] = 8125;
            this.tfm[this.Ppt2] = "http://transformice.com/";
            this.b2Vec2 = this.utilGetClass(this.b2Vec2);
            this.tocaclass = this.utilGetClass(this.tocaclass);
            this.AFKc = this.utilGetClass(this.AFKc);
            this.Moteur = this.utilGetClass(this.Moteur);
            this.MS_Mort = this.utilGetClass(this.MS_Mort);
            this.btnAtivar = new PushButton(stage, 580, 3, "Ativar Hacks", function ()
            {
                Hack();
                addChild(new Menu());
                var _local1 = tfm;
                (_local1[Message_Chat]("<a:hover>FARM TRANSFORMICE FEITO POR <VI>ICOOPER <R>/ <a:active>KIRA <R>/ <J>IPOWER"));
                _local1 = tfm;
                (_local1[Message_Chat]("_SafeStr1"));
                _local1 = tfm;
                (_local1[Message_Chat]("<R>Coloque apenas números no Tempo do AW. Virgula ou letras vão causar mal funcionamento do hack"));
                _local1 = tfm;
                (_local1[Message_Chat]("_SafeStr1"));
                _local1 = tfm;
                (_local1[Message_Chat]("<ROSE>Tempo minimo > <VI>5.0 segundos<ROSE>, tempo recomendado > <VI>15 segundos"));
            });
            trace("Game loaded");
        }

        private function chargementEnCours(_arg1:ProgressEvent):void
        {
            var _local2:int = _arg1.bytesLoaded;
            if (_local2 > this.derniereTaille)
            {
                this.derniereTaille = _local2;
            };
            var _local3:int = _arg1.bytesTotal;
            var _local4:Number = (this.derniereTaille / _local3);
            if (_local4 > 1)
            {
                _local4 = 1;
            };
            this.barreChargement.scaleX = _local4;
            this.texteChargement.text = ((((Math.round((_local4 * 100)) + "%\n") + (_local2 / 1000)) + "/") + (_local3 / 1000));
        }

        public function Ativando(_arg1:int, _arg2:Boolean):void
        {
            if (_arg1 == 0)
            {
                this.attAutoWin = _arg2;
                if (this.attAutoWin)
                {
                    this.attAutoWinDep = false;
                    this.attAutoWinSha = false;
                    this.attAutoMort = false;
                };
                trace(("state Autowin: " + this.attAutoWin));
                var _local3 = this.tfm;
                (_local3[this.Message_Chat](((this.attAutoWin) ? "<ROSE> AUTO WIN = <VP> ON" : "<ROSE> AUTO WIN = <R> OFF")));
            }
            else
            {
                if (_arg1 == 1)
                {
                    this.attAutoWinDep = _arg2;
                    if (this.attAutoWinDep)
                    {
                        this.attAutoWin = true;
                        this.attAutoMort = false;
                        this.attAutoWinSha = false;
                    }
                    else
                    {
                        this.attAutoWin = false;
                        this.attAutoMort = false;
                        this.attAutoWinSha = false;
                    };
                    _local3 = this.tfm;
                    (_local3[this.Message_Chat](((this.attAutoWinDep) ? "<ROSE> AUTO WIN / DEPOIS DO FIRST = <VP> ON" : "<ROSE> AUTO WIN / DEPOIS DO FIRST = <R> OFF")));
                    this.timerInit = 0;
                    trace(("state AutowinDep: " + this.attAutoWinDep));
                }
                else
                {
                    if (_arg1 == 2)
                    {
                        this.attAutoWinSha = _arg2;
                        if (this.attAutoWinSha)
                        {
                            this.attAutoWin = true;
                            this.attAutoMort = false;
                            this.attAutoWinDep = false;
                        }
                        else
                        {
                            this.attAutoWin = false;
                            this.attAutoMort = false;
                            this.attAutoWinDep = false;
                        };
                        _local3 = this.tfm;
                        (_local3[this.Message_Chat](((this.attAutoWinSha) ? "<ROSE> AUTO WIN + AUTO MORT / SE FOR SHAMAN = <VP> ON" : "<ROSE> AUTO WIN + AUTO MORT / SE FOR SHAMAN = <R> OFF")));
                        this.timerInit = 0;
                        trace(("state AutoWinSha: " + this.attAutoWinSha));
                    }
                    else
                    {
                        if (_arg1 == 3)
                        {
                            this.attAutoMort = _arg2;
                            if (this.attAutoMort)
                            {
                                this.attAutoWin = true;
                                this.attAutoWinDep = true;
                                this.attAutoWinSha = false;
                            }
                            else
                            {
                                this.attAutoWin = false;
                                this.attAutoWinDep = false;
                                this.attAutoWinSha = false;
                            };
                            _local3 = this.tfm;
                            (_local3[this.Message_Chat](((this.attAutoMort) ? "<ROSE> AUTO MORT = <VP> ON" : "<ROSE> AUTO MORT = <R> OFF")));
                            this.timerInit = 0;
                            trace(("state AutoMort: " + this.attAutoMort));
                        }
                        else
                        {
                            if (_arg1 == 4)
                            {
                                this.attEnterHole = _arg2;
                                trace(("state EnterHole: " + this.attEnterHole));
                            }
                            else
                            {
                                if (_arg1 == 5)
                                {
                                    this.attTeleWin = _arg2;
                                    trace(("state Telewin: " + this.attTeleWin));
                                }
                                else
                                {
                                    if (_arg1 == 6)
                                    {
                                        this.attTeleport = _arg2;
                                        trace(("state Teleport: " + this.attTeleport));
                                    }
                                    else
                                    {
                                        if (_arg1 == 7)
                                        {
                                            this.attTeleCheese = _arg2;
                                            trace(("state TeleCheese: " + this.attTeleCheese));
                                        }
                                        else
                                        {
                                            if (_arg1 == 8)
                                            {
                                                this.attTeleHole = _arg2;
                                                trace(("state TeleHole: " + this.attTeleHole));
                                            }
                                            else
                                            {
                                                if (_arg1 == 9)
                                                {
                                                    this.mainAccount = _arg2;
                                                    trace(("state MainAcc: " + this.mainAccount));
                                                }
                                                else
                                                {
                                                    if (_arg1 == 10)
                                                    {
                                                        this.changeRooms = _arg2;
                                                        if (this.changeRooms)
                                                        {
                                                            _local3 = this.tfm;
                                                            (_local3[this.Message_Chat]((("<CH>TROCA DE SALA EM <a:active>" + (this.TIMER_ROOM / 60000)) + " <CH>MINUTO(s)")));
                                                            stage.addEventListener(Event.ENTER_FRAME, this.LoopChangeRoom);
                                                        }
                                                        else
                                                        {
                                                            _local3 = this.tfm;
                                                            (_local3[this.Message_Chat]("<V>TROCA DE SALAS PAROU"));
                                                            clearTimeout(this.intervalID);
                                                            this.couting = false;
                                                            stage.removeEventListener(Event.ENTER_FRAME, this.LoopChangeRoom);
                                                        };
                                                        trace(("state ChangeRoom: " + this.changeRooms));
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        public function delayedFunctionCall(_arg1:int, _arg2:Function)
        {
            trace("going to execute the function you passed me in", _arg1, "milliseconds");
            var _local3:Timer = new Timer(_arg1, 1);
            _local3.addEventListener(TimerEvent.TIMER, _arg2);
            _local3.start();
        }

        public function Win():void
        {
            this.tfm[this.ClipJoueur][this.Move] = true;
            this.teleportToCheese();
            this.delayedFunctionCall(300, function (_arg1:Event)
            {
                teleportToHole();
            });
        }

        public function teleportToCheese():void
        {
            var _local1 = this.tfm[this.ClipJoueur][this.Physique];
            (_local1[this.SetXForm](new this.b2Vec2((this.tocaclass[this.toca1][this.qj].x / 30), (this.tocaclass[this.toca1][this.qj].y / 30)), 0));
        }

        public function teleportToHole():void
        {
            var _local1 = this.tfm[this.ClipJoueur][this.Physique];
            (_local1[this.SetXForm](new this.b2Vec2((this.tocaclass[this.toca1][this.toca2][this.toca3][1] / 30), (this.tocaclass[this.toca1][this.toca2][this.toca3][2] / 30)), 0));
        }

        private function ParseKeys(_arg1:KeyboardEvent):void
        {
            switch (_arg1.keyCode)
            {
                case Keyboard.E:
                    return;
                case Keyboard.R:
                    return;
                case Keyboard.O:
                    if (this.attTeleCheese)
                    {
                        this.teleportToCheese();
                    };
                    return;
                case Keyboard.P:
                    if (this.attTeleHole)
                    {
                        this.teleportToHole();
                    };
                    return;
                case Keyboard.X:
                    if (this.attTeleWin)
                    {
                        this.Win();
                    };
                    return;
                case Keyboard.F:
                    if (this.attTeleport)
                    {
                        var _local2 = this.tfm[this.ClipJoueur][this.Physique];
                        (_local2[this.SetXForm](new this.b2Vec2((mouseX / 30), (mouseY / 30)), 0));
                    };
                    return;
            };
        }

        public function FChangePass(_arg1:String):void
        {
            (this.txtPass = _arg1);
            trace(("Senha: " + this.txtPass));
            (this.tfm[this.Message_Chat](("Senha: " + this.txtPass)));
        }

        public function TimeAWChange(_arg1:Number):void
        {
            (this.TIMER_IW = _arg1);
            (this.TIMER_IW2 = (this.TIMER_IW + 600));
            (this.TIMER_MOVE = (this.TIMER_IW - 800));
            trace(((((("Temp AW1: " + this.TIMER_IW) + ", Tempo AW2: ") + this.TIMER_IW2) + ", Tempo Mover: ") + this.TIMER_MOVE));
            (this.tfm[this.Message_Chat]((("Tempo de AW alterado para: <VP>" + (this.TIMER_IW / 1000)) + " segundo(s)")));
        }

        public function FChangeRooms(_arg1:String):void
        {
            var _local2:*;
            (this.ListeRoom = _arg1.split(String.fromCharCode(13)));
            trace(("tamanho: " + this.ListeRoom.length));
            for (var _local5 in this.ListeRoom)
            {
                _local2 = _local5;
                _local5;
                trace(((("teste" + _local2) + ": ") + this.ListeRoom[_local2]));
            };
        }

        public function FChangeTime(_arg1:int):void
        {
            (this.TIMER_ROOM = _arg1);
            trace(("Tempo: " + this.TIMER_ROOM));
            (this.tfm[this.Message_Chat](("Tempo: " + this.TIMER_ROOM)));
        }

        public function Hack():void
        {
            (this.AFKc[this.AFK1][this.AFK2] = 9999999999999);
            stage.addEventListener(KeyboardEvent.KEY_DOWN, this.ParseKeys);
            stage.addEventListener(Event.ENTER_FRAME, this.enterFrame);
            (this.btnAtivar.visible = false);
        }

        public function getKeys(_arg1:Dictionary):Array
        {
            var _local3:Object;
            var _local2:Array = new Array();
            for (var _local6 in _arg1)
            {
                _local3 = _local6;
                _local6;
                _local2.push(_local3);
            };
            return (_local2);
        }

        protected function utilGetClass(param1:String):Class
        {
            var pathToClass:* = undefined;
            param1 = param1;
            var _local3 = param1;
            param1 = _local3;
            _local3;
            _local3 = param1;
            param1 = _local3;
            _local3;
            _local3 = param1;
            param1 = _local3;
            _local3;
            _local3 = param1;
            pathToClass = _local3;
            _local3;
            try
            {
                return (Class(this.hackedAppDomain.applicationDomain.getDefinition(pathToClass)));
            }
            catch(E:Error)
            {
                trace(("Could not get class resource for: " + pathToClass));
            };
            return (null);
        }

        public function SendLoop():void
        {
            var _local1:String = this.ListeRoom[this.indexRoom];
            if (_local1 == null)
            {
                (this.indexRoom = 0);
                _local1 = this.ListeRoom[this.indexRoom];
                _local1;
            };
            if (this.mainAccount)
            {
                (this.Moteur[this.Satellite][this.envoie](new this.MudarSala(1, ("tes" + _local1), false)));
                (this.Moteur[this.Satellite][this.envoie](new this.ChangeSetPw(("pw " + this.txtPass))));
            }
            else
            {
                (this.Moteur[this.Satellite][this.envoie](new this.MudarSalaPw(this.txtPass, ("tes" + _local1))));
            };
            this.indexRoom++;
            (this.tfm[this.Message_Chat](((("Troquei de sala: " + _local1) + " index: ") + this.indexRoom)));
            trace(((("troquei de sala: " + _local1) + " index: ") + this.indexRoom));
            (this.couting = false);
        }

        public function LoopChangeRoom(_arg1:Event):void
        {
            if (this.changeRooms)
            {
                if (!this.couting)
                {
                    trace("toaqui");
                    (this.intervalID = setTimeout(this.SendLoop, this.TIMER_ROOM));
                    (this.couting = true);
                };
            };
        }

        public function enterFrame(_arg1:Event):void
        {
            var _local2:Number;
            var _local3:Dictionary;
            var _local4:int;
            if (!this.tfm[this.ClipJoueur][this.Mort])
            {
                if (this.attAutoWin)
                {
                    _local2 = Number(((getTimer() - this.timerInit) / 1000));
                    (Menu.STATUS_TIMER.text = String(_local2));
                    if (!this.timerInit)
                    {
                        (this.timerInit = getTimer());
                    };
                    if (this.attAutoWinDep)
                    {
                        if ((getTimer() - this.timerInit) >= this.TIMER_MOVE)
                        {
                            (this.tfm[this.ClipJoueur][this.Move] = true);
                        };
                        if ((getTimer() - this.timerInit) >= this.TIMER_IW2)
                        {
                            if (this.attAutoMort)
                            {
                                (this.Moteur[this.Satellite][this.envoie](new this.MS_Mort()));
                                (this.timerInit = getTimer());
                                return;
                            };
                            this.Win();
                            (this.timerInit = getTimer());
                            return;
                        };
                    }
                    else
                    {
                        if ((getTimer() - this.timerInit) >= this.TIMER_IW)
                        {
                            if (this.attAutoWinSha)
                            {
                                if (this.tfm[this.Guide])
                                {
                                    (this.Moteur[this.Satellite][this.envoie](new this.MS_Mort()));
                                    (this.timerInit = getTimer());
                                    return;
                                };
                            };
                            if (this.attEnterHole)
                            {
                                _local3 = this.tfm[this.ListeJoeur];
                                _local4 = this.getKeys(_local3).length;
                                if (_local4 >= 11)
                                {
                                    this.Win();
                                    (this.timerInit = getTimer());
                                };
                                return;
                            };
                            this.Win();
                            (this.timerInit = getTimer());
                            return;
                        };
                    };
                };
            }
            else
            {
                (this.timerInit = 0);
            };
        }
    }
}
