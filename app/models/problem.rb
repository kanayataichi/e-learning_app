# -*- coding: utf-8 -*-
# モデル名：問題
# 属性一覧
# 試験区分   test_category_id
# 問題番号   problem_no
# 問題内容   problem_content
# 模範解答   model_answer
# 解説       commentary
# 解答候補１ answer_candidate1
# 解答候補２ answer_candidate2
# 解答候補３ answer_candidate3
# 解答候補４ answer_candidate4
# 作成日：2014/01/02 金谷
class Problem < ActiveRecord::Base

  # 「問題マスタ：試験区分マスタ=多対1」の関係を構築
  belongs_to :test_category,
    primary_key: [ :test_category_id, :problem_no ],
    foreign_key: [ :test_category_id]
  
  # Webアプリケーションからアクセス可能な属性
  attr_accessible :commentary, :model_answer, :problem_content, :problem_no, :test_category_id, :answer_candidate1, :answer_candidate2, :answer_candidate3, :answer_candidate4
end
