(define (problem MeetingPlanningExample22-problem)
  (:domain MeetingPlanningExample22)
  (:objects
    visitor andrew - agent
    presidio union_square - location
    t0 t22 t135 t240 - time
  )
  (:init
    (at visitor presidio)
    (at-time visitor t0)
    (can-travel presidio union_square t0 t22)
    (can-wait t22 t135)
    (can-meet t135 t240)
    (andrew-at t135)
    (andrew-at t240)
  )
  (:goal (and (met-andrew)))
)