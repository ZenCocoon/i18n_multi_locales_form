== I18n Multi Locales Form

i18n_multi_locales_form is a plugin by Sébastien Grosjean (aka ZenCocoon <http://zencocoon.com>)


= I18n Multi Locales Form functionality

i18n_multi_locales_form facilitates multi-locales form creation. It's made to create forms with multilingual entries.


= Requirement

It requires :

* Rails 2.3.*
* Globalize2 v0.1.1 with this patches on top
** http://globalize2.lighthouseapp.com/projects/15085/tickets/6-add-locale-parameter-to-setters


= WARNING

The plugin overwrite few methods from module ActionView::Helpers::InstanceTag::Base
To have a better understanding of what it does, the best way is still to look at the code and tests.


= I18n Multi Locales Form usage

Just add the option :locale => YOUR_LOCALE to your text_field.

    # in views
    <%= f.text_field :title,  { :locale => :'fr' } %>

    # Generated
    <input type="text" lang="fr" value="VALUE_TRANSLATED" size="30" name="page[title][en]" id="page_title_en"/>


Copyright (c) 2009-2011 Sébastien Grosjean, released under the MIT license