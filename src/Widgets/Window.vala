public class MyApp.Window : Gtk.ApplicationWindow {

    private GLib.Settings settings;
    public Gtk.Stack stack {get; set;}

    public Window(Application app){
        Object( application:app );
    }

    construct {
        //Set defult params
        set_default_size(640, 400);
        set_position(Gtk.WindowPosition.CENTER);

        //Set last params of gsettings
        settings = new GLib.Settings("com.github.yalayn.alias");
        move(settings.get_int("pos-x"),settings.get_int("pos-y"));
        resize(settings.get_int("window-width"),settings.get_int("window-height"));

        //Event close, save gsettings before destroy
        delete_event.connect(e => { return before_destroy(); });

        //Create stack
        stack            = new Gtk.Stack();
        var alias_system = new Gtk.Grid();
        var alias_self   = new Gtk.Grid();

        alias_system.add( new Gtk.Label("System"));
        alias_self.add( new Gtk.Label("Self"));

        stack.expand = true;
        stack.add_titled(alias_system,"alias_system","System");
        stack.add_titled(alias_self,"alias_self","Self");

        add(stack);

        //Create headerbar
        var headerbar = new MyApp.HeaderBar(this);
        set_titlebar(headerbar);

        show_all();
    }

    public bool before_destroy(){
        int x, y, width, height;
        get_position(out x, out y);
        get_size(out width,out height);
        settings.set_int("pos-x",x);
        settings.set_int("pos-y",y);
        settings.set_int("window-width",width);
        settings.set_int("window-height",height);
        return false;
    }
}
