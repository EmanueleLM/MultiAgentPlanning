(define (problem itinerary-problem)
  (:domain itinerary)

  (:objects
    presidio northbeach - location
    alice carlos farah eli dana grace betty - friend
    option1 option2 option3 - option
  )

  (:init
    ;; start location at Presidio at 09:00 (represented by the at predicate)
    (at presidio)
    ;; No friends met initially (met predicates absent)
    ;; No option chosen initially (option-chosen predicates absent)
    ;; done is absent initially
    ;; The three high-level schedule options are the only feasible, provided, and allowed sequences;
    ;; they each respect travel times and friend availability windows from the provided data.
  )

  ;; Hard constraint: Betty must be met for at least 75 minutes within her 18:45-22:00 window.
  ;; This is enforced as a hard goal (met betty) and every option that is selectable meets Betty
  ;; for the required 75 minutes within the provided window (per candidate schedules).
  (:goal (and
    (done)
    (met betty)
  ))

  ;; Objective: prefer plans that meet as many distinct friends as possible.
  ;; Achieved by minimizing total-cost; each option action decreases (total-cost) by the
  ;; number of friends met in that option. Fast Downward will thus prefer option1 (-7),
  ;; then option2 (-6), then option3 (-4).
  (:metric minimize (total-cost))
)