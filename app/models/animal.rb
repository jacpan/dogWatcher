class Animal < ActiveRecord::Base
	# Relationships
	has_one :user
	has_many :requests

	# Scopes
	# active and inactive scopes included by Activeable module
	scope :alphabetical, -> { order(:name) }

	# Validations
	validates_presence_of :name, :type

	# Methods
	# make_active and make_inactive methods included by Activeable module


end
