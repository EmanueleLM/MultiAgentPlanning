(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (cur_time ?t - time)
    (met ?p - person)
    (person_at ?p - person ?l - location ?t - time)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 ?t2 - time)
  )

  (:action travel
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?from)
      (cur_time ?t1)
      (can_travel ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
      (not (cur_time ?t1))
      (cur_time ?t2)
    )
  )

  (:action meet
    :parameters (?me - person ?friend - person ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?me ?loc)
      (cur_time ?t1)
      (person_at ?friend ?loc ?t1)
      (person_at ?friend ?loc ?t2)
      (can_meet ?friend ?loc ?t1 ?t2)
    )
    :effect (and
      (met ?friend)
      (not (cur_time ?t1))
      (cur_time ?t2)
    )
  )
)