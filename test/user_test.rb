require File.dirname(__FILE__)+ '/test_helper'
require "active_record"
require "app/models/user"
require "pry"


class UserTest < Test::Unit::TestCase
	def test_initialize_with_attributes
		user = User.new(id: 1, name: "Avi")
		assert_equal 1, user.id
		assert_equal "Avi", user.name
	end

	def test_find
		user = User.find(1)
		assert_kind_of User, user
		assert_equal 1, user.id
	end

	def test_all
		users = User.all 
		assert_kind_of Array, users
		assert_equal 1, users.first.id
	end
end