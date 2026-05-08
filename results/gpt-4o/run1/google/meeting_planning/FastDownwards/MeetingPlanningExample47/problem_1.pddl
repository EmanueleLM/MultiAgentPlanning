(define (problem meeting_paul_in_san_francisco)
  (:domain san_francisco_visit)
  (:objects
    richmond_district nob_hill - location
    you paul - person
    time_9_00 time_9_17 time_9_30 time_11_15 time_11_30 - time
  )
  (:init
    (at you richmond_district)
    (available paul time_9_30 time_11_15)
    (current_time time_9_00)
  )
  (:goal (and 
    (visited paul)
  ))
)