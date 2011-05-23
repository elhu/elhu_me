class ClearanceMailer < ActionMailer::Base
  default :from => "from@example.com"

  def change_password
    subject "Password recovery"
  end
end
