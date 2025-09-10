{
  lib,
  pkgs,
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
  zig = pkgs.zig_0_15;
in
  mkShell {
    buildInputs = [libxslt zig];
    GIR_DIR = gir_dir;
  }
