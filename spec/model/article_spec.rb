require 'rails_helper'

describe Article do 
  it "title should exist" do
    article = Article.new(title: nil)
    expect(article.valid?).to eq(false)
  end

  it "title length >= 5" do
    article = Article.new(title: 'five !')
    expect(article[:title].length).to be >= 5  
  end
end