class MenusController < ApplicationController
  active_scaffold :menu do |config|
    config.label="Menus"
    config.list.columns=[:id,:parent_id,:shortname,:longname,:controller,:action,:parameters,:description,:create_dt,:level]
    config.columns=[:parent_id,:shortname,:longname,:controller,:action,:parameters,:description,:create_dt,:level]
    config.list.sorting={:id=>:asc,:parent_id=>:asc}
  end
end
