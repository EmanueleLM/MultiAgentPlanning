(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person)

  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (person_at ?p - person ?l - location)
    (has_met ?p - person)
    (travel_duration ?from - location ?to - location ?t_start - time ?t_end - time)
    (meeting_duration ?p - person ?t_start - time ?t_end - time)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (time_at ?t1)
      (travel_duration ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (time_at ?t1))
      (time_at ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?loc)
      (time_at ?t1)
      (person_at ?p ?loc)
      (meeting_duration ?p ?t1 ?t2)
    )
    :effect (and
      (has_met ?p)
      (not (time_at ?t1))
      (time_at ?t2)
    )
  )
)