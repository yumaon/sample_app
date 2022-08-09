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
    @list=List.new(list_params)
    # 3 データをデータベースに保存するためのsaveメソッドを実行
    if @list.save
      redirect_to list_path(@list.id)
    else
      # ビューは自身が呼び出されたアクション内からインスタンス変数を参照する。
      # renderを使う際、ビューの表示に必要なインスタンス変数を用意しなくてはならない。
      # renderの性質を利用してエラーメッセージを表示することができる。
      render :new
    end
  end


  def index
    # listsテーブルに保存されている、全てのレコードをまとめて取得する。
    @lists=List.all
  end

  def show
    # 今回はレコードを一件だけ取得するので、インスタンス変数名は単数系の@listにする。
    @list=List.find(params[:id])
  end

  def edit
    @list=List.find(params[:id])
  end

  def update
    list=List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list=List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end

  # ↓privateは”ここから下は一このcontrollerの中でしか呼び出せません”と言う意味がある。
  # 他のアクションを巻き込まないように下に記述する。
  private
  #ストロングパラメータ
  #マスアサインメント脆弱性を防ぐ仕組み
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end
  # params...formから送られてくるデータはparamsの中に入っています。
  # require...送られてきたデータの中からモデル名（ここではlist)を指定し、データを絞り込む。
  # permit...requireで絞り込んだデータの中から、保存を許可するカラムを指定する。
end