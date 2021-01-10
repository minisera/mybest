module CommonActions
  extend ActiveSupport::Concern

  def sort_post_type(posts)
    @posts_b = posts.select { |x| x[:type].include?('Book') }.take(9)
    @posts_c = posts.select { |x| x[:type].include?('Clothe') }.take(9)
    @posts_g = posts.select { |x| x[:type].include?('Good') }.take(9)
  end
  
end
