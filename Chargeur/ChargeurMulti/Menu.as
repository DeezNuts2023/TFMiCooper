package 
{
    import com.bit101.components.Window;
    import com.bit101.components.Label;
    import com.bit101.components.CheckBox;
    import com.bit101.components.Slider;
    import com.bit101.components.*;
    import ChargeurTransformice_fla.*;

    public class Menu extends Window 
    {

        public static var lbperc:Label;
        public static var lbseg:Label;

        public var cbvirargato:CheckBox;
        public var cbfly:CheckBox;
        public var cbspeed:CheckBox;
        public var cbic:CheckBox;
        public var cbteleport:CheckBox;
        public var cbexplosion:CheckBox;
        public var cbhideshow:CheckBox;
        public var cbimortal:CheckBox;
        public var cbbaff:CheckBox;
        public var cbnahora:CheckBox;
        public var cbasas:CheckBox;
        public var sldinter:Slider;
        public var cbborn:CheckBox;
        public var sldborn:Slider;

        public function Menu()
        {
            super(null, 450, 50, "Menu Hack");
            this.width = 320;
            this.height = 200;
            this.hasMinimizeButton = true;
            this.cbvirargato = new CheckBox(this, 170, 70, "Virar Gato [G]", function ()
            {
                MainTimeline.Instance.Ativando(0, cbvirargato.selected);
            });
            this.cbfly = new CheckBox(this, 20, 10, "Fly [W]", function ()
            {
                MainTimeline.Instance.Ativando(1, cbfly.selected);
            });
            this.cbspeed = new CheckBox(this, 20, 70, "Speed [A-D]", function ()
            {
                MainTimeline.Instance.Ativando(2, cbspeed.selected);
            });
            this.cbic = new CheckBox(this, 20, 90, "Instant Cheese [Z]", function ()
            {
                MainTimeline.Instance.Ativando(3, cbic.selected);
            });
            this.cbhideshow = new CheckBox(this, 20, 110, "Hide/Show Cheese [H]", function ()
            {
                MainTimeline.Instance.Ativando(9, cbhideshow.selected);
            });
            this.cbteleport = new CheckBox(this, 170, 90, "Teleport [Click]", function ()
            {
                MainTimeline.Instance.Ativando(6, cbteleport.selected);
                if (!cbteleport.selected)
                {
                    MainTimeline.Instance.indextp = 0;
                };
            });
            this.cbexplosion = new CheckBox(this, 20, 50, "Explosão [F]", function ()
            {
                MainTimeline.Instance.Ativando(7, cbexplosion.selected);
            });
            this.cbimortal = new CheckBox(this, 170, 30, "Rato Imortal", function ()
            {
                MainTimeline.Instance.Ativando(8, cbimortal.selected);
            });
            this.cbbaff = new CheckBox(this, 170, 10, "Baffbotffa [Q-E]", function ()
            {
                MainTimeline.Instance.Ativando(10, cbbaff.selected);
            });
            this.cbnahora = new CheckBox(this, 170, 50, "Instant Spawn", function ()
            {
                MainTimeline.Instance.Ativando(13, cbnahora.selected);
            });
            this.cbasas = new CheckBox(this, 20, 30, "Liberar Asas [V]", function ()
            {
                MainTimeline.Instance.Ativando(17, cbasas.selected);
            });
            this.sldinter = new Slider("horizontal", this, 170, 154, function ()
            {
                MainTimeline.Instance.Ativando(18, false, sldinter.value);
            });
            this.sldinter.setSliderParams(0, 100, 100);
            var label1:Label = new Label(this, 20, 150, "Opacidade da Interface");
            lbperc = new Label(this, 275, 150, "100%");
            this.cbborn = new CheckBox(this, 170, 110, "Born Period", function ()
            {
                MainTimeline.Instance.Ativando(19, cbborn.selected);
                if (cbborn.selected)
                {
                    sldborn.visible = true;
                    lbseg.visible = true;
                }
                else
                {
                    sldborn.visible = false;
                    lbseg.visible = false;
                };
            });
            this.sldborn = new Slider("horizontal", this, 170, 134, function ()
            {
                MainTimeline.Instance.Ativando(20, false, sldborn.value);
            });
            this.sldborn.setSliderParams(0, 3, 3);
            lbseg = new Label(this, 275, 130, "3 seg");
            this.sldborn.visible = false;
            lbseg.visible = false;
        }
    }
}