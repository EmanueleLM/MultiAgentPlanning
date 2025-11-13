(define (domain meet-matthew)
  (:requirements :strips :typing :negative-preconditions)
  (:types traveler location person timeslot)
  (:predicates
    ; state
    (at ?a - traveler ?l - location)
    (time ?t - timeslot)
    (next ?t1 - timeslot ?t2 - timeslot)

    ; constraints
    (in-window ?t - timeslot)                           ; meeting may start at these slots (each is 15 min)
    (meeting-location ?p - person ?l - location)        ; where a person can be met
    (leg ?from - location ?to - location ?td ?ta - timeslot) ; directed travel leg with explicit departure/arrival slots

    ; achievement
    (met ?p - person)
  )

  ; The timeline advances exactly one slot per action by swapping (time ?t1) to (time ?t2).
  ; Chosen schedule (best = earliest feasible within window with minimal commitments):
  ;   - Wait at alamo_square from 09:00 to 13:15
  ;   - Travel alamo_square -> sunset_district from 13:15 to 13:30 (directed leg)
  ;   - Meet matthew at sunset_district from 13:30 to 13:45 (15 minutes, within 13:30–14:30 window)

  (:action wait
    :parameters (?a - traveler ?t1 - timeslot ?t2 - timeslot)
    :precondition (and
      (time ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (time ?t1))
      (time ?t2)
    )
  )

  (:action travel
    :parameters (?a - traveler ?from - location ?to - location ?td - timeslot ?ta - timeslot)
    :precondition (and
      (at ?a ?from)
      (time ?td)
      (leg ?from ?to ?td ?ta)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (time ?td))
      (time ?ta)
    )
  )

  (:action meet
    :parameters (?a - traveler ?p - person ?l - location ?t1 - timeslot ?t2 - timeslot)
    :precondition (and
      (at ?a ?l)
      (meeting-location ?p ?l)
      (time ?t1)
      (next ?t1 ?t2)
      (in-window ?t1)     ; enforce the 13:30–14:30 window as hard constraint
      (not (met ?p))      ; meet exactly once
    )
    :effect (and
      (met ?p)
      (not (time ?t1))
      (time ?t2)          ; consumes one 15-minute slot
    )
  )
)