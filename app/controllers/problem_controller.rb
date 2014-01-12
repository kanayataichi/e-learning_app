# -*- coding: utf-8 -*-
# 画面名：試験問題作成
# クラス名：試験問題作成コントローラー
# 概要:試験問題テーブルへの登録・更新・削除を行なう。
# 作成日：2014/01/05 金谷
class ProblemController < ApplicationController

  # 初期表示
  def index
  
    # フォーム表示用インスタンス生成
    @problem = Problem.new
    
    # 試験区分コンボボックスを設定
    test_category_records = TestCategory.find(:all)
    @test_categories = Array.new
    test_category_records.each{ |record|
      @test_categories << [record.test_category_content, record.test_category_id]
    }
    
    # 一覧表示用に試験問題情報を取得
    @problems = Problem.paginate(page: params[:page], :per_page => 3)
  end

  # 登録処理
  def new
  
    # 更新データか判別(?利用でSQLインジェクション対策)
    @upd_record = Problem.find(:first, :conditions => ["test_category_id = ? and problem_no = ?", params[:problem]["test_category_id"], params[:problem]["problem_no"]])
    if @upd_record.blank?
    
      # サブミットされた試験問題情報を取得
      @problem = Problem.new(params[:problem])
      
      # 未登録の場合は新規登録
      # クライアントへのレスポンス設定
      respond_to do |format|
        
        # 一覧表示用に試験問題情報を取得
          @problems = Problem.paginate(page: params[:page], :per_page => 3)
        
        # 登録実行(saveはtrue/falseを返却)
        # 登録失敗時点で、@problemにはエラーメッセージが自動で設定される。
        if @problem.save

          # HTML形式でレスポンス(リダイレクト)
          format.html { redirect_to problem_url, notice: '登録が完了しました。' }
        else

          # indexページへ遷移
          format.html { render action: "index" }
        end
      end
    else

      # 一覧表示用に試験問題情報を取得 
      @problems = Problem.paginate(page: params[:page], :per_page => 3)
    
      # 登録済の場合は更新      
      # クライアントへのレスポンス設定
      respond_to do |format|
      
        # 更新実行
        if @upd_record.update_attributes(params[:problem])
        
          # フォーム表示用インスタンス生成
          @problem = Problem.new
          
          format.html { redirect_to problem_url, notice: '更新が完了しました。' }
        else
        
          # 更新失敗したレコードをエラーメッセージごと戻す
          @problem = @upd_record
          
          # indexページへ遷移
          format.html { render action: "index" }
        end
      end
    end
  end
  
  # 更新処理
  def update
  
    # 試験問題マスタの試験区分ID、問題番号に基づき、レコードを取得
    @problem = Problem.find(:first, :conditions => ["test_category_id= ? and problem_no = ?", params[:test_category_id],params[:problem_no]])
  
    # 一覧表示用に試験問題情報を取得
    @problems = Problem.paginate(page: params[:page], :per_page => 3)
    
    # 試験区分コンボボックスを設定
    test_category_records = TestCategory.find(:all)
    @test_categories = Array.new
    test_category_records.each{ |record|
      @test_categories << [record.test_category_content, record.test_category_id]
    }
    
    # クライアントへのレスポンス設定
    respond_to do |format|
    
      # indexページへ遷移
      format.html { render action: "index" }
    end
  end
  
  # 削除処理
  def destory
  
    # 削除実行(試験問題マスタのActiveRecordを生成しないで削除実行しているため、速度改善に役立つ)
    Problem.delete_all(["test_category_id = ? and problem_no = ?", params[:test_category_id], params[:problem_no]])
    
    # 一覧表示用に試験問題情報を取得
    @problems = Problem.paginate(page: params[:page], :per_page => 3)
    
    # クライアントへのレスポンス設定
    respond_to do |format|
    
      # indexページへ遷移
      format.html { redirect_to problem_url, notice: '削除が完了しました。' }
    end
  end
end
