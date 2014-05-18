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
  , TisikiItem
        "ベーシックで高品質で完全にフリーな日本語フォント - yayuguのにっき"
        "http://d.hatena.ne.jp/yayugu/touch/20100925/1285441247"
  , TisikiItem
        "Destroy All Software Screencasts"
        "https://www.destroyallsoftware.com/screencasts"
  , TisikiItem
        "2014年春版：初心者にお薦めする「本当にゼロから統計学と機械学習の基礎を学ぶ」ための6冊 - 銀座で働くデータサイエンティストのブログ"
        "http://tjo.hatenablog.com/entry/2014/04/23/220600"
  , TisikiItem
        "Can I use... Support tables for HTML5, CSS3, etc"
        "http://caniuse.com/"
  , TisikiItem
        "What I Wish I Knew When Learning Haskell ( Stephen Diehl )"
        "http://dev.stephendiehl.com/hask/"
  , TisikiItem
        "Velocity.js"
        "http://julian.com/research/velocity/"
  , TisikiItem
        "Yesod アプリケーションの本番環境デプロイ :: yulii.net"
        "http://yulii.net/entries/10"
  , TisikiItem
        "Haskell 製 WebフレームワークYesod はじめました :: yulii.net"
        "http://yulii.net/entries/18"
  , TisikiItem
        "CSS Bootstrap"
        "http://getbootstrap.com/css/"
  , TisikiItem
        "set up yesod on ec2 Amazon Linux AMI 2013.03.1 64bit to make haskell-platform switch to small instance (m1.small) temporarily.temporarily"
        "https://gist.github.com/letsspeak/5650158"
  , TisikiItem
        "Vimcasts - Free screencasts about the text editor Vim"
        "http://vimcasts.org/"
  , TisikiItem
        "Yesod Screencast: Yammer on Vimeo"
        "http://vimeo.com/14922583"
  , TisikiItem
        "How To Become A Hacker"
        "http://www.catb.org/~esr/faqs/hacker-howto.html"
  , TisikiItem
        "How To Become A Hacker: Japanese"
        "http://cruel.org/freeware/hacker.html"
  , TisikiItem
        "Video Lectures | Structure and Interpretation of Computer Programs | Electrical Engineering and Computer Science | MIT OpenCourseWare"
        "http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/video-lectures/"
  , TisikiItem
        ""
        ""
  , TisikiItem
        ""
        ""
  , TisikiItem
        ""
        ""
  , TisikiItem
        ""
        ""
  ]

onCommand :: CommandHandler App
onCommand render command =
    case readFromFay command of
      Just (GetFib index r) -> render r $ fibs !! index
      Just (GetHoge      r) -> render r $ "Hoge"
      Just (GetMyAddr    r) -> render r $ MyAddr "name dayo" "mail dayo"
      Just (GetTisikiItems r) -> render r $ tisikiItems
      Nothing               -> invalidArgs ["Invalid command"]
