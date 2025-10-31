(define (problem meet-barbara-coordinated-problem)
  (:domain travel-meeting-coordinated)
  (:objects
    traveler barbara - person
    bayview golden-gate-park - location
  )
  (:init
    ;; Traveler is at Bayview at 09:00 (540)
    (at traveler bayview)
    ;; Barbara is at Golden Gate Park and is available in the 08:00-11:30 window
    (at barbara golden-gate-park)

    ;; Unified global time. We choose 09:00 (540) as the current time so the planner
    ;; must schedule Barbara's commitment (if needed) and travel accordingly.
    (= (time) 540)
  )

  ;; Goal: traveler and barbara meet.
  (:goal (met traveler barbara))

  ;; Optimize final time (planner prefers earlier completion)
  (:metric minimize (time))
)