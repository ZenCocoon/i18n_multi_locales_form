# I18n Multi Locales Form

i18n_multi_locales_form is a plugin by Sébastien Grosjean (aka [ZenCocoon][zencocoon])

## I18n Multi Locales Form functionality

i18n_multi_locales_form facilitates multi-locales form creation. It's made to create forms with multilingual entries.

## Requirement

It requires :

* Rails 2.3.*
* Globalize2 v0.1.1 with this patches on top
* [6-add-locale-parameter-to-setters][patch]

## WARNING

The plugin overwrite few methods from module ActionView::Helpers::InstanceTag::Base
To have a better understanding of what it does, the best way is still to look at the code and tests.

## I18n Multi Locales Form usage

Just add the option :locale => YOUR_LOCALE to your text_field.

    # in views
    <%= f.text_field :title, { :locale => :'fr' } %>

    # Generated
    <input type="text" lang="fr" value="VALUE_TRANSLATED" size="30" name="page[title][en]" id="page_title_en"/>


You can also use the view helper multi_locales to generate your fields

    # in views
    <% multi_locales(I18n.available_locales) do |locale| %>
      <%= f.label :title, nil, {:locale => locale} %>
      <%= f.text_field :title, {:locale => locale} %>
      <%= f.text_area :body, {:locale => locale} %>
    <% end %>

    # Generated
    <ul class="nav locales">
      <li class="en"><a href="#"><span class="name">English</span></a></li>
      <li class="fr"><a href="#"><span class="name">Français</span></a></li>
    </ul>
    <div class="multi_locales">
      <div class="locale en">
        <label for="post_title_en">Title</label>
        <input id="post_title_en" lang="en" name="post[title][en]" size="30" type="text" value="Title" />
        <textarea name="post[body][en]" id="post_body_en" rows="20" lang="en" cols="40"></textarea>
      </div>
      <div class="locale fr">
        <label for="post_title_fr">Title</label>
        <input id="post_title_fr" lang="fr" name="post[title][fr]" size="30" type="text" value="Title" />
        <textarea name="post[body][fr]" id="post_body_fr" rows="20" lang="fr" cols="40"></textarea>
      </div>
    </div>

## License

This code is free to be used under the terms of the [MIT license][mit].

## Bugs, Issues, Kudos and Catcalls

Comments are welcome. Send your feedback through the [issue tracker on GitHub][i]

If you have fixes: Submit via pull requests. Do not include version changes to the 
version file.

## Contributing to I18n Multi Locales Form

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Authors

* [Sébastien Grosjean][zencocoon] sponsored by [BookingSync Vacation Rental Software][bookingsync]

[patch]:http://globalize2.lighthouseapp.com/projects/15085/tickets/6-add-locale-parameter-to-setters
[mit]:http://www.opensource.org/licenses/mit-license.php
[i]:https://github.com/ZenCocoon/i18n_multi_locales_form/issues
[zencocoon]:https://github.com/ZenCocoon
[bookingsync]:http://www.bookingsync.com