package 
{
    import com.bit101.components.Window;
    import com.bit101.components.CheckBox;
    import com.bit101.components.Slider;
    import com.bit101.components.Label;
    import com.bit101.components.*;
    import ChargeurTransformice_fla.*;

    public class Menu extends Window 
    {

        public static var cbratoleve:CheckBox;
        public static var cbpuloalto:CheckBox;
        public static var sldleve:Slider;
        public static var sldpulo:Slider;

        public function Menu()
        {
            var label3:Label;
            var label6:Label;
            super(null, 400, 300, "Menu Hack");
            this.width = 350;
            this.height = 150;
            this.hasMinimizeButton = true;
            cbratoleve = new CheckBox(this, 45, 15, "Rato Leve", function ()
            {
                MainTimeline.instance.Ativando(1, cbratoleve.selected);
            });
            var label1:Label = new Label(this, 18, 46, "0");
            var label2:Label = new Label(this, 131, 46, "1");
            label3 = new Label(this, 70, 60, "0");
            sldleve = new Slider("horizontal", this, 30, 50, function ()
            {
                label3.text = sldleve.value;
                MainTimeline.instance.LeveChange(sldleve.value);
            });
            cbpuloalto = new CheckBox(this, 210, 15, "Pulo Alto", function ()
            {
                MainTimeline.instance.Ativando(2, cbpuloalto.selected);
            });
            var label4:Label = new Label(this, 183, 50, "1");
            var label5:Label = new Label(this, 296, 50, "1.5");
            label6 = new Label(this, 235, 60, "1");
            sldpulo = new Slider("horizontal", this, 195, 50, function ()
            {
                label6.text = sldpulo.value;
                MainTimeline.instance.PuloChange(sldpulo.value);
            });
            sldpulo.minimum = 1;
            sldpulo.maximum = 1.5;
            var label7:Label = new Label(this, 100, 100, "Feito Por iCooper™/Kira");
        }
    }
}