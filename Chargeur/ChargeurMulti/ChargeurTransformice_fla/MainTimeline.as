package ChargeurTransformice_fla
{
    import flash.display.MovieClip;
    import flash.display.Loader;
    import flash.display.LoaderInfo;
    import com.bit101.components.PushButton;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.events.MouseEvent;
    import flash.events.KeyboardEvent;
    import flash.utils.ByteArray;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.text.*;
    import com.bit101.components.*;
    import flash.ui.*;
    import flash.system.*;
    import flash.net.*;

    public class MainTimeline extends MovieClip 
    {

        public static var Instance:MainTimeline;

        public var _C:MovieClip;
        public var Charge:Number;
        public var Chargeur:Loader;
        public var P:Number;
        protected var LoaderInfoDomain:LoaderInfo;
        public var tfm:Object;
        private var attVirarGato:Boolean = false;
        private var attFly:Boolean = false;
        private var attSpeed:Boolean = false;
        private var attIC:Boolean = false;
        private var attTeleport:Boolean = false;
        private var attExplosion:Boolean = false;
        private var attHide:Boolean = false;
        private var attBaff:Boolean = false;
        private var attNaHora:Boolean = false;
        private var attAsas:Boolean = false;
        private var attBornPeriod:Boolean = false;
        public var indextp:int = 0;
        public var timerInit:uint = 0;
        public var TIMER_BORN:Number = 3000;
        var Message_Chat = "TokMsg";
        var ClipJoueur = "TokClip";
        var Grosse = "TokGrosse";
        var LsClass = "TokLsClass";
        var LsInstance = "TokLsInstance";
        var ClipFromage = "TokFromage";
        var CodeEnPart = "TokCodeEnPart";
        var VirarGato = "TokGato";
        var Mort = "TokMort";
        var Moteur = "TokMoteur";
        var Satellite = "TokSatellite";
        var envoie = "TokEnvoie";
        var GetRecive = "TokGetRecive";
        var Recive = "TokRecive";
        var TempsPartie = "TokTempsPartie";
        var Limite = "TokLimite";
        var GetCreat = "TokGetCreat";
        var Creation_Objet = "TokCreation";
        var GetGuide = "TokGetGuide";
        var PropGuide = "TokPropGuide";
        var Guide = "TokGuide";
        var GetSha = "TokGetSha";
        var PropSha = "TokPropSha";
        var TempsInvoc = "TokTempsInvoc";
        var LiberarAsa = "TokLiberarAsa";
        var NovaAsa = "TokNovaAsa";
        var GetContagemSeg = "TokGetContagem";
        var ContagemSeg = "TokContagem";
        var GetFreeMove = "TokGetFreeMove";
        var FreeMove = "TokFreeMove";
        var loaderBytes = "TokBytes";
        var loaderUrl = "TokURL";
        var btnAtivar:PushButton;

        public function MainTimeline()
        {
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
            this.LsClass = this.PegarClass(this.LsClass);
            this.Moteur = this.PegarClass(this.Moteur);
            this.TempsPartie = this.PegarClass(this.TempsPartie);
            this.GetCreat = this.PegarClass(this.GetCreat);
            this.GetGuide = this.PegarClass(this.GetGuide);
            this.GetSha = this.PegarClass(this.GetSha);
            this.NovaAsa = this.PegarClass(this.NovaAsa);
            this.GetContagemSeg = this.PegarClass(this.GetContagemSeg);
            this.GetFreeMove = this.PegarClass(this.GetFreeMove);
            this.GetRecive = this.PegarClass(this.GetRecive);
            this.tfm[this.loaderBytes] = 8125;
            this.tfm[this.loaderUrl] = "http://transformice.com/";
            trace("Carregado");
            this.btnAtivar = new PushButton(stage, 580, 3, "Abrir Menu", function ()
            {
                addChild(new Menu());
                stage.addEventListener(KeyboardEvent.KEY_DOWN, HackKeys);
                stage.addEventListener(Event.ENTER_FRAME, enterFrame);
                stage.addEventListener(MouseEvent.CLICK, Teleport);
                btnAtivar.visible = false;
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
            var _local4:MovieClip;
            if (_arg1 == 0)
            {
                this.attVirarGato = _arg2;
                trace(("Virar Gato: " + _arg2));
            }
            else
            {
                if (_arg1 == 1)
                {
                    this.attFly = _arg2;
                    trace(("Fly: " + _arg2));
                }
                else
                {
                    if (_arg1 == 2)
                    {
                        this.attSpeed = _arg2;
                        trace(("Speed: " + _arg2));
                    }
                    else
                    {
                        if (_arg1 == 3)
                        {
                            this.attIC = _arg2;
                            trace(("IC: " + _arg2));
                        }
                        else
                        {
                            if (_arg1 == 6)
                            {
                                this.attTeleport = _arg2;
                                trace(("Teleport: " + _arg2));
                            }
                            else
                            {
                                if (_arg1 == 7)
                                {
                                    this.attExplosion = _arg2;
                                    trace(("Explosion: " + _arg2));
                                }
                                else
                                {
                                    if (_arg1 == 8)
                                    {
                                        if (_arg2)
                                        {
                                            this.TempsPartie[this.Limite] = 0x3B9ACA00;
                                        }
                                        else
                                        {
                                            this.TempsPartie[this.Limite] = 400;
                                        };
                                        trace(("RatoImortal: " + _arg2));
                                    }
                                    else
                                    {
                                        if (_arg1 == 9)
                                        {
                                            this.attHide = _arg2;
                                            trace(("Hide: " + _arg2));
                                        }
                                        else
                                        {
                                            if (_arg1 == 10)
                                            {
                                                this.attBaff = _arg2;
                                                trace(("Baff: " + _arg2));
                                            }
                                            else
                                            {
                                                if (_arg1 == 13)
                                                {
                                                    this.attNaHora = _arg2;
                                                    trace(("NaHora: " + _arg2));
                                                }
                                                else
                                                {
                                                    if (_arg1 == 17)
                                                    {
                                                        this.attAsas = _arg2;
                                                        trace(("Asas: " + _arg2));
                                                    }
                                                    else
                                                    {
                                                        if (_arg1 == 18)
                                                        {
                                                            _local4 = this.tfm["_I"];
                                                            _local4.alpha = (_arg3 / 100);
                                                            trace(("Interface: " + (_arg3 / 100)));
                                                            Menu.lbperc.text = (_arg3 + "%");
                                                        }
                                                        else
                                                        {
                                                            if (_arg1 == 19)
                                                            {
                                                                this.attBornPeriod = _arg2;
                                                                trace(("Born: " + _arg2));
                                                            }
                                                            else
                                                            {
                                                                if (_arg1 == 20)
                                                                {
                                                                    Menu.lbseg.text = (_arg3 + " seg");
                                                                    this.TIMER_BORN = (_arg3 * 1000);
                                                                    trace(this.TIMER_BORN);
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
                    };
                };
            };
        }

        function Teleport(_arg1:MouseEvent):void
        {
            if (this.attTeleport)
            {
                this.indextp = (this.indextp + 1);
                if (this.indextp > 1)
                {
                    this.SetPlayerPosition(mouseX, mouseY);
                };
            };
        }

        public function MsgChat(_arg1:String):void
        {
            var _local2 = this.tfm;
            (_local2[this.Message_Chat](_arg1));
        }

        private function HackKeys(_arg1:KeyboardEvent):void
        {
            switch (_arg1.keyCode)
            {
                case Keyboard.G:
                    if (this.attVirarGato)
                    {
                        var _local2 = this.tfm[this.ClipJoueur];
                        (_local2[this.VirarGato](true));
                    };
                    return;
                case Keyboard.W:
                    if (this.attFly)
                    {
                        this.MovePlayer(0, -50, false);
                    };
                    return;
                case Keyboard.A:
                    if (this.attSpeed)
                    {
                        this.MovePlayer(-60, 0, false);
                    };
                    return;
                case Keyboard.D:
                    if (this.attSpeed)
                    {
                        this.MovePlayer(60, 0, false);
                    };
                    return;
                case Keyboard.Z:
                    if (this.attIC)
                    {
                        this.InstantChesse();
                    };
                    return;
                case Keyboard.F:
                    if (this.attExplosion)
                    {
                        this.SendOldPacket(5, 17, stage.mouseX, stage.mouseY, 20, 100, "0", 10);
                    };
                    return;
                case Keyboard.Q:
                    if (this.attBaff)
                    {
                        this.GetGuide[this.PropGuide][this.Guide] = true;
                        _local2 = this.GetCreat;
                        (_local2[this.Creation_Objet](17, (this.tfm[this.ClipJoueur].x + 5), (this.tfm[this.ClipJoueur].y + 10), 270));
                    };
                    return;
                case Keyboard.E:
                    if (this.attBaff)
                    {
                        this.GetGuide[this.PropGuide][this.Guide] = true;
                        _local2 = this.GetCreat;
                        (_local2[this.Creation_Objet](17, (this.tfm[this.ClipJoueur].x - 5), (this.tfm[this.ClipJoueur].y + 10), 90));
                    };
                    return;
                case Keyboard.V:
                    if (this.attAsas)
                    {
                        this.GetGuide[this.PropGuide][this.LiberarAsa] = new this.NovaAsa(this.tfm[this.ClipJoueur]);
                        this.GetGuide[this.PropGuide][this.Guide] = true;
                    };
                    return;
                case Keyboard.H:
                    if (this.attHide)
                    {
                        if (this.tfm[this.ClipJoueur][this.Grosse])
                        {
                            this.tfm[this.ClipJoueur][this.Grosse] = false;
                        }
                        else
                        {
                            this.tfm[this.ClipJoueur][this.Grosse] = true;
                        };
                    };
                    return;
            };
        }

        function InstantChesse():void
        {
            var _local1:ByteArray = new ByteArray();
            _local1.writeInt(this.tfm[this.CodeEnPart]);
            _local1.writeShort(this.LsClass[this.LsInstance][this.ClipFromage].x);
            _local1.writeShort(this.LsClass[this.LsInstance][this.ClipFromage].y);
            _local1.writeShort(0);
            this.SendPacket(5, 19, _local1);
        }

        function ApplyMovePlayer(_arg1:int, _arg2:int, _arg3:Boolean, _arg4:int, _arg5:int, _arg6:Boolean):void
        {
            var _local7:* = new ByteArray();
            _local7.writeShort(_arg1);
            _local7.writeShort(_arg2);
            _local7.writeBoolean(_arg3);
            _local7.writeShort(_arg4);
            _local7.writeShort(_arg5);
            _local7.writeBoolean(_arg6);
            this.ParsePacket(8, 3, _local7);
        }

        private function MovePlayer(_arg1:int, _arg2:int, _arg3:Boolean):void
        {
            this.ApplyMovePlayer(0, 0, false, _arg1, _arg2, _arg3);
        }

        private function SetPlayerPosition(_arg1:Number, _arg2:Number):void
        {
            this.ApplyMovePlayer(_arg1, _arg2, false, 0, 0, false);
        }

        function ParsePacket(_arg1:int, _arg2:int, _arg3:ByteArray):void
        {
            var _local4:* = new ByteArray();
            _local4.writeByte(_arg1);
            _local4.writeByte(_arg2);
            _local4.writeBytes(_arg3);
            var _local5 = this.GetRecive;
            (_local5[this.Recive](_local4));
        }

        function SendOldPacket(_arg1:int, _arg2:int, ... _args):void
        {
            var _local5:String;
            var _local6:ByteArray;
            var _local4:ByteArray = new ByteArray();
            _local4.writeByte(_arg1);
            _local4.writeByte(_arg2);
            for each (_local5 in _args)
            {
                _local4.writeByte(1);
                _local4.writeUTFBytes(_local5);
            };
            _local6 = new ByteArray();
            _local6.writeShort(_local4.length);
            _local6.writeBytes(_local4, 0, _local4.length);
            this.SendPacket(1, 1, _local6);
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
            if (((this.tfm[this.ClipJoueur]) && (!(this.tfm[this.ClipJoueur][this.Mort]))))
            {
                if (this.attBornPeriod)
                {
                    if (!this.timerInit)
                    {
                        this.timerInit = getTimer();
                    };
                    if (this.GetContagemSeg[this.ContagemSeg])
                    {
                        if ((getTimer() - this.timerInit) >= this.TIMER_BORN)
                        {
                            this.GetContagemSeg[this.ContagemSeg] = false;
                            this.GetFreeMove[this.FreeMove] = true;
                            this.timerInit = getTimer();
                            return;
                        };
                    };
                };
            }
            else
            {
                this.timerInit = 0;
            };
            if (this.attNaHora)
            {
                this.GetSha[this.PropSha][this.TempsInvoc] = 0;
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