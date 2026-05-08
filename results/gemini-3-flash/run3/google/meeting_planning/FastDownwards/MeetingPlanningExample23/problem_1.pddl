(define (problem meet_john_instance)
  (:domain meeting_planning)
  (:objects
    bayview russian_hill - location
    t0900 t0923 t1730 t1845 t2100 - time
    john - person
  )
  (:init
    (at bayview)
    (current_time t0900)
    (link bayview russian_hill t0900 t0923)
    (time_next t0923 t1730)
    (available_to_meet john russian_hill t1730 t1845)
    (time_next t1845 t2100)
  )
  (:goal (has_met john))
)