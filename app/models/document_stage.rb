class DocumentStage < ActiveRecord::Base
  has_many :documents, :dependent => :restrict_with_error
  belongs_to :parent, class_name: "DocumentStage"
  has_many :children, class_name: "DocumentStage", foreign_key: "parent_id", :dependent => :restrict_with_error

  def self.medstat
    parent_id = DocumentStage.where('lower(name) like lower (?)', "%медицинская стат%").first.id
    document_stage_id = DocumentStage.where(parent_id: parent_id).order(:name)
    return {:parent_id => parent_id, :document_stage_id => document_stage_id}
  end

  def self.bezop
    DocumentStage.where('lower(name) like lower (?)', "%персональн%").first
  end

  def self.rmis
    rmis = DocumentStage.where('lower(name) like lower (?)', "%рмис%").first
    Document.where(document_stage_id: rmis.parent_id) + Document.where(document_stage_id: rmis.id)
  end

end

