public class MyApp.Window : Gtk.ApplicationWindow {

    private GLib.Settings settings;

    public Window(Application app){
        Object( application:app );
    }

    construct {
        /* set_title("Alias"); */
        set_default_size (640, 400);
        set_position(Gtk.WindowPosition.CENTER);
        settings = new GLib.Settings("com.github.yalayn.alias");

        move(settings.get_int("pos-x"),settings.get_int("pos-y"));
        resize(settings.get_int("window-width"),settings.get_int("window-height"));
        delete_event.connect(e => {
            return before_destroy();
        });

        var headerbar = new MyApp.HeaderBar();
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
