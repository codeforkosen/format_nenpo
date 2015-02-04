# format_nenpo

## about

明石高専専攻科 専攻科特別研究の年報用TeXクラスファイル`nenpo.cls`（`format_nenpo.doc`をリスペクトしたネーミング）．

## usage

```tex
\documentclass{nenpo}

\title{スマートフォンを用いたPIN及びフリック入力による\\タッチスクリーンバイオメトリクス}
\author{泉 将之\footnotemark}
\etitle{Touch-Screen Biometrics for PIN and Flick Input on Smartphone}
\eauthor{Masayuki IZUMI}
\abstract{
  Following the rapid spread of smartphone usage, risks of unauthorized use and information leakage are increasing.
  Conventional authentication methods by PIN (personal identification number) and password are vulnerable
  to brute force attack and the quick peek on the screen, and then there exist many possible victims by identity theft.
  An effective solution to this vulnerability is the biometrics for PIN and Flick inputting based on the touch-screen biometrics.
  In this research, we investigate the authentication possiblility of touch screen biometrics for PIN and Flick inputting.
  Authentication experiments are performed, and an increase in authentication accuracy is found through extraction of new features.
  In particular we propose an implementation of smartphone application of touch-screen biometrics for PIN inputting.
}
\keywords{touch-screen biometrics, smartphone, biometrics, android}

\begin{document}
\maketitle
\footnotetext{機械・電子システム工学専攻}

\section{序論}

% ...

\end{document}
```

## author

* [Masayuki IZUMI](https://github.com/izumin5210)
