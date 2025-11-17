(define (domain meetingplanningexample24)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time)

  (:predicates
    (at ?l - location ?t - time)
    (connected ?from - location ?to - location)
    (person_at ?p - person ?l - location)
    (met ?p - person)
    (succ ?t1 - time ?t2 - time)
    (chain17 ?t1 - time ?t2 - time)
    (chain18 ?t1 - time ?t2 - time)
    (chain30 ?t1 - time ?t2 - time)
    (chain30_avail ?t1 - time ?t2 - time)
  )

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

  (:action meet_matthew
    :parameters (?t - time ?t30 - time)
    :precondition (and
      (at presidio ?t)
      (person_at matthew presidio)
      (chain30_avail ?t ?t30)
      (chain30 ?t ?t30)
    )
    :effect (and
      (not (at presidio ?t))
      (at presidio ?t30)
      (met matthew)
    )
  )
)