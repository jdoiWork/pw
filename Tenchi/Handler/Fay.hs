module Handler.Fay where

import Import
import Yesod.Fay
import Fay.Convert (readFromFay)

fibs :: [Int]
fibs = 0 : 1 : zipWith (+) fibs (drop 1 fibs)

tisikiItems = 
  [ TisikiItem
        "Creative Web Typography Styles | Codrops"
        "http://tympanus.net/codrops/2012/09/12/creative-web-typography-styles/"
        ["css"]
  , TisikiItem
        "ベーシックで高品質で完全にフリーな日本語フォント - yayuguのにっき"
        "http://d.hatena.ne.jp/yayugu/touch/20100925/1285441247"
        ["font"]
  , TisikiItem
        "Destroy All Software Screencasts"
        "https://www.destroyallsoftware.com/screencasts"
        ["ruby", "tdd", "rails", "unix", "vim"]
  , TisikiItem
        "2014年春版：初心者にお薦めする「本当にゼロから統計学と機械学習の基礎を学ぶ」ための6冊 - 銀座で働くデータサイエンティストのブログ"
        "http://tjo.hatenablog.com/entry/2014/04/23/220600"
        ["統計", "R"]
  , TisikiItem
        "Can I use... Support tables for HTML5, CSS3, etc"
        "http://caniuse.com/"
        ["web", "html", "javascript", "css"]
  , TisikiItem
        "What I Wish I Knew When Learning Haskell ( Stephen Diehl )"
        "http://dev.stephendiehl.com/hask/"
        ["haskell"]
  , TisikiItem
        "Velocity.js"
        "http://julian.com/research/velocity/"
        ["javascript", "jQuery", "animation"]
  , TisikiItem
        "Yesod アプリケーションの本番環境デプロイ :: yulii.net"
        "http://yulii.net/entries/10"
        ["haskell", "yesod"]
  , TisikiItem
        "Haskell 製 WebフレームワークYesod はじめました :: yulii.net"
        "http://yulii.net/entries/18"
        ["haskell", "yesod"]
  , TisikiItem
        "CSS Bootstrap"
        "http://getbootstrap.com/css/"
        ["css"]
  , TisikiItem
        "set up yesod on ec2 Amazon Linux AMI 2013.03.1 64bit to make haskell-platform switch to small instance (m1.small) temporarily.temporarily"
        "https://gist.github.com/letsspeak/5650158"
        ["amazon", "haskell", "yesod"]
  , TisikiItem
        "Vimcasts - Free screencasts about the text editor Vim"
        "http://vimcasts.org/"
        ["vim"]
  , TisikiItem
        "Yesod Screencast: Yammer on Vimeo"
        "http://vimeo.com/14922583"
        ["haskell", "yesod"]
  , TisikiItem
        "How To Become A Hacker"
        "http://www.catb.org/~esr/faqs/hacker-howto.html"
        ["programming"]
  , TisikiItem
        "How To Become A Hacker: Japanese"
        "http://cruel.org/freeware/hacker.html"
        ["programming"]
  , TisikiItem
        "Video Lectures | Structure and Interpretation of Computer Programs | Electrical Engineering and Computer Science | MIT OpenCourseWare"
        "http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/video-lectures/"
        ["programming", "scheme"]
  , TisikiItem
        "YesodBookJp :: Licensed by Meatware"
        "http://melpon.org/yesodbookjp"
        ["haskell", "yesod"]
  , TisikiItem
        "HTML5 Boilerplate: The web's most popular front-end template"
        "http://html5boilerplate.com/"
        ["html"]
  , TisikiItem
        "Disqus – The Web’s Community of Communities"
        "http://disqus.com/"
        ["service"]
  , TisikiItem
        "Mighttpd"
        "http://mew.org/~kazu/proj/mighttpd/en/"
        ["haskell", "web server"]
  , TisikiItem
        "Normalize.css: Make browsers render all elements more consistently."
        "http://necolas.github.io/normalize.css/"
        ["css"]
  , TisikiItem
        "05. Yesod - とりあえず雑記帳"
        "https://sites.google.com/site/toriaezuzakki/haskell/yesod"
        ["haskell", "yesod"]
  , TisikiItem
        "Quill - An Open Source Rich Text Editor with an API"
        "http://quilljs.com/"
        ["javascript"]
  , TisikiItem
        "Bootstrap :: Cupid"
        "http://bootstraptheme.com/bootswatch/cupid/"
        ["css"]
  , TisikiItem
        "さらば愛しき JavaScript —— 愛と欲望の果てに Haskell は fay と出逢う。 - これは圏です"
        "http://blog.konn-san.com/article/20121225/fay-introduction"
        ["haskell", "javascript"]
  , TisikiItem
        "Yesod, AngularJS and Fay"
        "http://www.yesodweb.com/blog/2012/10/yesod-fay-js"
        ["haskell", "yesod", "javascript", "angular"]
  , TisikiItem
        "Pure"
        "http://purecss.io/"
        ["css"]
  , TisikiItem
        "Eight Terminal Utilities Every OS X Command Line User Should Know mitchchn.me"
        "http://www.mitchchn.me/2014/os-x-terminal/"
        ["mac", "unix"]
  , TisikiItem
        "How to get function parameter names/values dynamically from javascript - Stack Overflow"
        "http://stackoverflow.com/questions/1007981/how-to-get-function-parameter-names-values-dynamically-from-javascript"
        ["javascript"]
  , TisikiItem
        "angularjs - Angular Element&#39;s Scope not working as expected - Stack Overflow"
        "http://stackoverflow.com/questions/20079267/angular-elements-scope-not-working-as-expected"
        ["javascript", "angular"]
  , TisikiItem
        "debug - Rails4 今のところ最強なデバッグツール達 - Qiita"
        "http://qiita.com/yusabana/items/8ce54577d959bb085b37"
        ["ruby", "rails"]
  , TisikiItem
        "YesodからCoffeeScriptを使う - DRascal.com"
        "http://drascal.com/blog/article/5"
        ["haskell", "yesod", "javascript", "coffeescript"]
  ]

onCommand :: CommandHandler App
onCommand render command =
    case readFromFay command of
      Just (GetFib index r) -> render r $ 1 -- fibs !! index
      Just (GetTisikiItems r) -> render r $ tisikiItems
      Nothing               -> invalidArgs ["Invalid command"]
