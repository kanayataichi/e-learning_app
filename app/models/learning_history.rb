# -*- coding: utf-8 -*-
# モデル名：学習履歴
# 属性一覧
# 学習者ID  learner_id
# 試験区分  test_category
# 問題番号  problem_no
# 明細番号  item_number
# 学習日    learning_date
# 解答内容  answer_content
# 判定結果  judgement_result
# 作成日：2014/01/04 金谷
class LearningHistory < ActiveRecord::Base

  # Webアプリケーションからアクセス可能な属性
  attr_accessible :answer_content, :item_number, :judgement_result, :learner_id, :learning_date, :problem_no, :test_category
end
