class Image < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  belongs_to :item
end
