{ pkgs, ... }:

with pkgs;
{
  packages = [
    editorconfig-core-c
    git
    readline
    watchman
  ];

  languages.ruby = {
    enable = true;
    bundler.enable = false;
    versionFile = ./.ruby-version;
  };

  enterShell = ''
    export PATH="$PATH:$(gem env home)/bin"

    bundle check || bundle install

    srb_path=$(bundle show sorbet-static)

    if [ ! -f $srb_path/.patched ]; then
      chmod 777 $srb_path/libexec/sorbet
      patchelf --set-interpreter ${glibc}/lib64/ld-linux-x86-64.so.2 $srb_path/libexec/sorbet
      touch $srb_path/.patched
    fi
  '';
}
