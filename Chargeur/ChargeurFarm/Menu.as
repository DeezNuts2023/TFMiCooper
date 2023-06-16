package 
{
    import com.bit101.components.Window;
    import com.bit101.components.CheckBox;
    import com.bit101.components.PushButton;
    import com.bit101.components.InputText;
    import com.bit101.components.Text;
    import com.bit101.components.Label;
    import flash.net.URLLoader;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.Event;

    public class Menu extends Window 
    {
        public static var cbautowin:CheckBox;
        public static var cbtelewin:CheckBox;
        public static var cbteleport:CheckBox;
        public static var cbautowindep:CheckBox;
        public static var cbautowinsha:CheckBox;
        public static var cbautomort:CheckBox;
        public static var cbtelecheese:CheckBox;
        public static var cbtelehole:CheckBox;
        public static var cbenterhole:CheckBox;
        public static var cbchangeroom:CheckBox;
        public static var cbaccmain:CheckBox;
        public static var btnstart:PushButton;
        public static var inputawtime:InputText;
        public static var inputminuto:InputText;
        public static var inputpass:InputText;
        public static var txtrooms:Text;
        public static var running:Label;
        public static var STATUS_TIMER:Label;

        private var myLoader:URLLoader;
        private var myArray:Array;
        private var nCount:Number;
        private var myTimer:Timer;

        public function Menu()
        {
            this.myArray = new Array();
            super(null, 450, 50, "Menu Farm");
            this.width = 320;
            this.height = 190;
            this.hasMinimizeButton = true;
            cbautowin = new CheckBox(this, 10, 10, "AutoWin (First)", function ()
            {
                Chargeur.instance.Ativando(0, cbautowin.selected);
                cbautowindep.selected = false;
                cbautowinsha.selected = false;
                cbautomort.selected = false;
                if (cbautowin.selected)
                {
                };
            });
            cbautowindep = new CheckBox(this, 10, 30, "AutoWin (Depois do First)", function ()
            {
                Chargeur.instance.Ativando(1, cbautowindep.selected);
                cbautowin.selected = false;
                cbautowinsha.selected = false;
                cbautomort.selected = false;
                if (cbautowindep.selected)
                {
                };
            });
            cbautowinsha = new CheckBox(this, 10, 50, "AutoWin (Morrer se for Sha)", function ()
            {
                Chargeur.instance.Ativando(2, cbautowinsha.selected);
                cbautowin.selected = false;
                cbautowindep.selected = false;
                cbautomort.selected = false;
                if (cbautowinsha.selected)
                {
                };
            });
            cbautomort = new CheckBox(this, 10, 70, "Auto Mort", function ()
            {
                Chargeur.instance.Ativando(3, cbautomort.selected);
                cbautowin.selected = false;
                cbautowindep.selected = false;
                cbautowinsha.selected = false;
                if (cbautomort.selected)
                {
                };
            });
            cbenterhole = new CheckBox(this, 10, 90, "Entrar Acima de 11 ratos", function ()
            {
                Chargeur.instance.Ativando(4, cbenterhole.selected);
            });
            cbtelewin = new CheckBox(this, 200, 10, "TeleWin [X]", function ()
            {
                Chargeur.instance.Ativando(5, cbtelewin.selected);
            });
            cbteleport = new CheckBox(this, 200, 30, "Teleport [F]", function ()
            {
                Chargeur.instance.Ativando(6, cbteleport.selected);
            });
            cbtelecheese = new CheckBox(this, 200, 50, "TeleQueijo [O]", function ()
            {
                Chargeur.instance.Ativando(7, cbtelecheese.selected);
            });
            cbtelehole = new CheckBox(this, 200, 70, "TeleToca [P]", function ()
            {
                Chargeur.instance.Ativando(8, cbtelehole.selected);
            });
            var labeltime:Label = new Label(this, 10, 120, "Tempo do AW:");
            var labeltime2:Label = new Label(this, 210, 120, "segundos");
            inputawtime = new InputText(this, 100, 122, "5.0", function ()
            {
                Chargeur.instance.TimeAWChange((Number(inputawtime.text) * 1000));
            });
            STATUS_TIMER = new Label(this, 10, 140, "0", -1, 0x666666);
        }

        function countdown(_arg1:TimerEvent):void
        {
            this.nCount--;
            if (this.nCount == 0)
            {
                if (cbaccmain.selected)
                {
                    this.nCount = ((int(inputminuto.text) * 60000) - 10000);
                    this.nCount = (this.nCount / 1000);
                    this.myTimer = new Timer(1000, this.nCount);
                    this.myTimer.start();
                    this.myTimer.addEventListener(TimerEvent.TIMER, this.countdown);
                }
                else
                {
                    this.nCount = (int(inputminuto.text) * 60000);
                    this.nCount = (this.nCount / 1000);
                    this.myTimer = new Timer(1000, this.nCount);
                    this.myTimer.start();
                    this.myTimer.addEventListener(TimerEvent.TIMER, this.countdown);
                };
            };
            running.text = ("Tempo: " + this.nCount.toString());
        }

        private function loadComplete(_arg1:Event):void
        {
            var _local2:String = this.myLoader.data;
            txtrooms.text = _local2;
        }
    }
}