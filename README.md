# 掲示板

![board-app site_](https://user-images.githubusercontent.com/61886606/83838853-63576a80-a735-11ea-84cd-c01a7968d1a4.png)

# 概要

簡易掲示板 https://board-app.site/  
テストユーザーアカウント  
・ユーザー名: test  
・パスワード: password  

# 機能一覧

## 投稿関連

・一覧表示  
・ページネーション  
・作成  
・編集  
・削除  
・本文にリンク貼り付け  
・カテゴリー関連付け  
・カテゴリー検索  
・いいね機能  
・いいねしたユーザー表示

## コメント関連

・投稿  
・削除  
・ログインなしで投稿可  
・コメントにリンク貼り付け  

## カテゴリー関連

・一覧表示  
・作成  
・削除  

## ユーザー関連

・作成  
・編集  
・ログイン機能  
・サムネイル有  
・検索  
・いいねした投稿表示  

# 使用技術

## フロントエンド

・HTML  
・CSS(Bootstrap)  
・JavaScript  

## バックエンド/フレームワーク

・Ruby(2.5)  
・Ruby on Rails(5.2)  

## データベース

・MySQL(5.7)

## Webサーバー

・Nginx

## 仮想環境

・Docker

## CI

・CircleCi(自動テストのみ)

## インフラ

・AWS(EC2,RDS,Route53)  
・独自ドメイン  
・SSL化  

# 目的

MVCアーキテクチャの学習を兼ねて普段から利用しているTwitterなどのSNSに実装されている機能をもったものを作ってみたかった。

# 改善すべき点

・テストが少なすぎる(ほぼモデルのみ)  
・Vue.jsなどを利用して動きのあるページにする  
・CircleCiによって自動テストから自動デプロイまでできるようにする  
・インフラにECSを利用する  


