class OwnerNotifierMailer < ApplicationMailer
  default from: 'from@example.com'
  def signup_email(owner)
    @owner = owner
    mail( :to => @owner.email,
    :subject => 'Thanks for signing up!' )
  end

  def rent_email(owner, rent)
    @owner = owner
    @rent = rent
    mail( :to => @owner.email,
    :subject => 'You have made a new Rent!' )
  end
end
