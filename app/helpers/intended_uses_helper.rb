module IntendedUsesHelper

  # accepts a list of IntendedUse objects and pre-populates them if necessary
  def multiple_intended_use_form_section(existing = [])

    out = ""

    counter = 0

    while existing.any?
      use = existing.pop
      out += label_tag "Use:"
      out += text_field_tag "intended_uses[][use]", use.use, :id => nil
      out += label_tag "Money:"
      out += number_field_tag "intended_uses[][money_amount]", use.money_amount, :id => nil
    end

    out += label_tag "Use:"
    out += text_field_tag "intended_uses[][use]", "", :id => nil
    out += label_tag "Money:"
    out += number_field_tag "intended_uses[][money_amount]", "", :id => nil

    return out.html_safe
  end

end
