module BookingsHelper
  def time_conversion(minutes)
    '%d:%02d' % minutes.divmod(60)
  end
end
