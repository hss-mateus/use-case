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
      sha256 = "05j9bcxdz6wfnrjn32zvdwj1qsbp88mwx3rv7g256gziya6avc2r";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.30.0";
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
    dependencies = ["prism" "sorbet-runtime"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wy7vzsnn3xfwnp4x7fh6df0wg1vc98ncw8s29mdqiyfbkca72cq";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.1.14";
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
      sha256 = "1jiz0mzdvhkp9bj1yzpx7ykwb363n2mx5y204l8ksphqn403m528";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.17.11";
  };
  sorbet = {
    dependencies = ["sorbet-static"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "084mk27s9vr3vzfqv2w4cqlwzx7slfnwj9mv0n1qyrqc4hx1qjdg";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.5.11504";
  };
  sorbet-runtime = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hkqlckzmcww4ig3ws9cng91zffavj08gd6rmfbbaf9bw0yfzdra";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.5.11504";
  };
  sorbet-static = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = null;
    targets = [{
      remotes = ["https://rubygems.org"];
      sha256 = "0m9677yk8iry8lq0pwg3cwy9ayzh93fw27v6snzrxlhx0c0h7x9f";
      target = "x86_64-linux";
      targetCPU = "x86_64";
      targetOS = "linux";
      type = "gem";
    }];
    version = "0.5.11504";
  };
  sorbet-static-and-runtime = {
    dependencies = ["sorbet" "sorbet-runtime"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qn6flsacgydcwl7jvig9afqbaslsfizn9s19jxpizf4q0asg1vz";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.5.11504";
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
    dependencies = ["netrc" "parallel" "rbi" "sorbet-static-and-runtime" "spoom" "thor" "yard-sorbet"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10ysfx2nszksrvfr59ysmk7dkv9kakdb7c6fcq33grk9jlkygkzl";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.15.1";
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