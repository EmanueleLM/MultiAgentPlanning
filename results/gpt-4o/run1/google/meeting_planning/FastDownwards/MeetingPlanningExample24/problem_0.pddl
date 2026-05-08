(define (problem visit_friends_in_san_francisco)
  (:domain san_francisco_day_trip)
  (:objects 
    nob_hill presidio - location
    matthew - person
    arrival_nob_hill available_matthew_start available_matthew_end departure_presidio - time
  )
  (:init 
    (at nob_hill)
    (current_time arrival_nob_hill)
    (available matthew available_matthew_start available_matthew_end)
    (can_travel nob_hill presidio arrival_nob_hill available_matthew_start)
    (can_travel presidio presidio available_matthew_start available_matthew_end) ; for meeting duration
  )
  (:goal 
    (and
      (met matthew)
    )
  )
)