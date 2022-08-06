class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @list=List.new
  end

  # createアクション内の処理の流れは以下↓
    # 1.フォームに記述した文字やデータを受け取る
    # 2.受け取ったデータを元にインスタンスを作成する
    # 3.データをデータベースに保存するためのsaveメソッド実行
    # 4.トップ画面へ、リダイレクト

  def create
    # 1&2 データを受け取り新規登録するためのインスタンス作成
    list=List.new(list_params)
    # 3 データをデータベースに保存するためのsaveメソッドを実行
    list.save
    # 4 トップ画面へリダイレクト
    redirect_to'/top'
  end


  def index
  end

  def show
  end

  def edit
  end
  # ↓privateは”ここから下は一このcontrollerの中でしか呼び出せません”と言う意味がある。
  # 他のアクションを巻き込まないように下に記述する。
  private
  #ストロングパラメータ
  #マスアサインメント脆弱性を防ぐ仕組み
  def list_params
    params.require(:list).permit(:title,:body)
  end
  # params...formから送られてくるデータはparamsの中に入っています。
  # require...送られてきたデータの中からモデル名（ここではlist)を指定し、データを絞り込む。
  # permit...requireで絞り込んだデータの中から、保存を許可するカラムを指定する。
end