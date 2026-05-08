(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types
    location
    time
    person
  )

  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (met ?p - person)
    (can_travel ?from - location ?to - location ?t_start - time ?t_end - time)
    (can_wait ?l - location ?t_start - time ?t_end - time)
    (can_meet ?p - person ?l - location ?t_start - time ?t_end - time)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t_start - time ?t_end - time)
    :precondition (and
      (at ?from)
      (time_at ?t_start)
      (can_travel ?from ?to ?t_start ?t_end)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (time_at ?t_start))
      (time_at ?t_end)
    )
  )

  (:action wait
    :parameters (?l - location ?t_start - time ?t_end - time)
    :precondition (and
      (at ?l)
      (time_at ?t_start)
      (can_wait ?l ?t_start ?t_end)
    )
    :effect (and
      (not (time_at ?t_start))
      (time_at ?t_end)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t_start - time ?t_end - time)
    :precondition (and
      (at ?l)
      (time_at ?t_start)
      (can_meet ?p ?l ?t_start ?t_end)
    )
    :effect (and
      (met ?p)
      (not (time_at ?t_start))
      (time_at ?t_end)
    )
  )
)