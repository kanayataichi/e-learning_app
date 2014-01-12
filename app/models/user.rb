# -*- coding: utf-8 -*-
# モデル名：問題
# 属性一覧
# ユーザID  user_id
# ユーザ名  user_name
# パスワード password
# パスワード再確認 password_confirmation
# 作成日：2014/01/02 金谷
class User < ActiveRecord::Base

  # Webアプリケーションからアクセス可能な属性
  attr_accessible :user_id, :user_name, :password, :password_confirmation
  
  # パスワード属性の追加(passwordとpassword_confirmation)
  has_secure_password
  
  # 必須チェック、最低文字数チェック、最大文字数チェック
  validates :user_id, presence:true, length:{maximum:10}
  validates :user_name, presence:true, length:{maximum:20}
  validates :password, length:{minimum:6,maximum:20}
end
