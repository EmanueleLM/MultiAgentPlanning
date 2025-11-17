(define (domain meetingplanningexample24)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time)

  (:predicates
    (at ?loc - location ?t - time)                 ; agent location at time
    (connected ?from - location ?to - location)    ; directed road
    (person_at ?p - person ?loc - location)        ; static person location
    (met ?p - person)                              ; meeting achieved
    (succ ?t1 - time ?t2 - time)                   ; immediate successor t1->t2
    (chain17 ?t1 - time ?t2 - time)                ; t1 -> t2 is +17 minutes
    (chain18 ?t1 - time ?t2 - time)                ; t1 -> t2 is +18 minutes
    (chain30 ?t1 - time ?t2 - time)                ; t1 -> t2 is +30 minutes
    (chain30_avail ?t1 - time ?t2 - time)          ; 30-minute slot fully inside availability
  )

  ;; Wait one minute: move occupancy forward by one time step at same location.
  (:action wait
    :parameters (?loc - location ?t - time ?t1 - time)
    :precondition (and
      (at ?loc ?t)
      (succ ?t ?t1)
    )
    :effect (and
      (not (at ?loc ?t))
      (at ?loc ?t1)
    )
  )

  ;; Directed travel actions with fixed discrete durations encoded via chain predicates.
  (:action move_nobhill_to_presidio
    :parameters (?t - time ?t17 - time)
    :precondition (and
      (at nobhill ?t)
      (connected nobhill presidio)
      (chain17 ?t ?t17)
    )
    :effect (and
      (not (at nobhill ?t))
      (at presidio ?t17)
    )
  )

  (:action move_presidio_to_nobhill
    :parameters (?t - time ?t18 - time)
    :precondition (and
      (at presidio ?t)
      (connected presidio nobhill)
      (chain18 ?t ?t18)
    )
    :effect (and
      (not (at presidio ?t))
      (at nobhill ?t18)
    )
  )

  ;; Meeting action: requires contiguous occupancy for 30 minutes and that the 30-minute
  ;; block is fully within Matthew's availability (encoded by chain30_avail).
  (:action meet_matthew
    :parameters (?t - time ?t30 - time)
    :precondition (and
      (at presidio ?t)
      (person_at matthew presidio)
      (chain30 ?t ?t30)
      (chain30_avail ?t ?t30)
    )
    :effect (and
      (not (at presidio ?t))
      (at presidio ?t30)
      (met matthew)
    )
  )
)