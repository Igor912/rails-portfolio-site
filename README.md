# Small portfolio web-site on Ruby on Rails.
[Site Preview](http://avtoperevezenia.herokuapp.com)

###### Technologies used: RoR(with erb views)/Sqlite3, SCSS, jquery.
###### App main functionality:page with main info, reviews view(everyone can add new review, and only admin-user have permissions to edit or delete reviews), ordering page, admin panel mini.

###### In Terminal:
```
bundle install;
rake db:migrate;
rake routes;
```
Create user with admin permissions:
```
rails c
admin_user = User.new(:email => "user@name.com", :password => 'password', :password_confirmation => 'password', :admin => true)
admin_user.save
```
