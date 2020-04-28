public class MyApp.HeaderBar : Gtk.HeaderBar {
    construct {
        //set set_title
        set_title("Alias");
        set_show_close_button(true);

        //add button
        var new_button = new Gtk.Button.with_label("New");
        new_button.get_style_context().add_class("suggested-action");
        new_button.valign = Gtk.Align.CENTER;
        pack_start(new_button);

        //add icon button -> submenu (popup menu)
        var conf_button = new Gtk.Button.from_icon_name("open-menu-symbolic",Gtk.IconSize.MENU);
        conf_button.valign = Gtk.Align.CENTER;
        pack_end(conf_button);
    }
}
