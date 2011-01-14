module ActionView
  module Helpers
    module FormHelper
      # Returns a locales list and the form given as block for each locale
      # The locales list naming depends on I18n.t(:this_file_language)
      #
      # ==== Examples
      #   <% multi_locales(I18n.available_locales) do |locale| %>
      #     <%= f.label :title, nil, {:locale => locale} %>
      #     <%= f.text_field :title, {:locale => locale} %>
      #     <%= f.text_area :body, {:locale => locale} %>
      #   <% end %>
      #   # => <ul class="nav locales">
      #   #      <li class="en"><a href="#"><span class="name">English</span></a></li>
      #   #      <li class="fr"><a href="#"><span class="name">Français</span></a></li>
      #   #    </ul>
      #   #    <div class="multi_locales">
      #   #      <div class="locale en">
      #   #        <label for="post_title_en">Title</label>
      #   #        <input id="post_title_en" lang="en" name="post[title][en]" size="30" type="text" value="Title" />
      #   #        <textarea name="post[body][en]" id="post_body_en" rows="20" lang="en" cols="40"></textarea>
      #   #      </div>
      #   #      <div class="locale fr">
      #   #        <label for="post_title_fr">Title</label>
      #   #        <input id="post_title_fr" lang="fr" name="post[title][fr]" size="30" type="text" value="Title" />
      #   #        <textarea name="post[body][fr]" id="post_body_fr" rows="20" lang="fr" cols="40"></textarea>
      #   #      </div>
      #   #    </div>
      #
      def multi_locales(locales, &block)
        raise ArgumentError, "Missing block" unless block_given?
        
        concat('<ul class="nav locales">'.html_safe)
        for locale in locales
          orig_locale, I18n.locale = I18n.locale, locale
          link = link_to(('<span class="name">' + h(I18n.t(:this_file_language)) + '</span>').html_safe, "#")
          I18n.locale = orig_locale

          concat(('<li class="' + h(locale.to_s) + '">' + link + '</li>').html_safe)
        end
        concat('</ul><div class="multi_locales">'.html_safe)
        for locale in locales
          concat(('<div class="locale ' + h(locale.to_s) + '">').html_safe)
          yield locale
          concat("</div>".html_safe)
        end
        concat('</div>'.html_safe)
      end
    end
  end
end