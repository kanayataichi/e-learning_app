# -*- coding: utf-8 -*-
# クラス名：コントローラー共通
# 概要:コントローラー共通
# 作成日：2014/01/02 金谷
class ApplicationController < ActionController::Base

  # CSRF攻撃対策
  protect_from_forgery
end
