# coding: utf-8
class Article < ActiveRecord::Base
	# 0 -новость
	# 1 - ?
	# 2 - видео
	# attr_accessible :title, :preview, :body, :published_at, :published_to, :user_id, :types, :vid_url, :image
	# has_attached_file :image, :styles => { :hd => "1080x720>", :xlarge => "1920x700>", :news =>"973x615#", :large => "750x300>", :medium => "300x300>",  :small => "200x200>", :thumb => "100x100>" }, :default_url => "/images/:style/rails.png"
	# validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	scope :types_0, -> { where(types: 0)}
	scope :types_1, -> { where(types: 1)}
	scope :types_2, -> { where(types: 2)}
	scope :types_3, -> { where(types: 3)}
	scope :types_4, -> { where(types: 4)}
	scope :types_5, -> { where(types: 5)}
	scope :publics_to, -> { where("published_to > ?",Date.today)}
	# scope :publics, -> {where('published_at between ? and ?  and published_to > ? ', Date.parse('2014-01-01'), Date.today.end_of_day, Date.today.end_of_day)}
	scope :publics, -> {where('published_at between ? and ?  and published_to > ? ', Date.parse('2014-01-01'), Date.today.end_of_day, Date.today.end_of_day).order(created_at: :desc)}
	scope :published, -> {where(show: true).order(created_at: :desc)}
	scope :publics_at,  -> { where("published_at between ? and ?",Date.today.beginning_of_day, Date.today.end_of_day)}
	scope :last_day, -> {where(created_at: Time.now-21.hours..Time.now+3.hours)}
	belongs_to :user
	has_many :foto
	belongs_to :tag
	belongs_to :article_image

	def start_time
		self.created_at
	end

	TAGS = {123 => {name: "Тег (Выберите...)"}, 0 => {name: "Здравоохранение", color: "rgba-default"}, 1 => {name: "Информатизация", color: "rgba-blue"}, 2 => {name: "Статистика", color: "rgba-yellow"}, 3 => {name: "Деятельность МИАЦ'a", color: "rgba-purple"}}

	def self.add_article params,current_user
		Article.create(title:params[:title], types:params[:types], preview:params[:preview], body: params[:body], vid_url: (params[:vid_url] if params[:vid_url].present?), published_at: Time.now, published_to: Time.now, user_id: current_user.id)
	end

	def self.edit_article params
		Article.find(params[:id]) if Article.find(params[:id]).present?

	end
	def self.remove_article params
		Article.find(params[:id]).delete if Article.find(params[:id]).present?
	end

	def self.update_article params
		if Article.find(params[:id]).present?
			Article.find(params[:id]).update_attributes(title: params[:title],preview:params[:preview],body: params[:body])
		end
	end

	def self.search params
		Article.published.where('lower(body) like lower (?) OR lower(title) like lower (?)', "%#{params[:search]}%", "%#{params[:search]}%").order("created_at DESC")
	end

	def self.search_gl params
		Article.where('lower(body) LIKE lower (?) OR lower(title) LIKE lower (?)', "%#{params[:search]}%", "%#{params[:search]}%").order("created_at DESC")
	end

end
