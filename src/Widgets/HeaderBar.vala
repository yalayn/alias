public class MyApp.HeaderBar : Gtk.HeaderBar {
    public MyApp.Window main_window {get; construct;}

    public HeaderBar(MyApp.Window window){
        Object(main_window:window);
    }

    construct {
        //set set_title
        /* set_title("Alias"); */
        set_show_close_button(true);

        //add button
        var new_button = new Gtk.Button.with_label("New");
        new_button.get_style_context().add_class("suggested-action");
        new_button.valign = Gtk.Align.CENTER;
        new_button.clicked.connect(open_dialog);
        pack_start(new_button);

        //add icon button -> submenu (popup menu)
        var conf_button = new Gtk.Button.from_icon_name("open-menu-symbolic",Gtk.IconSize.MENU);
        conf_button.valign = Gtk.Align.CENTER;
        pack_end(conf_button);

        //add option in title
        var stack_switcher   = new Gtk.StackSwitcher();
        stack_switcher.stack = main_window.stack;
        set_custom_title(stack_switcher);
    }

    public void open_dialog(){
        var dialog = new Gtk.Dialog.with_buttons(
            "Add new alias",
            main_window,
            Gtk.DialogFlags.MODAL |
            Gtk.DialogFlags.DESTROY_WITH_PARENT,
            "Cancel","cancel_action",
            "Save","save_action",null
        );

        var label = new Gtk.Label("Content alias");
        var conten_area = dialog.get_content_area();
        conten_area.add(label);

        dialog.show_all();
        dialog.present();
    }
}
