(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time_point friend)

  (:predicates
    (at_loc ?l - location)
    (time_at ?t - time_point)
    (precedes ?t1 ?t2 - time_point)
    (met ?f - friend)
    (travel_time ?from ?to - location ?t1 ?t2 - time_point)
    (can_meet ?f - friend ?l - location ?t1 ?t2 - time_point)
  )

  (:action travel
    :parameters (?from ?to - location ?t1 ?t2 - time_point)
    :precondition (and
      (at_loc ?from)
      (time_at ?t1)
      (travel_time ?from ?to ?t1 ?t2)
    )
    :effect (and
      (at_loc ?to)
      (not (at_loc ?from))
      (time_at ?t2)
      (not (time_at ?t1))
    )
  )

  (:action wait
    :parameters (?l - location ?t1 ?t2 - time_point)
    :precondition (and
      (at_loc ?l)
      (time_at ?t1)
      (precedes ?t1 ?t2)
    )
    :effect (and
      (time_at ?t2)
      (not (time_at ?t1))
    )
  )

  (:action meet
    :parameters (?f - friend ?l - location ?t1 ?t2 - time_point)
    :precondition (and
      (at_loc ?l)
      (time_at ?t1)
      (can_meet ?f ?l ?t1 ?t2)
    )
    :effect (and
      (met ?f)
      (time_at ?t2)
      (not (time_at ?t1))
    )
  )
)