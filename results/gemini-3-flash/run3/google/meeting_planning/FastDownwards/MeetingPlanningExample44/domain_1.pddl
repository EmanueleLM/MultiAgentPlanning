(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location person time)

  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (met ?p - person)
    (person_at ?p - person ?l - location)
    (available_at ?p - person ?t - time)
    (next_13_min ?t1 ?t2 - time)
    (next_12_min ?t1 ?t2 - time)
    (next_105_min ?t1 ?t2 - time)
    (connected_13 ?l1 ?l2 - location)
    (connected_12 ?l1 ?l2 - location)
  )

  (:action drive_13_min
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?from) (time_at ?t1) (next_13_min ?t1 ?t2) (connected_13 ?from ?to))
    :effect (and (at ?to) (not (at ?from)) (time_at ?t2) (not (time_at ?t1)))
  )

  (:action drive_12_min
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?from) (time_at ?t1) (next_12_min ?t1 ?t2) (connected_12 ?from ?to))
    :effect (and (at ?to) (not (at ?from)) (time_at ?t2) (not (time_at ?t1)))
  )

  (:action meet_105_min
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l) (person_at ?p ?l) (time_at ?t1) (next_105_min ?t1 ?t2)
                       (available_at ?p ?t1) (available_at ?p ?t2))
    :effect (and (met ?p) (time_at ?t2) (not (time_at ?t1)))
  )
)