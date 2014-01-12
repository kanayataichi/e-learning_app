# -*- coding: utf-8 -*-
# 画面名：試験実施
# クラス名：試験実施コントローラー
# 概要:学習履歴テーブルへの登録・更新・削除を行なう。
# 作成日：2014/01/05 金谷
class TrialController < ApplicationController

  # 初期表示
  def index
    init_index
  end
  
  # 試験実施
  def start
  
    # サブミットされた試験区分を取得
    @test_category_id = params[:problem]["test_category_id"]
    
    # 試験問題テーブルから問題を取得
    @record = Problem.find_by_test_category_id(@test_category_id)
    
    # 試験問題を取得できた場合、試験実施
    # 試験問題を取得できない場合、エラー
    if @record.blank?
    
      # 画面項目初期化処理
      init_index
      
      respond_to do |format|
        
        # 試験実施不可エラーメッセージ設定
        @trial = Problem.new(params[:problem])
        @trial.errors.add(:base, "試験問題が存在しないため、実施できません。")
        
        # indexページへ遷移
        format.html { render action: "index" }
      end
    else
      
      # 試験実施ページへ遷移
      @problem = @record
      @trial = LearningHistory.new
      respond_to do |format|
        format.html { render action: "trial" }
      end
    end
  end
  
  # 次の問題へ
  def next
  
      # 現在表示している問題番号より大きい問題があればその問題を、
      # なければ、また問題番号の小さい順に出題する
      @problem_record = Problem.find(:first, :conditions => ["test_category_id = ? and problem_no > ?", params[:test_category_id], params[:problem_no]], :order => "problem_no ASC")
      if @problem_record.blank?
        @problem_record = Problem.find(:first, :conditions => ["test_category_id = ? and problem_no >= ?", params[:test_category_id], 1], :order => "problem_no ASC")
      end
      @problem = @problem_record
      @trial = LearningHistory.new
    
      # 試験実施ページへ遷移
      respond_to do |format|
        format.html { render action: "trial" }
      end
  end
end

# 以降はプライベートメソッド
private

  # 画面初期化メソッド(indexページ用)
  def init_index
  
    # フォーム表示用インスタンス生成
    @trial = Problem.new
    
    # 試験区分コンボボックスを設定
    test_category_records = TestCategory.find(:all)
    @test_categories = Array.new
    test_category_records.each{ |record|
      @test_categories << [record.test_category_content, record.test_category_id]
    }
  end
