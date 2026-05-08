(define (problem visit_san_francisco)
  (:domain san_francisco_visit)

  (:objects 
    nob_hill sunset_district - location
    carol - person
    morning after_2pm before_830pm end_of_day - time_slot
  )

  (:init 
    (at_location nob_hill)
    (time_ge morning)
    (not (met_carol))
    (not (trip_completed))
  )

  (:goal 
    (and 
      (trip_completed)
      (met_carol)
    )
  )
)