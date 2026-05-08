(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location person time)

  (:predicates
    (at ?p - person ?l - location)
    (time_at ?t - time)
    (met ?p - person)
    (can_travel ?from - location ?to - location ?t1 - time ?t2 - time)
    (can_meet ?p - person ?l - location ?t1 - time ?t2 - time)
    (can_wait ?p - person ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?p ?from) (time_at ?t1) (can_travel ?from ?to ?t1 ?t2))
    :effect (and (not (at ?p ?from)) (at ?p ?to) (not (time_at ?t1)) (time_at ?t2))
  )

  (:action meet
    :parameters (?actor - person ?friend - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?actor ?l) (at ?friend ?l) (time_at ?t1) (can_meet ?friend ?l ?t1 ?t2))
    :effect (and (met ?friend) (not (time_at ?t1)) (time_at ?t2))
  )

  (:action wait
    :parameters (?p - person ?t1 - time ?t2 - time)
    :precondition (and (time_at ?t1) (can_wait ?p ?t1 ?t2))
    :effect (and (not (time_at ?t1)) (time_at ?t2))
  )
)