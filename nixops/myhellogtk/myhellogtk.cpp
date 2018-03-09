#include <gtkmm.h>
int main(int argc, char ** argv) {
  Gtk::Main kit(argc, argv);
  Gtk::Window window;
  Gtk::Label label(" Hello ! ");
  window.add(label);
  window.show_all();
  kit.run(window);
  return 0;
}
