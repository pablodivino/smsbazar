class MenuBrowser
  attr_accessor :menu_manager, :io, :session_tracker
  def process_action phone, message
    session = @session_tracker.get_session phone.to_s
    if session == nil
      menu_item = @menu_manager.get_root
      @io.print menu_item.menu_text_items
    else
      node_id = session.node_id
      node = @menu_manager.get_node node_id
      menu_item = @menu_manager.get_menu_by_item_number node, message.to_i
      if menu_item.node.leaf?
        advs = @menu_manager.get_advs menu_item.node
        advs.each do |adv|
          @io.print "#{adv.content}. Телефон #{adv.phone}"
        end
      else
        @io.print menu_item.menu_text_items
      end
    end
    sms_session = SmsSession.new
    sms_session.node_id = menu_item.node.id.to_s
    @session_tracker.save_session phone, sms_session
  end
end