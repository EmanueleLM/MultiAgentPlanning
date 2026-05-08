(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location)
    (time_at ?t - time)
    (met ?p - person)
    (next_minute ?t1 - time ?t2 - time)
    (is_travel_time ?from - location ?to - location ?t1 - time ?t2 - time)
    (is_meeting_time ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?p ?from) (time_at ?t1) (is_travel_time ?from ?to ?t1 ?t2))
    :effect (and (not (at ?p ?from)) (at ?p ?to) (not (time_at ?t1)) (time_at ?t2))
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (time_at ?t1) (next_minute ?t1 ?t2))
    :effect (and (not (time_at ?t1)) (time_at ?t2))
  )

  (:action meet
    :parameters (?me - person ?p - person ?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at ?me ?loc) (at ?p ?loc) (time_at ?t1) (is_meeting_time ?t1 ?t2))
    :effect (and (met ?p) (not (time_at ?t1)) (time_at ?t2))
  )
)