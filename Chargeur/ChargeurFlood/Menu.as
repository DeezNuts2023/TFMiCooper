package 
{
    import com.bit101.components.Window;
    import com.bit101.components.Label;
    import com.bit101.components.PushButton;
    import com.bit101.components.CheckBox;
    import com.bit101.components.TextArea;
    import com.bit101.components.Panel;
    import flash.events.*;
    import com.bit101.components.*;
    import ChargeurTransformice_fla.*;

    public class Menu extends Window 
    {

        public static var lbtempo:Label;
        public static var btnstart:PushButton;

        public var cbmsgnormal:CheckBox;
        public var cbmsgprive:CheckBox;
        public var cbsalanormal:CheckBox;
        public var cbsalaboot:CheckBox;
        public var cbsalaracing:CheckBox;
        public var cbsalavanilla:CheckBox;
        public var cbsalasurvivor:CheckBox;
        public var cbsalavillage:CheckBox;
        public var cbsalamodule:CheckBox;
        public var cbsaladefilante:CheckBox;
        public var txtmsg:TextArea;

        public function Menu()
        {
            super(null, 450, 50, "Menu Hack");
            this.width = 320;
            this.height = 280;
            this.hasMinimizeButton = true;
            this.cbmsgnormal = new CheckBox(this, 20, 10, "Mensagem Normal", function ()
            {
                cbmsgnormal.selected = true;
                MainTimeline.Instance.Ativando(0, cbmsgnormal.selected);
                if (cbmsgnormal.selected)
                {
                    cbmsgprive.selected = false;
                    MainTimeline.Instance.Ativando(1, false);
                };
            });
            this.cbmsgnormal.selected = true;
            this.cbmsgprive = new CheckBox(this, 170, 10, "Mensagem Privada", function ()
            {
                cbmsgprive.selected = true;
                MainTimeline.Instance.Ativando(1, cbmsgprive.selected);
                if (cbmsgprive.selected)
                {
                    cbmsgnormal.selected = false;
                    MainTimeline.Instance.Ativando(0, false);
                };
            });
            var panel:Panel = new Panel(this, 20, 100);
            var labeltempo:Label = new Label(this, 20, 225, "Tempo de Loop:");
            lbtempo = new Label(this, 120, 225, "0");
            this.txtmsg = new TextArea(this, 20, 30, "Mensagem", 0, 2);
            this.txtmsg.width = 280;
            this.txtmsg.height = 70;
            this.txtmsg.setStylesheet(Style.setStyle(Style.TRANSFORMICE));
            this.txtmsg.addEventListener(Event.CHANGE, function ()
            {
                MainTimeline.Instance.ChangeMsgTxt(txtmsg.text);
            });
            var margin1:Label = new Label(this, 20, 17, "_______________________________________");
            var margin2:Label = new Label(this, 20, 86, "_______________________________________");
            var margin3:Label = new Label(this, 18, 27, "|");
            var margin4:Label = new Label(this, 18, 38, "|");
            var margin5:Label = new Label(this, 18, 49, "|");
            var margin6:Label = new Label(this, 18, 60, "|");
            var margin7:Label = new Label(this, 18, 71, "|");
            var margin8:Label = new Label(this, 18, 82, "|");
            var margin9:Label = new Label(this, 18, 86, "|");
            var lbtype:Label = new Label(this, 20, 110, "Tipos de Sala:");
            this.cbsalanormal = new CheckBox(this, 40, 130, "Normal", function ()
            {
                MainTimeline.Instance.Ativando(3, cbsalanormal.selected, 1);
            });
            this.cbsalanormal.selected = true;
            this.cbsalaboot = new CheckBox(this, 40, 150, "Bootcamp", function ()
            {
                MainTimeline.Instance.Ativando(3, cbsalaboot.selected, 2);
            });
            this.cbsalaracing = new CheckBox(this, 40, 170, "Racing", function ()
            {
                MainTimeline.Instance.Ativando(3, cbsalaracing.selected, 9);
            });
            this.cbsalavanilla = new CheckBox(this, 40, 190, "Vanilla", function ()
            {
                MainTimeline.Instance.Ativando(3, cbsalavanilla.selected, 3);
            });
            this.cbsaladefilante = new CheckBox(this, 160, 130, "Defilante", function ()
            {
                MainTimeline.Instance.Ativando(3, cbsaladefilante.selected, 10);
            });
            this.cbsalasurvivor = new CheckBox(this, 160, 150, "Survivor", function ()
            {
                MainTimeline.Instance.Ativando(3, cbsalasurvivor.selected, 8);
            });
            this.cbsalavillage = new CheckBox(this, 160, 170, "Village", function ()
            {
                MainTimeline.Instance.Ativando(3, cbsalavillage.selected, 16);
            });
            this.cbsalamodule = new CheckBox(this, 160, 190, "Module", function ()
            {
                MainTimeline.Instance.Ativando(3, cbsalamodule.selected, 18);
            });
            btnstart = new PushButton(this, 190, 225, "Iniciar", function ()
            {
                if (btnstart.label == "Iniciar")
                {
                    MainTimeline.Instance.Ativando(2, true);
                    btnstart.label = "Parar";
                }
                else
                {
                    if (btnstart.label == "Parar")
                    {
                        MainTimeline.Instance.Ativando(2, false);
                        btnstart.label = "Iniciar";
                    };
                };
            });
        }
    }
}/