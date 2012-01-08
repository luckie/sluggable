require 'test_helper'

class ActsAsSluggable < MiniTest::Unit::TestCase

  def teardown
    Book.destroy_all
    Author.destroy_all
  end

  def test_a_book_title_is_sluggified
    book = Book.new(:title => 'The Hobbit')
    assert_equal 'the-hobbit', book.slug
  end

  def test_a_saved_book_title_is_sluggified
    book = Book.create(title: 'The Hobbit')
    assert_equal 'the-hobbit', book.slug
  end

  def test_a_slug_is_not_changed_with_the_title
    book = Book.new(title: 'The Hobbit')
    book.title = 'The Lord of the Rings'
    assert_equal 'the-hobbit', book.slug
  end

  def test_sluggify_name_as_name_slug
    author = Author.new(name: 'J R R Tolkein')
    assert_equal 'j-r-r-tolkein', author.name_slug
    refute_respond_to author, :slug
  end

  def test_amperstand_is_converted_to_and
    book = Book.new(title: 'Of Mice & Men') 
    assert_equal 'of-mice-and-men', book.slug
  end

  def test_slugs_are_unique
    Book.create!(title: 'The Hobbit')
    book = Book.new(title: 'The Hobbit')
    refute book.valid?
    assert_includes book.errors[:slug], 'has already been taken'
  end

  def test_slugs_can_be_scoped
    a1 = Author.create!(name: 'Ivan the opulent')
    a2 = Author.create!(name: 'Evan Prime')
    b2 = Book.create!(title: 'The Hobbit', author: a1)
    b2 = Book.new(title: 'The Hobbit', author: a2)
    assert b2.valid?, 'scoped slug is not unique'
  end

end
