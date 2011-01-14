require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class I18nMultiLocalesForm < ActionView::TestCase
  def setup
    @post = flexmock('post', :title => '', :body => '')

    I18n.locale = :en
    I18n.backend = I18n::Backend::Simple.new
    I18n.backend.store_translations(:en, :this_file_language => 'English')
    I18n.backend.store_translations(:fr, :this_file_language => 'Français')
  end
  
  def test_label
    assert_equal '<label for="post_title_fr">Title</label>', label('post', 'title', {:locale => :fr})
  end
  
  def test_input
    assert_equal '<input id="post_title_fr" lang="fr" name="post[title][fr]" size="30" type="text" value="" />', text_field(:post, :title, {:locale => :fr})
  end
  
  def test_text_area
    assert_equal '<textarea cols="40" id="post_title_fr" lang="fr" name="post[title][fr]" rows="20"></textarea>', text_area(:post, :title, {:locale => :fr})
  end
  
  def test_multi_locales
    multi_locales(I18n.available_locales) do |locale|
      concat text_field :post, 'title', {:locale => locale}
      concat text_area :post, 'body', {:locale => locale}
    end
    
    expected = '<ul class="nav locales">' +
               '<li class="en"><a href="#"><span class="name">English</span></a></li>' +
               '<li class="fr"><a href="#"><span class="name">Français</span></a></li>' +
               '</ul>' +
               '<div class="multi_locales">' +
               '<div class="locale en">' +
               '<input id="post_title_en" lang="en" name="post[title][en]" size="30" type="text" value="" />' +
               '<textarea name="post[body][en]" id="post_body_en" rows="20" lang="en" cols="40"></textarea>' +
               '</div>' +
               '<div class="locale fr">' +
               '<input id="post_title_fr" lang="fr" name="post[title][fr]" size="30" type="text" value="" />' +
               '<textarea name="post[body][fr]" id="post_body_fr" rows="20" lang="fr" cols="40"></textarea>' +
               '</div>' +
               '</div>'
    
    assert_dom_equal expected, output_buffer
  end
end
