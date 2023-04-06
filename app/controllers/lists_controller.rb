class ListsController < ApplicationController

  def new
    @list = List.new
  end

  # 以下を追加
  def create
    # １. データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # 2. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
    flash[:notice] = "投稿が成功しました"
    redirect_to list_path(list.id)
  end

  def new
  @list = List.find(params[:id])
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
    end
end
