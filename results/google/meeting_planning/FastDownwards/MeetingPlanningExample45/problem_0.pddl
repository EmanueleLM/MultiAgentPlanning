(define (problem meet-emily-problem)
  (:domain meeting-domain)
  (:objects
    traveler emily - agent
    north-beach emily-place - location
  )

  (:init
    ;; Traveler has arrived at North Beach at 9:00 AM (540 minutes).
    (at traveler north-beach)
    ;; Emily is at her place.
    (at emily emily-place)

    ;; Global clock and met counter
    (= (time) 540)       ; 9:00 AM
    (= (met-count) 0)

    ;; Travel durations (minutes). These are explicit in the problem instance.
    (= (travel-time north-beach emily-place) 20)
    (= (travel-time emily-place north-beach) 20)
  )

  ;; No hard goal other than maximizing the number of friends met; allow planner
  ;; to choose actions. The metric below will drive meeting Emily (and others,
  ;; if added) as the objective.
  (:goal (and))

  ;; Objective: maximize the number of distinct meetings recorded by (met-count).
  ;; The problem enforces that any meeting with Emily must last at least 15 minutes
  ;; and must occur inside Emily's availability window [600,660] (10:00–11:00).
  (:metric maximize (met-count))
)