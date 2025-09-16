```lisp
(define (domain integrated_meeting_planner)
  (:requirements :strips :durative-actions :typing)
  (:types location person)
  (:predicates
    (at ?p - person ?l - location)
    (meeting-minimum-time-satisfied)
    (can-meet-betty ?p - person)
    (available_for_meeting ?p - person)
  )

  (:durative-action travel
    :parameters (?p - person ?from - location ?to - location ?time - number)
    :duration (= ?duration ?time)
    :condition (and
      (at start (at ?p ?from))
    )
    :effect (and
      (at end (at ?p ?to))
      (at end (not (at ?p ?from)))
    )
  )

  (:durative-action meet-betty
    :parameters (?p - person)
    :duration (>= ?duration 60) ; At least 60 minutes
    :condition (and
      (at start (at ?p Financial_District))
      (at start (at betty Financial_District))
      (over (available_for_meeting betty))
      (over (can-meet-betty ?p))
    )
    :effect (and
      (at end (meeting-minimum-time-satisfied))
    )
  )
)
```