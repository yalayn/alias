public class MyApp.Window : Gtk.ApplicationWindow {

    public Window(Application app){
        Object( application:app );
    }

    construct {
        set_title("Alias");
        set_default_size (640, 400);
        set_position(Gtk.WindowPosition.CENTER);
        show_all();
    }
}
