module UsersHelper
  def roles_for_select
    Building.all.collect { |building| [building.name, building.id] }
  end
end