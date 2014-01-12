# -*- coding: utf-8 -*-
# モデル名：試験区分
# 属性一覧
# 試験区分ID  test_category_id
# 試験区分内容 test_category_content
# 作成日：2014/01/02 金谷
class TestCategory < ActiveRecord::Base

  # 「問題マスタ：試験区分マスタ=多対1」の関係を構築
  has_many :problems, :dependent=> :destroy,
    primary_key: [ :test_category_id]
  
  # Webアプリケーションからアクセス可能な属性
  attr_accessible :test_category_content, :test_category_id
  
  # 必須チェック、最大文字数チェック
  validates :test_category_id, presence: true, length: { maximum: 4 }
  validates :test_category_content, presence: true, length: { maximum: 10 }
end
