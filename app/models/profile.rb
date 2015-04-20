class Profile < ActiveRecord::Base

  USERNAME_REGEX = /\A[a-zA-Z][a-zA-Z0-9_]*\z/
  BLACKLISTED_USERNAMES = %w(admin root pages posts replies users
  profile profiles reports votes comments topics)


  belongs_to :user

  validates :username,
    uniqueness: true,
    presence: true,
    allow_nil: true,
    format:    {
      with: USERNAME_REGEX,
      allow_nil: true,
      message: 'can only contain alphabets and numbers' },
    exclusion: {
      in: BLACKLISTED_USERNAMES,
      message: 'this username is not available' },
    length: 3..32

  validates :name, presence: true, length: 2..32
end
