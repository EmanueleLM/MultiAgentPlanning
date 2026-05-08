(define (problem meeting-itinerary-problem)
  (:domain meeting-itinerary)

  (:objects
    presidio northbeach - location
    alice carlos farah eli dana grace betty - friend
    optionA optionB optionC - option
  )

  (:init
    ;; Start location at Presidio at 09:00 is represented by being at the Presidio.
    (at presidio)
    ;; No option chosen initially, no friends met initially, done absent.
  )

  ;; Hard constraint: Betty must be met for at least 75 minutes within 18:45-22:00.
  ;; This is enforced by requiring the predicate (satisfied-betty) in the goal.
  (:goal (and
    (done)
    (satisfied-betty)
  ))

  ;; Objective: prefer plans that meet as many distinct friends as possible.
  ;; Each high-level option action reduces total-cost by the number of friends it meets.
  (:metric minimize (total-cost))
)