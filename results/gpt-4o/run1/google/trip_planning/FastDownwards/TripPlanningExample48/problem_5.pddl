(define (problem european_trip_instance)
  (:domain european_city_trip)
  (:objects 
    split manchester geneva - city
    day_1 day_2 day_3 day_4 - day
    visit_split visit_manchester visit_geneva - visit
  )
  
  (:init 
    (current_city manchester)
    (connected manchester split)
    (connected split manchester)
    (connected manchester geneva)
    (connected geneva manchester)
    (connected split geneva)
    (connected geneva split)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
  )
  
  (:goal (and
    (visited split day_2)
    (visited split day_3)
    (visited manchester day_1)
    (visited manchester day_4)
    (visited geneva day_3)
    (visited geneva day_4)
    (friend_meeting_on_day day_2)
  ))
)