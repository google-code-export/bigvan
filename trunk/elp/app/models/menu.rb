class Menu < ActiveRecord::Base
  def self.get_main_menu
    [
      ["Dashboard",{:controller=>:main,:action=>:dashboard}],
      ["Training",{:controller=>:training,:action=>:introduction}],
      ["Downloads",{:controller=>:downloads,:action=>:introduction}],
      ["Contact",{:controller=>:contact,:action=>:contact}],
      ["Logout",{:controller=>:main,:action=>:logout}]
    ]
  end
  def self.get_sub_of_main
    [
      ["News",{:controller=>:main,:action=>:news}],
      ["Event",{:controller=>:main,:action=>:event}],
      ["Dev Team Blog",{:controller=>:main,:action=>:blog}]
    ]
  end
  def self.get_sub_of_training
    [
      ["Training",{:controller=>:training,:action=>:introduction}],
      ["Register(BETA)",{:controller=>:training,:action=>:register}]
    ]
  end
  def self.get_sub_of_downloads
    [["Text",{:controller=>:downloads,:action=>:text}],
      ["Audio",{:controller=>:downloads,:action=>:audio}],
      ["Vedio",{:controller=>:downloads,:action=>:video}]
    ]
  end
  def self.get_sub_of_contact

  end
end
