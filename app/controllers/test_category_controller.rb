# -*- coding: utf-8 -*-
# 画面名：試験区分マスタメンテナンス
# クラス名：試験区分マスタメンテナンスコントローラー
# 概要:試験区分マスタへの登録・更新・削除を行なう。
# 作成日：2014/01/04 金谷
class TestCategoryController < ApplicationController

  # 初期表示
  def index
  
    # フォーム表示用インスタンス生成
    @test_category = TestCategory.new
    
    # 一覧表示用に試験区分情報を取得
    @test_categories = TestCategory.paginate(page: params[:page], :per_page => 3)
  end

  # 登録処理
  def new
  
    # 更新データか判別
    @upd_record = TestCategory.find_by_test_category_id(params[:test_category]["test_category_id"])
    if @upd_record.blank?
    
      # サブミットされた試験区分情報を取得
      @test_category = TestCategory.new(params[:test_category])
      
      # 未登録の場合は新規登録
      # クライアントへのレスポンス設定
      respond_to do |format|
        
        # 登録実行(saveはtrue/falseを返却)
        # 登録失敗時点で、@test_categoryにはエラーメッセージが自動で設定される。
        if @test_category.save
        
          # 一覧表示用に試験区分情報を取得
          @test_categories = TestCategory.paginate(page: params[:page], :per_page => 3)
          
          # HTML形式でレスポンス(リダイレクト)
          format.html { redirect_to test_category_url, notice: '登録が完了しました。' }
        else
        
          # 一覧表示用に試験区分情報を取得
          @test_categories = TestCategory.paginate(page: params[:page], :per_page => 3)
          
          # indexページへ遷移
          format.html { render action: "index" }
        end
      end
    else
      
      # 登録済の場合は更新      
      # クライアントへのレスポンス設定
      respond_to do |format|
      
        # 更新実行
        if @upd_record.update_attributes(params[:test_category])
        
          # フォーム表示用インスタンス生成
          @test_category = TestCategory.new
          
          # 一覧表示用に試験区分情報を取得 
          @test_categories = TestCategory.paginate(page: params[:page], :per_page => 3)
          format.html { redirect_to test_category_url, notice: '更新が完了しました。' }
        else
        
          # 更新失敗したレコードをエラーメッセージごと戻す
          @test_category = @upd_record
        
          # 一覧表示用に試験区分情報を取得
          @test_categories = TestCategory.paginate(page: params[:page], :per_page => 3)
          
          # indexページへ遷移
          format.html { render action: "index" }
        end
      end
    end
  end
  
  # 更新処理
  def update
  
    # 試験区分マスタのIDに基づき、レコードを取得
    @test_category = TestCategory.find_by_test_category_id(params[:test_category_id])
  
    # 一覧表示用に試験区分情報を取得
    @test_categories = TestCategory.paginate(page: params[:page], :per_page => 3)
    
    # クライアントへのレスポンス設定
    respond_to do |format|
    
      # indexページへ遷移
      format.html { render action: "index" }
    end
  end
  
  # 削除処理
  def destory
    
    # 削除実行(試験区分マスタのActiveRecordを生成しないで削除実行しているため、速度改善に役立つ)
    TestCategory.delete_all(["test_category_id = ?", params[:test_category_id]])
    
    # 一覧表示用に試験区分情報を取得
    @test_categories = TestCategory.paginate(page: params[:page], :per_page => 3)
    
    # クライアントへのレスポンス設定
    respond_to do |format|
    
      # indexページへ遷移
      format.html { redirect_to test_category_url, notice: '削除が完了しました。' }
    end
  end
end
