class Article
  include Mongoid::Document
  store_in session: "heroku_app16195437"

  field :title, type: String
  field :url, type: String
  field :body, type: String

  def self.search(string)
    if string
      Article.with(collection: "yahoo").any_of({title: /#{string}/i}, {body: /#{string}/i})
    else
      nil
    end
  end
end
