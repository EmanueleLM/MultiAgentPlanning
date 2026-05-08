(define (problem san_francisco_trip_instance)
  (:domain san_francisco_trip)
  
  (:objects
    nob_hill alamo_square - location
    anthony - person
    time_9_00am time_9_11am time_9_15am time_11_00am time_1_00pm - time
  )
  
  (:init
    (at_location nob_hill)
    (at anthony alamo_square)

    (can_travel nob_hill alamo_square)
    (can_travel alamo_square nob_hill)

    (time time_9_00am)
    (before time_9_00am time_9_11am)
    (before time_9_11am time_9_15am)
    (before time_9_15am time_11_00am)
    (before time_9_11am time_1_00pm)

    (before time_9_00am time_11_00am)
    (before time_9_00am time_1_00pm)
  )
  
  (:goal
    (and
      (visited anthony)
    )
  )
)