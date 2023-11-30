defmodule PhoenixAppWeb.ArticleController do
  use PhoenixAppWeb, :controller

  alias PhoenixApp.Book
  alias PhoenixApp.Book.Article

  action_fallback PhoenixAppWeb.FallbackController

  def index(conn, _params) do
    articles = Book.list_articles()
    render(conn, :index, articles: articles)
  end

  def create(conn, %{"article" => article_params}) do
    with {:ok, %Article{} = article} <- Book.create_article(article_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/articles/#{article}")
      |> render(:show, article: article)
    end
  end

  def show(conn, %{"id" => id}) do
    article = Book.get_article!(id)
    render(conn, :show, article: article)
  end

  def update(conn, %{"id" => id, "article" => article_params}) do
    article = Book.get_article!(id)

    with {:ok, %Article{} = article} <- Book.update_article(article, article_params) do
      render(conn, :show, article: article)
    end
  end

  def delete(conn, %{"id" => id}) do
    article = Book.get_article!(id)

    with {:ok, %Article{}} <- Book.delete_article(article) do
      send_resp(conn, :no_content, "")
    end
  end
end
