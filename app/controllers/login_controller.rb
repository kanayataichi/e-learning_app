# -*- coding: utf-8 -*-
# 画面名：ログイン画面
# クラス名：ログイン画面コントローラー
# 概要:e-ラーニングシステムへのログインを行なう。
# 作成日：2014/01/04 金谷
class LoginController < ApplicationController

  # 初期表示
  def index
  
  	# ログインフラグを倒す
  	session["login"] = false;
  
    # ユーザインスタンス生成
    @user = User.new
  end

  # ログイン
  def login
    
    # ユーザIDからユーザ情報を取得
	@user = User.find_by_user_id(params[:user]["user_id"])
	if @user.blank? == false
		if @user.authenticate(params[:user]["password"])
    
			# ログインフラグを立てる
			session["login"] = true;
    
			# メニュー画面に遷移
			render "main_menu/index"
		else
			response_error
		end
	else
		response_error
	end
  end
end

# 以降、プライベートメソッド
private
	def response_error
		@user = User.new(params[:user])
		@user.errors.add(:base,"ユーザIDまたはパスワードが間違っています。")
		
		respond_to do |format|
		
			# indexページへ遷移
			format.html { render action: "index" }
	    end
	end
