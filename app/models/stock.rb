class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_tokens][:publishable_token],
      secret_token: Rails.application.credentials.iex_client[:sandbox_tokens][:secret_token],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    begin
      new(
        ticker: ticker_symbol,
      )
    rescue => exception
      return nil
    end
  end

  def self.check_db(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

  def get_quote
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_tokens][:publishable_token],
      secret_token: Rails.application.credentials.iex_client[:sandbox_tokens][:secret_token],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    client.quote(self.ticker)
  end
  
end
