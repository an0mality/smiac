class Document < ActiveRecord::Base
  belongs_to :document_stage
  belongs_to :user
  # searchkick word_start: [:filename]
  scope :last_day, -> {where(created_at: Time.now-21.hours..Time.now+3.hours)}

  def self.phone_sprav
    Document.where('lower(filename) like lower (?)', "%телефонный справочник миац.xls%").first
  end

  def initialize(params = {})
    file = params.delete(:file)
    super
    if file
      self.filename = sanitize_filename(file.original_filename)
      self.content_type = file.content_type
      self.file_contents = file.read
    end
  end

  NUM_BYTES_IN_MEGABYTE = 1048576
  def file_size_under_one_mb
    if (@file.size.to_f / NUM_BYTES_IN_MEGABYTE) > 1
      errors.add(:file, 'File size cannot be over one megabyte.')
    end
  end

  def self.search params
    documents = Document
    if params[:document_tab_stage_id].present?
      documents = documents.where(document_stage_id: params[:document_tab_stage_id])
    elsif params[:document_stage_id].present? && params[:document_tab_stage_id].blank?
      documents = documents.where(document_stage_id: params[:document_stage_id])
    elsif params[:document_stage_id].blank? && params[:document_tab_stage_id].blank? && params[:parent_id].present?
      documents = documents.where(document_stage_id: params[:parent_id])
    end
    per_page = 12
    per_page = documents.count if params[:view]=='all' 
    per_page = 12 if params[:per_page] == '12' 
    per_page = 24 if params[:per_page] == '24'
    documents = documents.where('lower(filename) like lower(?)', "%#{params[:search]}%") if params[:search].present?
    if per_page>0
      return documents.order("created_at desc").paginate(page: params[:page], per_page: per_page)
    end
  end

  private
  def sanitize_filename(filename)
    # Get only the filename, not the whole path (for IE)
    # Thanks to this article I just found for the tip: http://mattberther.com/2007/10/19/uploading-files-to-a-database-using-rails
    return File.basename(filename)
  end

  def self.search_glob params
    Document.where('lower(filename) like lower (?)', "%#{params[:search]}%").order('created_at desc')
  end
end
