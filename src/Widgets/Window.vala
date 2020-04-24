public class MyApp.Window : Gtk.ApplicationWindow {

    public Window(Application app){
        Object( application:app );
    }

    construct {
        set_title("Alias");
        set_default_size (640, 400);
        set_position(Gtk.WindowPosition.CENTER);

        var settings = new GLib.Settings("com.github.yalayn.alias");

        move(settings.get_int("pos-x"),settings.get_int("pos-y"));
        resize(settings.get_int("window-width"),settings.get_int("window-height"));

        show_all();
    }
}
