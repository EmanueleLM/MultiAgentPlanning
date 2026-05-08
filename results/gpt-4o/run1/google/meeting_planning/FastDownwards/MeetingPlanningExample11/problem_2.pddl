(define (problem visit_san_francisco)
  (:domain san_francisco_visit)

  (:objects 
    nob_hill sunset_district - location
    carol - person
    morning afternoon evening night - time_slot
  )

  (:init 
    (at_location nob_hill)
    (time_slot_current morning)
    (not (met_carol))
  )

  (:goal 
    (and 
      (met_carol)
      (at_location nob_hill)
      (time_slot_current night)
    )
  )
)