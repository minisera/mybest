class Book < Post
  validate :limit_post, on: :create

  private

  def limit_post
    errors.add(:user, 'の登録制限数を超えました') if user && user.books.size > 9
  end
end
