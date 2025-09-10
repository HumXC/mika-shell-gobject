{
  lib,
  mkShell,
  gtk4,
  webkitgtk_6_0,
  glib,
  gobject-introspection,
  gdk-pixbuf,
  graphene,
  pango,
  harfbuzz,
  libsoup_3,
  libxslt,
  zig,
  ...
}: let
  gir_dir = lib.makeSearchPathOutput "share/gir-1.0" "share/gir-1.0" [
    gtk4.dev
    glib.dev
    webkitgtk_6_0.dev
    gdk-pixbuf.dev
    graphene.dev
    pango.dev
    gobject-introspection.dev
    harfbuzz.dev
    libsoup_3.dev
  ];
in
  mkShell {
    buildInputs = [libxslt zig];
    GIR_DIR = gir_dir;
  }
