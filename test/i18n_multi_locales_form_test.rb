require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class I18nMultiLocalesForm < ActionView::TestCase
  def setup
    @post = flexmock('post', :title => 'Title')
  end
  
  def test_label
    assert_equal '<label for="post_title_fr">Title</label>', label('post', 'title', {:locale => :fr})
  end
  
  def test_input
    assert_equal '<input id="post_title_fr" lang="fr" name="post[title][fr]" size="30" type="text" value="Title" />', text_field(:post, :title, {:locale => :fr})
  end
  
  def test_text_area
    assert_equal '<textarea cols="40" id="post_title_fr" lang="fr" name="post[title][fr]" rows="20">Title</textarea>', text_area(:post, :title, {:locale => :fr})
  end
end
