class AddLanguages < ActiveRecord::Migration[6.0]
  def change
    preference = Preference.first || Preference.create
    [['English', 'en'], ['Italian', 'it'], ['German', 'de'], ['French', 'fr']].each do |name, locale|
      preference.languages.create name: name, locale: locale
    end
  end
end
