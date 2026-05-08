(define (problem meet_paul_in_nob_hill)
  (:domain meeting_with_paul)
  (:objects
    richmond_district nob_hill - location
    you paul - person
    time_9_00 time_9_17 time_9_30 time_9_45 - time
  )
  (:init
    (at you richmond_district)
    (available paul time_9_30 time_11_15)
    (current_time time_9_00)
  )
  (:goal 
    (and (visited paul))
  )
)