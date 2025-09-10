{
  benchmark = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1kicilpma5l0lwayqjb5577bm0hbjndj2gh150xz09xsgc1l1vyl";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.4.1";
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
  rake = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14s4jdcs1a4saam9qmzbsa2bsh85rj9zfxny5z315x3gg0nhkxcn";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "13.3.0";
  };
  rbi = {
    dependencies = ["prism" "rbs"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ymmna0pqbzkpbwx5853x4i2mwwvbxnc0qnxjhvwimr3s7fr8zjp";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.3.6";
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
      sha256 = "05d1jpx35kd1z5yf3vlkq2gsjv57aw7vrim056g9f0kzvl14cahf";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.4.3";
  };
  ruby-lsp = {
    dependencies = ["language_server-protocol" "prism" "rbs"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "050qg73g4qs3xza441nafy7610daa3k4ra0pbi3sdlawy9fwfh6i";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.26.1";
  };
  sorbet = {
    dependencies = ["sorbet-static"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1chk14cw28p3hxcn82m9if6p09pkl60ll64n90535m7hixsp2zpb";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.6.12501";
  };
  sorbet-runtime = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ixw7fvbpkb697pr9yy1jjnxjd67gbwx9m437f48n3g4v662j18a";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.6.12501";
  };
  sorbet-static = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = null;
    targets = [{
      remotes = ["https://rubygems.org"];
      sha256 = "08w1cw7pdr29yq960bg9fmhrnhkv7f1qh8mn2zc1jyhiq4987gws";
      target = "x86_64-linux";
      targetCPU = "x86_64";
      targetOS = "linux";
      type = "gem";
    }];
    version = "0.6.12501";
  };
  sorbet-static-and-runtime = {
    dependencies = ["sorbet" "sorbet-runtime"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ncc7q3hahpw7rgrzg1frj3qs1zzfr06508sncnfzigj56ij25ky";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.6.12501";
  };
  spoom = {
    dependencies = ["erubi" "prism" "rbi" "rbs" "rexml" "sorbet-static-and-runtime" "thor"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1c50mwakxka1wv402m6wg7bxi46br966930lbqdy5hn7fy4s7l9j";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.7.6";
  };
  tapioca = {
    dependencies = ["benchmark" "netrc" "parallel" "rbi" "require-hooks" "sorbet-static-and-runtime" "spoom" "thor" "yard-sorbet"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "16xspw74wsb00ynabqsksvgvv6456ccx8zn94g7sjsgj0kh7pyqy";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.17.7";
  };
  thor = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gcarlmpfbmqnjvwfz44gdjhcmm634di7plcx2zdgwdhrhifhqw7";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.4.0";
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