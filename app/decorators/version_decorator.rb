class VersionDecorator < ApplicationDecorator
  decorates PaperTrail::Version
  delegate_all

  def created_at
    print_date(model.created_at)
  end
end
