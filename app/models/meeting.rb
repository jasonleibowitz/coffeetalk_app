class Meeting < ActiveRecord::Base
  has_many(:interests)
  has_and_belongs_to_many(:users)

  def request_meeting(user)

  end

  def haversine(lat1, long1, lat2, long2)
    dtor = Math::PI/180
    r = 3959

    rlat1 = lat1 * dtor
    rlong1 = long1 * dtor
    rlat2 = lat2 * dtor
    rlong2 = long2 * dtor

    dlon = rlong1 - rlong2
    dlat = rlat1 - rlat2

    a = power(Math::sin(dlat/2), 2) + Math::cos(rlat1) * Math::cos(rlat2) * power(Math::sin(dlon/2), 2)
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
    d = r * c

    return d
  end

  private
  def power(num, pow)
    num ** pow
  end

end
