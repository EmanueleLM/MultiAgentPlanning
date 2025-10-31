(define (problem meeting_planning_problem)
  (:domain meeting-planning)
  (:objects
    visitor1 - person
  )
  (:init
    (at visitor1 nob_hill)
    (= (current_time) 0)
    (= (meet_count) 0)
  )
  (:goal (and
    (met_matthew)
  ))
  (:metric maximize (meet_count))
)