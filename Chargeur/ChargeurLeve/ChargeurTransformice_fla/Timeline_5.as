package ChargeurTransformice_fla
{
    import flash.display.MovieClip;
    import flash.display.*;

    public dynamic class Timeline_5 extends MovieClip 
    {

        public var Fromage:Boolean;

        public function Timeline_5()
        {
            addFrameScript(0, this.frame1);
        }

        function frame1()
        {
            this.Fromage = true;
        }
    }
}