{
  ast = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04nc8x27hlzlrr5c2gn7mar4vdr0apw5xg22wp6m8dx3wqr04a0y";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.4.2";
  };
  benchmark = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jl71qcgamm96dzyqk695j24qszhcc7liw74qc83fpjljp2gh4hg";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.4.0";
  };
  erubi = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qnd6ff4az22ysnmni3730c41b979xinilahzg86bn7gv93ip9pw";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.13.0";
  };
  language_server-protocol = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gvb1j8xsqxms9mww01rmdl78zkd72zgxaap56bhv8j45z05hp1x";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.17.0.3";
  };
  logger = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gpg8gzi0xwymw4aaq2iafcbx31i3xzkg3fb30mdxn1d4qhc3dqa";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.6.0";
  };
  minitest = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jj629q3vw5yn90q4di4dyb87pil4a8qfm2srhgy5nc8j2n33v1i";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "5.24.1";
  };
  netrc = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gzfmcywp1da8nzfqsql2zqi648mfnx6qwkig3cv36n9m0yy676y";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.11.0";
  };
  parallel = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "145bn5q7ysnjj02jdf1x4nc1f0xxrv7ihgz9yr1j7sinmawqkq0j";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.25.1";
  };
  parser = {
    dependencies = ["ast" "racc"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10ly2wind06nylyqa5724ld2l0l46d3ag4fm04ifjgw7qdlpf94d";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.3.4.0";
  };
  prism = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fi7hvrm2wzbhm21d3w87z5nrqx6z0gwhilvdizcpc9ik21205mi";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.3.0";
  };
  racc = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0byn0c9nkahsl93y9ln5bysq4j31q8xkf2ws42swighxd4lnjzsa";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.8.1";
  };
  rake = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "17850wcwkgi30p7yqh60960ypn7yibacjjha0av78zaxwvd3ijs6";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "13.2.1";
  };
  rbi = {
    dependencies = ["prism" "rbs" "sorbet-runtime"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lcqpa52400yzjf1hk4yykzv7zjpi6c953j4x12jjlk5a4xfy2lj";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.3.0";
  };
  rbs = {
    dependencies = ["logger"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1fzk0a3d68fglnkwpaz07npi929y1kh2hh1j63y04943vvshyjmc";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.5.2";
  };
  rubocop-ast = {
    dependencies = ["parser"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "063qgvqbyv354icl2sgx758z22wzq38hd9skc3n96sbpv0cdc1qv";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.31.3";
  };
  ruby-lsp = {
    dependencies = ["language_server-protocol" "prism" "rbs" "sorbet-runtime"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1hx0hb0j0jpzizc76sjrmvgvwifr7507xap66wzg6mj3mqc0y46r";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.23.11";
  };
  sorbet = {
    dependencies = ["sorbet-static"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1af29bcxwmmkiir2anf91qznxg276qa8k38w1066y98qrk5q9znh";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.5.11919";
  };
  sorbet-runtime = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04j516m3aydazs0i5sxy5h3lglxszjd89qwfk00h0ccjgfl8snmg";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.5.11919";
  };
  sorbet-static = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = null;
    targets = [{
      remotes = ["https://rubygems.org"];
      sha256 = "0mj7dl2wj6ndg5fq1ddmfhggca97jf1384nsvhhj6nkr69sfjln5";
      target = "x86_64-linux";
      targetCPU = "x86_64";
      targetOS = "linux";
      type = "gem";
    }];
    version = "0.5.11919";
  };
  sorbet-static-and-runtime = {
    dependencies = ["sorbet" "sorbet-runtime"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qwi8345qglw7xm7baad8kr17kjbizyp9qvddsyyi1lyw9kkkb3d";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.5.11919";
  };
  spoom = {
    dependencies = ["erubi" "prism" "sorbet-static-and-runtime" "thor"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "06cfys05h58an26m5gxaac7mp1w8fwn0d786wipmqbb7gdhqjshy";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.4.2";
  };
  tapioca = {
    dependencies = ["benchmark" "netrc" "parallel" "rbi" "sorbet-static-and-runtime" "spoom" "thor" "yard-sorbet"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1xxi3rxvq40zpicsm9nmlijrpddcq9xza96dh24fy8i0bs53isxy";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.16.11";
  };
  thor = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vq1fjp45az9hfp6fxljhdrkv75cvbab1jfrwcw738pnsiqk8zps";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.3.1";
  };
  use-case = {
    groups = ["default"];
    platforms = [];
    source = {
      path = ".";
      type = "path";
    };
    targets = [];
    version = "0.1.0";
  };
  yard = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1r0b8w58p7gy06wph1qdjv2p087hfnmhd9jk23vjdj803dn761am";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.9.36";
  };
  yard-sorbet = {
    dependencies = ["sorbet-runtime" "yard"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08gy7xr94znrgsbd4f92hp8z9z097sm176lihsw8574y3d3aml83";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.9.0";
  };
}