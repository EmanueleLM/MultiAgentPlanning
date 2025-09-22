(define (problem combined-meet-problem)
  (:domain combined-meet-domain)
  (:requirements :durative-actions :typing :numeric-fluents :negative-preconditions :timed-initial-literals)
  (:objects
    marina mission - location
  )
  (:init
    ;; start-time corresponds to 9:00 AM -> model time as minutes since 9:00
    (= (current-time) 0)

    ;; both representations of "you are at Marina" initialized consistently
    (at marina)
    (at-you marina)

    ;; shared resource free initially
    (available)
  )

  ;; Stephanie's availability as timed initial literals:
  ;; Stephanie will be at Mission from 10:30AM to 1:30PM.
  ;; Times are minutes after 9:00AM: 10:30AM = 90, 1:30PM = 270.
  ;; The second literal removes the predicate at 270.
  (:timed-initial-literals
    (at 90 (stephanie-at mission))
    (at 270 (not (stephanie-at mission)))
  )

  (:goal (met))
)