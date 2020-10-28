class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :ticker, presence: true

  def self.check_db(symbol)
    where(ticker: symbol).first
  end

  def get_quote
    client = get_client(true)
    client.quote(self.ticker)
  end

  def get_news
    client = get_client(true)
    client.news(self.ticker)
  end

  private 
  
  def get_client(sandbox)
    if sandbox
      IEX::Api::Client.new(
        publishable_token: Rails.application.credentials.iex_client[:sandbox_tokens][:publishable_token],
        secret_token: Rails.application.credentials.iex_client[:sandbox_tokens][:secret_token],
        endpoint: 'https://sandbox.iexapis.com/v1'
      )
    else
      IEX::Api::Client.new(
        publishable_token: Rails.application.credentials.iex_client[:core_tokens][:publishable_token],
        secret_token: Rails.application.credentials.iex_client[:core_tokens][:secret_token],
        endpoint: 'https://cloud.iexapis.com/v1'
      )
    end
  end
  
end
