{
  ast = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10yknjyn0728gjn6b5syynvrvrwm66bhssbxq8mkhshxghaiailm";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.4.3";
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
      sha256 = "1naaxsqkv5b3vklab5sbb9sdpszrjzlfsbqpy7ncbnw510xi10m0";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.13.1";
  };
  language_server-protocol = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1k0311vah76kg5m6zr7wmkwyk5p2f9d9hyckjpn3xgr83ajkj7px";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.17.0.5";
  };
  logger = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00q2zznygpbls8asz5knjvvj2brr3ghmqxgr83xnrdj4rk3xwvhr";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.7.0";
  };
  minitest = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0mn7q9yzrwinvfvkyjiz548a4rmcwbmz2fn9nyzh4j1snin6q6rr";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "5.25.5";
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
      sha256 = "0c719bfgcszqvk9z47w2p8j2wkz5y35k48ywwas5yxbbh3hm3haa";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.27.0";
  };
  parser = {
    dependencies = ["ast" "racc"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0i9w8msil4snx5w11ix9b0wf52vjc3r49khy3ddgl1xk890kcxi4";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.3.8.0";
  };
  prism = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gkhpdjib9zi9i27vd9djrxiwjia03cijmd6q8yj2q1ix403w3nw";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.4.0";
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
      sha256 = "0f0l9g63c3q8qc7w0v5z5778w0f4dlni1w74g9qncj0kzprrkkbh";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.3.3";
  };
  rbs = {
    dependencies = ["logger" "prism"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12q5vpqjz8gy5k1my9gyr7avbf67rl2hnariijhy4l147nh2p8m4";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "4.0.0.dev.4";
  };
  require-hooks = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0c8gr7b74qsykgkdjlwsnhbbpa6nw08h94g8n46a17363av83ypg";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.2.2";
  };
  rexml = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jmbf6lf7pcyacpb939xjjpn1f84c3nw83dy3p1lwjx0l2ljfif7";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.4.1";
  };
  rubocop-ast = {
    dependencies = ["parser" "prism"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14lf3d9bdr8cv8x3xcn3ijql5x23svk5zy7mdinlzw1f7ch09k73";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.44.1";
  };
  ruby-lsp = {
    dependencies = ["language_server-protocol" "prism" "rbs" "sorbet-runtime"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1q4vp4qw8rrl8fmybvqdj74jmwi0af5c4bnxl38k0ndp2qnjwkqn";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.23.21";
  };
  sorbet = {
    dependencies = ["sorbet-static"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1gf2j53blr8zgw4x4jsl2fg8zc6pin694sv0d0gr32jp81g9rs6h";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.5.12123";
  };
  sorbet-runtime = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1y23ikbll8x40hg4iwhdm8rf0lq6a9lfyx3b5c7r7pc8z451a11p";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.5.12123";
  };
  sorbet-static = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = null;
    targets = [{
      remotes = ["https://rubygems.org"];
      sha256 = "0dpd3wc3ad8nha8imzfw8h2s13k28ijs6iyvydb3i2mpx7djmkzb";
      target = "x86_64-linux";
      targetCPU = "x86_64";
      targetOS = "linux";
      type = "gem";
    }];
    version = "0.5.12123";
  };
  sorbet-static-and-runtime = {
    dependencies = ["sorbet" "sorbet-runtime"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yivk54f43slvdkmhw0amgiljx6wsazqgzvxp93p2d52cq4krzas";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.5.12123";
  };
  spoom = {
    dependencies = ["erubi" "prism" "rbi" "rbs" "rexml" "sorbet-static-and-runtime" "thor"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0s9wm7iyhcn0srvfnf5ca57bl4cbsx1fpbnwjk2i323y2qf4k571";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.7.0";
  };
  tapioca = {
    dependencies = ["benchmark" "netrc" "parallel" "rbi" "require-hooks" "sorbet-static-and-runtime" "spoom" "thor" "yard-sorbet"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bqsj0088ibr6kcxmdlhnmp1s5643giqd85vklfksssb9jf5l0gh";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.17.0";
  };
  thor = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1nmymd86a0vb39pzj2cwv57avdrl6pl3lf5bsz58q594kqxjkw7f";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.3.2";
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
      sha256 = "14k9lb9a60r9z2zcqg08by9iljrrgjxdkbd91gw17rkqkqwi1sd6";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.9.37";
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