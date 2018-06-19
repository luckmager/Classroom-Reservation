module UsersHelper
  def get_role_name(role)
    if role == 0
      return "Student"
    elsif role == 1
      return "Teacher"
    elsif role == 2
      return "Admin"
    end
  end
end