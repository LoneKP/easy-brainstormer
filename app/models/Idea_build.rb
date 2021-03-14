class IdeaBuild < ApplicationRecord
  belongs_to :idea

  validates :idea_build_text, presence: {message: "You forgot to write something!"}

  def opacity_lookup
    opacity_hash[decimal] || 10
  end

  def opacity_hash
    {1=>90, 2=>80, 3=>70, 4=>60, 5=>50, 6=>40, 7=>30, 8=>20, 9=>10}
  end

  def decimal
    idea.idea_builds.index(self) + 1
  end

  def vote_in_plural_or_singular
    votes > 1 || votes == 0 ? "votes" : "vote"
  end
end