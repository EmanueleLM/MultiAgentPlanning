(define (domain MeetingPlanningExample24)
  (:requirements :strips :typing :durative-actions :negative-preconditions :timed-initial-literals)
  (:types location person)

  (:predicates
    (at ?l - location)                      ; your current location
    (at_time_available)                     ; auxiliary zero-ary predicate toggled by TILs when availability window opens/closes
    (available ?p - person)                 ; person is currently available for meeting
    (met ?p - person)                       ; person has been met
    (connected ?from - location ?to - location) ; directed connectivity edges
    (person_at ?p - person ?l - location)   ; person is located at a location
  )

  ;; Move from NobHill to Presidio (directed, 17 minutes)
  (:durative-action move_nobhill_to_presidio
    :duration (= ?duration 17)
    :condition (and
      (at start (at NobHill))
      (at start (connected NobHill Presidio))
    )
    :effect (and
      (at start (not (at NobHill)))
      (at end (at Presidio))
    )
  )

  ;; Move from Presidio to NobHill (directed, 18 minutes)
  (:durative-action move_presidio_to_nobhill
    :duration (= ?duration 18)
    :condition (and
      (at start (at Presidio))
      (at start (connected Presidio NobHill))
    )
    :effect (and
      (at start (not (at Presidio)))
      (at end (at NobHill))
    )
  )

  ;; Meet a person at their location. Fixed 30 minutes meeting duration.
  ;; Requires you to be at the same location and the person to be present there.
  ;; Availability must hold over the entire meeting.
  (:durative-action meet_person
    :parameters (?p - person ?l - location)
    :duration (= ?duration 30)
    :condition (and
      (at start (at ?l))
      (at start (person_at ?p ?l))
      (over all (available ?p))
    )
    :effect (and
      (at end (met ?p))
    )
  )
)