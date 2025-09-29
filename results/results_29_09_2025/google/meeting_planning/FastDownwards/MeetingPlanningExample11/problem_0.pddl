(define (problem meet-carol-problem)
  (:domain meet-visitors)

  ;; Objects: the visitor and Carol, and the two named locations
  (:objects
    visitor carol - person
    Nob_Hill Sunset_District - location
  )

  ;; Initial state uses timed initial literals to encode:
  ;; - The visitor arrives at Nob Hill at 09:00 (9.0).
  ;; - Carol is present at Sunset_District and available from 14:00 (14.0) until 20:30 (20.5).
  ;; Interpret times in hours. Durations of actions are in hours as well.
  (:init
    ;; Numeric initial value
    (= (num-met) 0)

    ;; Visitor arrives at Nob Hill at 09:00
    (at 9.0 (at visitor Nob_Hill))

    ;; Carol is at Sunset_District and available between 14:00 and 20:30
    (at 14.0 (at carol Sunset_District))
    (at 20.5 (not (at carol Sunset_District)))

    (at 14.0 (available carol))
    (at 20.5 (not (available carol)))

    ;; Note: before 09:00 visitor is not at any modeled location (thus cannot travel/meet before arrival).
  )

  ;; No hard propositional goal aside from maximizing meetings; allow planner to schedule actions
  ;; solely guided by the optimization metric. An empty conjunction is used as a trivially-satisfied goal.
  (:goal (and))

  ;; Optimization objective: maximize the numeric count of distinct friends met.
  (:metric maximize (num-met))
)