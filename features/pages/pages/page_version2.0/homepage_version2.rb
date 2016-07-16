class JordanHomepageVersion2
  include PageObject
  include Automation
  ENV['SECTION'] = 'web'
  ENV['BRAND']='jordans'
  # include PageObject::PageFactory

  def initialize(browser)
    @browser = browser
  end

  def set_firstname
    self.first_name_text_field.set "Ajay"
  end

  def verify_textbox_firstname
    self.first_name_text_field.present?
  end

  def get_base_url(section ='', brand='')
    section = 'web' if section ==''
    brand = 'jordans' if brand ==''
    home_page = GetHomepageURL.new
    base_url = home_page.get_url(section, brand)
    base_url
  end

  # @param [Object] section which section url req from yml
  # @param [Object] brand which brand url req from yml
  def open(section ='', brand='')
    base_url = self.get_base_url(section, brand)
    @browser.goto(base_url)
  end

  def is_current_page?
    @browser.title.include?('Jordans Furniture Power Charge Card - Your Information')
  end

  def splash_checkbox
    wait_for_some_time 2
    @browser.element(css: "checkbox#agree-check").click
    wait_for_some_time 2
    @browser.element(css: "button#splash-continue").click
  end


  def select_hamburger_menu
    @browser.element(:link, "Secure").click
    wait_for_some_time 3
  end

  def select_privacy_pdf_opt_out
    @browser.element(:css, "img.icon-menu-image").click
    wait_for_some_time 1
    @browser.element(:link, "Privacy & Opt-Out Notice").click
  end

  def verify_footer(sheet_cell)
    self.footer.each do |footer_ele|
      puts "Excel: #{sheet_cell}"
      puts "\n Webpage : #{footer_ele.text}"
      unless sheet_cell.include?(footer_ele.text)
        return false
      end
      true
    end
    true
  end

  def verify_privacy_statement(sheet_cell)
    if sheet_cell.include?(self.privacy_statement.text)
      puts "Excel: #{sheet_cell}"
      puts "\n Webpage: #{self.privacy_statement.text}"
      true
    else
      return false
    end
    if sheet_cell.include?(self.privacy_statement_center.text)
      puts "Excel: #{sheet_cell}"
      puts "\n Webpage: #{self.privacy_statement_center.text}"
      true
    else
      return false
    end
    true
  end

  def get_privacy_statement_text
    @browser.elements(:css => "footer.row div.large-12.columns div.ng-scope div.ng-binding p")[0].text +
        @browser.elements(:css => "footer.row div.large-12.columns div.ng-scope div.ng-binding p")[1].text
  end

  def get_header_product_detail()
    self.wait_for_some_time 3
    self.header_product_details_expander.click
    self.wait_for_some_time 2
    product_body_detail = self.header_product_detail_body.text
    product_header_details = self.header_product_detail.text

    product_details = product_header_details.to_s + product_body_detail.to_s
    puts product_details
    product_details
  end

  def verify_header_heading(sheet)
    header_heading_text = self.header_heading.text
    puts "Page: #{header_heading_text}"
    puts "Excel: #{sheet}"
    sheet.include?(header_heading_text)
  end

  def select_footer_links_by_name(hyperlink_text)
    footer.each do |footer_element|
      if footer_element.text.downcase == hyperlink_text.downcase
        footer_element.click
        break
      end
    end
    wait_for_some_time 2
  end

  def get_new_page_title
    Watir::Wait.until { browser.windows.size == 2 }
    wait_for_some_time 5
    window = @browser.window(title: "Capital One | Our Accessibility Commitment").use
    title  = @browser.title
    window.close
    title
  end

  def get_modal_title
    wait_for_some_time 2
    modal_title = @browser.element(css: "div.header-inner-table > h1.ng-binding").text
    @browser.element(css: "div.modal-close-inner > button[type='button']").click
    modal_title
  end

  def get_privacy_opt_out_modal
    modal_title = @browser.element(css: "div.header-inner-table h1").text
    @browser.element(css: "div.modal-close-inner > button[type='button']").click
    modal_title
  end

  def switch_to_modal_verify_title(title_text)
    @browser.alert.exists?
    @browser.alert.text
    @browser.alert.close
  end

  def select_continue
    self.continue_submit_button.click
    wait_for_some_time 2
  end

  def get_form_end_errors
    footer_error_messages = Array.new
    puts"\nPage Inline\n"
    errors = self.form_end_error
    errors.each do |error_footer_message|
      message = error_footer_message.text
      puts "#{message}"
      footer_error_messages << message if message != ''
    end
    footer_error_messages
  end

  def get_inline_errors
    inline_error_messages = Array.new
    puts"\nPage Inline Erros"
    errors = self.inline_errors
    errors.each do |error_inline_message|
      message = error_inline_message.text
      puts "#{message}"
      inline_error_messages << message if message != ''
    end
    inline_error_messages
  end

  def select_ssn
    self.ssn_text_box.click
    wait_for_some_time 2
  end

  def get_ssn_tool_tip
    tool_tip = self.ssn_tool_tip.text
    puts "Page: #{tool_tip}"
    tool_tip
  end

  def select_income
    self.income_text_box.click
    wait_for_some_time 2
  end

  def get_income_tool_tip
    tool_tip = self.income_tool_tip.text
    puts "Page: #{tool_tip}"
    tool_tip
  end

  def select_accessible_menu
    wait_for_some_time 2
    self.accessible_menu.click
    wait_for_some_time 3
  end

  def get_rate_fee_content_long
    self.accessible_menu_rate_fee_link.click
    wait_for_some_time 3
    # self.accessible_menu_rate_fee_long.text
    self.accessible_menu_rate_fee_long
  end

  def get_rate_fee_content_short
    wait_for_some_time 3
    self.accessible_menu_rate_fee_short.text
  end

  def get_electronic_disclosure
    wait_for_some_time 5
    self.electronic_disclosure.text
  end

  def get_customer_agreement
    self.accessible_menu_rate_fee_link.click
    wait_for_some_time 3
    # self.accessible_menu_rate_fee_long.click
    # wait_for_some_time 1
    self.accessible_menu_customer_agreement.click
    wait_for_some_time 2
   content = self.customer_agreement_content.text
    self.close_modal.click
    content
  end

  #################Locators##################

  def close_modal
    @browser.element(css: "button.close")
  end

  def accessible_menu
    @browser.element(:css, "a#accessible-menu" )
  end

  def accessible_menu_customer_agreement
    #@browser.element(css: "#modal.outer-container div.row.ng-scope.open div.outside.large-12.columns").click
    self.wait_for_some_time 5
    @browser.element(id: "customer-agreement")
  end

  def customer_agreement_content
    #@browser.element(:css, "#customer-agreement").text
    @browser.element(:css, "drawer.large-12.columns.ng-scope.ng-isolate-scope[content-key='customer-agreement'] div.row ng-scope open")
  end

  def accessible_menu_rate_fee_long
    @browser.element(:css, "#rate-fee").text
  end

  def accessible_menu_rate_fee_short
    # begin
    #   @browser.element(:css, "section.terms.rate-fee-short.container")
    # rescue
    #   @browser.elements(:css, "div.drawer")[1]
    # end
    @browser.element(css: "drawer.ng-isolate-scope[content-key = 'rate-fee-short']")
  end

  def electronic_disclosure
    @browser.element(css: "drawer.ng-isolate-scope[content-key = 'electronic-info']")
  end

  def accessible_menu_rate_fee_link
    self.wait_for_some_time 3
    begin
      @browser.element(css: "ul#menu.animated li.ng-scope a.main-menu-link span.oui-icon-document.oui-icon-filled")
    rescue
      @browser.element(:link, "Rate & Fee Information")
    end
  end

  def income_text_box
    @browser.element(:id, "income")
  end

  def income_tool_tip
    begin
      @browser.element(css: "div.container-income tooltip.ng-isolate-scope div#tooltip-income p.ng-binding")
    rescue
      @browser.element(:css, "div#tooltip-income div")
    end

  end

  def ssn_text_box
    @browser.element(:id, "taxId")
  end
  def ssn_tool_tip
    begin
      @browser.element(css: "field.ng-scope.ng-isolate-scope div.container-taxId tooltip.ng-isolate-scope div#tooltip-taxId p.ng-binding")
    rescue
      @browser.element(:css, "div#tooltip-taxId div")
    end

  end


  def inline_errors
    begin
      @browser.elements(class: "errormsg")
    rescue
      @browser.elements(:css, "div.inline-error-container p.errormsg.required")
    end

  end

  def footer
    @browser.elements(:css => "footer.row a")
  end

  def privacy_statement_center
    begin
      @browser.element(:css => "footer.row div.large-12.columns div.ng-scope div.ng-binding p.center")
    rescue
      @browser.element(:css => "footer.row.ng-scope p.center")
    end

  end

  def privacy_statement
    begin
      @browser.element(:css => "footer.row div.large-12.columns div.ng-scope div.ng-binding p.center")
    rescue
      @browser.element(:css => "footer.row.ng-scope p:nth-child(3)")

    end

  end

  def first_name_text_field
    @browser.text_field(:id => "firstName")
  end

  def header_product_detail
    begin
      @browser.element(css: "app-header section.container.head h1")
    rescue
      @browser.element(:css => "h2.productDetails-title")
    end

  end

  def header_product_detail_body
    begin
      @browser.element(css: "div.productDetails.animated")
    rescue
      @browser.element(:css, "div.productDetails-body")
    end

  end

  def header_product_details_expander
    @browser.element(:css, "h2.productDetails-title span")
  end

  def header_heading
    begin
      @browser.element(css: "app-header section.container.head h1.ng-binding")
    rescue
      @browser.element(:css => "h1.ng-binding")
    end

  end

  def continue_submit_button
    begin
      @browser.element(:css, "button#apply-continue.progressive.right")
    rescue
      @browser.element(:css, "div.button-group button.submit")
    end

  end

  def form_end_error
    @browser.elements(:css, "div.formEnd div.errorSum p")
  end
end