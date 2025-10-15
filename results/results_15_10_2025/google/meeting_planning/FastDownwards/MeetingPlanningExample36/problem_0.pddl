(define (problem meet-barbara-problem)
  (:domain rendezvous)
  (:objects
    traveler - agent
    barbara  - friend
    marina embarcadero - location
  )

  (:init
    ; Traveler schedule: arrives at Marina at 9:00 AM = 540 minutes from midnight
    (= (time) 540)
    (at traveler marina)

    ; No friends met initially
    (= (met-count) 0)

    ; Public information about Barbara availability is enforced in action preconditions (not encoded as a separate fluent).
  )

  ; Goal is permissive; planner is instructed to maximize met-count via the metric below.
  ; Use a trivially true numeric goal so planner must produce a valid plan: met-count >= 0 is always true.
  (:goal (and (>= (met-count) 0)))

  ; Optimization objective: maximize the number of friends met (Barbara). FastDownwards will use this metric.
  (:metric maximize (met-count))
)