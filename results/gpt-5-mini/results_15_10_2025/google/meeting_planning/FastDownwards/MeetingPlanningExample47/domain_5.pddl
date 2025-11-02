(define (domain schedule-meetings)
  (:requirements :typing :negative-preconditions :adl)
  (:types person location time duration)
  (:predicates
    (at ?p - person ?l - location)
    (time-point ?t - time)
    (time-add ?t1 - time ?d - duration ?t2 - time)
    (travel-duration ?from - location ?to - location ?d - duration)
    (available ?p - person ?t1 - time ?t2 - time)
    (met ?p - person)
  )

  (:action travel
    :parameters (?tr - person ?from - location ?to - location ?t1 - time ?d - duration ?t2 - time)
    :precondition (and
      (at ?tr ?from)
      (time-point ?t1)
      (travel-duration ?from ?to ?d)
      (time-add ?t1 ?d ?t2)
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
      (not (time-point ?t1))
      (time-point ?t2)
    )
  )

  (:action wait
    :parameters (?tr - person ?t1 - time ?d - duration ?t2 - time)
    :precondition (and
      (time-point ?t1)
      (time-add ?t1 ?d ?t2)
    )
    :effect (and
      (not (time-point ?t1))
      (time-point ?t2)
    )
  )

  (:action meet
    :parameters (?tr - person ?friend - person ?loc - location ?t1 - time ?d - duration ?t2 - time)
    :precondition (and
      (at ?tr ?loc)
      (at ?friend ?loc)
      (time-point ?t1)
      (time-add ?t1 ?d ?t2)
      (available ?friend ?t1 ?t2)
      (not (met ?friend))
    )
    :effect (and
      (met ?friend)
      (not (time-point ?t1))
      (time-point ?t2)
    )
  )
)