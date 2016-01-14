class Wishlist < ActiveRecord::Base

  attr_accessible :listingtype, :min_year, :max_year, :body, :make, :model, :min_price, :max_price, :category,
                  :subcategory

	belongs_to :users
	validates_presence_of :listingtype

  def self.perfect_swap(params)
    query = Whishlist.where("listingtype = ?", "#{params['listing_type']}") unless params[:listingtype].blank?
    query = query.where("make = ?", "#{params['make']}") unless params[:make].blank?
    unless params[:make].blank?
      query = query.where("model = ?", "#{params['model']}") unless params[:model] =="Select your Model"
    end
    query  = query.where("category = ?", "#{params['category']}") unless params[:category].blank?
    query
  end
end
