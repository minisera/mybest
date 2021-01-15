module ActsAsTaggableOn
  class Tag < ::ActiveRecord::Base
    CHECKER_TAG=/\A[ぁ-んァ-ン一-龥a-zA-Z0-9０-９]+\z/
    validates :name,length: {maximum: 10},format: {with: CHECKER_TAG, message: "タグに不正な文字が入っています"}
  end
end