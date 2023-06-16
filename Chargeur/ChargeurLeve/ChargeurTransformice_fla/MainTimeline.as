package ChargeurTransformice_fla
{
    import flash.display.MovieClip;
    import flash.display.Loader;
    import flash.display.LoaderInfo;
    import com.bit101.components.PushButton;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.display.*;
    import flash.events.*;
    import com.bit101.components.*;
    import flash.text.*;
    import flash.utils.*;
    import flash.ui.*;
    import flash.system.*;
    import flash.net.*;

    public dynamic class MainTimeline extends MovieClip 
    {

        public static var instance:MainTimeline;

        public var _C:MovieClip;
        public var Charge:Number;
        public var Chargeur:Loader;
        public var P:Number;
        public var date:Date;
        public var LoadPlugin:Object;
        public var carregar:Object;
        private var tfm:Object;
        public var attLeve:Boolean = false;
        public var attPulo:Boolean = false;
        protected var hackedAppDomain:LoaderInfo;
        var Message_Chat = "TokMsg";
        var ClipJoueur = "TokClip";
        var Ppt1 = "Prot1";
        var Ppt2 = "Prot2";
        var Levec = "TokLevec";
        var Leve1 = "TokLeve1";
        var ProtLevec = "TokProtLevec";
        var ProtLeve1 = "TokProtLeve1";
        var Puloc = "TokPuloc";
        var Pulo1 = "TokPulo1";
        var Pulo2 = "TokPulo2";
        var btnAtivar:PushButton;

        public function MainTimeline()
        {
            instance = this;
            addFrameScript(0, this.frame1);
        }

        public function Chargement_Ok(_arg1:Event):void
        {
            this.Chargeur.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.Chargement_Ok);
            this.Chargeur.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, this.Chargement_EnCours);
            this.Charge = 0;
            removeChild(this._C);
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

        public function pluginInserido(event:Event):void
        {
            removeChild(this._C);
            this.tfm = event.target.content;
            this.hackedAppDomain = LoaderInfo(event.target);
            trace("tudo certo");
            this.tfm[this.Ppt1] = 8125;
            this.tfm[this.Ppt2] = "http://transformice.com/";
            this.Levec = this.utilGetClass(this.Levec);
            this.ProtLevec = this.utilGetClass(this.ProtLevec);
            this.Puloc = this.utilGetClass(this.Puloc);
            this.btnAtivar = new PushButton(stage, 580, 15, "Ativar Hacks", function ()
            {
                btnAtivar.visible = false;
                addChild(new Menu());
                stage.addEventListener(Event.ENTER_FRAME, enterFrame);
            });
        }

        public function LeveChange(_arg1:Number):void
        {
            levevalue = _arg1;
        }

        public function PuloChange(_arg1:Number):void
        {
            pulovalue = _arg1;
        }

        public function Ativando(_arg1:int, _arg2:Boolean):void
        {
            if (_arg1 == 1)
            {
                this.attLeve = _arg2;
            }
            else
            {
                if (_arg1 == 2)
                {
                    this.attPulo = _arg2;
                    if (!this.attPulo)
                    {
                        this.Puloc[this.Pulo1][this.Pulo2] = 1;
                    };
                };
            };
        }

        protected function utilGetClass(param1:String):Class
        {
            var pathToClass:* = undefined;
            param1 = param1;
            param1 = param1;
            param1 = param1;
            param1 = param1;
            pathToClass = param1;
            try
            {
                trace(("class: " + pathToClass));
                return (Class(this.hackedAppDomain.applicationDomain.getDefinition(pathToClass)));
            }
            catch(E:Error)
            {
                trace(("Could not get class resource for: " + pathToClass));
            };
            return (null);
        }

        public function enterFrame(_arg1:Event):void
        {
            if (this.attLeve)
            {
                this.ProtLevec[this.ProtLeve1] = false;
                var _local2 = this.Levec;
                (_local2[this.Leve1](this.tfm[this.ClipJoueur], levevalue));
            };
            if (this.attPulo)
            {
                this.Puloc[this.Pulo1][this.Pulo2] = pulovalue;
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
            this.Chargeur.contentLoaderInfo.addEventListener(Event.COMPLETE, this.pluginInserido);
            this.Chargeur.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.Chargement_EnCours);
            addChildAt(this.Chargeur, 0);
            this.date = new Date();
            this.Chargeur.load(new URLRequest("Transformice.swf"));
        }
    }
}