# -*- coding: utf-8 -*-
# 画面名：ユーザマスタメンテナンス
# クラス名：ユーザマスタメンテナンスコントローラー
# 概要:ユーザマスタへの登録・更新・削除を行なう。
# 作成日：2014/01/05 金谷
class UserController < ApplicationController

  # 初期表示
  def index
  
    # フォーム表示用インスタンス生成
    @user = User.new
    
    # 一覧表示用にユーザ情報を取得
    @users = User.paginate(page: params[:page], :per_page => 3)
  end

  # 登録処理
  def new
  
    # 更新データか判別
    @upd_record = User.find_by_user_id(params[:user]["user_id"])
    if @upd_record.blank?
    
      # サブミットされたユーザ情報を取得
      @user = User.new(params[:user])
      
      # 未登録の場合は新規登録
      # クライアントへのレスポンス設定
      respond_to do |format|
        
        # 登録実行(saveはtrue/falseを返却)
        # 登録失敗時点で、@userにはエラーメッセージが自動で設定される。
        if @user.save
        
          # 一覧表示用にユーザ情報を取得
          @users = User.paginate(page: params[:page], :per_page => 3)
          
          # HTML形式でレスポンス(リダイレクト)
          format.html { redirect_to user_url, notice: '登録が完了しました。' }
        else
        
          # 一覧表示用にユーザ情報を取得
          @users = User.paginate(page: params[:page], :per_page => 3)
          
          # indexページへ遷移
          format.html { render action: "index" }
        end
      end
    else
      
      # 登録済の場合は更新      
      # クライアントへのレスポンス設定
      respond_to do |format|
      
        # 更新実行
        if @upd_record.update_attributes(params[:user])
        
          # フォーム表示用インスタンス生成
          @user = User.new
          
          # 一覧表示用にユーザ情報を取得 
          @users = User.paginate(page: params[:page], :per_page => 3)
          format.html { redirect_to user_url, notice: '更新が完了しました。' }
        else
        
          # 更新失敗したレコードをエラーメッセージごと戻す
          @user = @upd_record
        
          # 一覧表示用にユーザ情報を取得
          @users = User.paginate(page: params[:page], :per_page => 3)
          
          # indexページへ遷移
          format.html { render action: "index" }
        end
      end
    end
  end
  
  # 更新処理
  def update
  
    # ユーザマスタのIDに基づき、レコードを取得
    @user = User.find(params[:id])
  
    # 一覧表示用にユーザ情報を取得
    @users = User.paginate(page: params[:page], :per_page => 3)
    
    # クライアントへのレスポンス設定
    respond_to do |format|
    
      # indexページへ遷移
      format.html { render action: "index" }
    end
  end
  
  # 削除処理
  def destory
    
    # 削除実行(ユーザマスタのActiveRecordを生成しないで削除実行しているため、速度改善に役立つ)
    User.delete_all(["user_id = ?", params[:user_id]])
    
    # 一覧表示用にユーザ情報を取得
    @users = User.paginate(page: params[:page], :per_page => 3)
    
    # クライアントへのレスポンス設定
    respond_to do |format|
    
      # indexページへ遷移
      format.html { redirect_to user_url, notice: '削除が完了しました。' }
    end
  end
end
