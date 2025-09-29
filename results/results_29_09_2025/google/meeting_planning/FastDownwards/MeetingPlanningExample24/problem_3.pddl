(define (problem meeting_planning_problem)
  (:domain meeting-planning)
  (:objects
    visitor1 - person
    nob_hill presidio - location
  )
  (:init
    (at visitor1 nob_hill)
    (matthew_available)
    (visitor_prefers_short)
  )
  (:goal (and
    (met_matthew)
  ))
)