(define (problem san_francisco_trip_instance)
  (:domain san_francisco_trip)
  (:objects
    chinatown marina_district - location
    stephanie - person
    time_9am time_9_12am time_10am time_11am time_12pm time_1pm time_2pm time_3pm - time
  )
  (:init
    (at you chinatown time_9am)
    (at stephanie marina_district time_9am)
    (at stephanie marina_district time_10am)
    (at stephanie marina_district time_11am)
    (at stephanie marina_district time_12pm)
    (at stephanie marina_district time_1pm)
    (at stephanie marina_district time_2pm)
    (at stephanie marina_district time_3pm)
    (can_travel chinatown marina_district time_9am time_9_12am)
    (can_travel marina_district chinatown time_2pm time_2_16pm)
  )
  (:goal (and
    (met_minimum_duration stephanie marina_district)
    (at you chinatown time_3pm)
  ))
)