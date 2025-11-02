(define (problem meeting_planning_problem)
  (:domain meeting-planning)
  (:objects
    visitor1 - person
    nob_hill presidio - location
  )
  (:init
    (at visitor1 nob_hill)
    (= (time) 540)         ; visitor arrives Nob Hill at 09:00 (9*60)
    (= (meetings) 0)
  )
  (:goal (and
    (met_matthew)         ; must meet Matthew for at least 30 minutes within his availability
  ))
  (:metric maximize (meetings))
)