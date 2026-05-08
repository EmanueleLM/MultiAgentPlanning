(define (domain san_francisco_joseph_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (travel_9 ?from - location ?to - location ?t1 - time ?t2 - time)
    (available ?p - person ?t_start - time ?t_end - time)
    (met ?p - person)
  )

  (:action wait
    :parameters (?from - time ?to - time)
    :precondition (and
      (current_time ?from)
      (next_time ?from ?to)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action move_9
    :parameters (?from_loc - location ?to_loc - location ?from_t - time ?to_t - time)
    :precondition (and
      (at ?from_loc)
      (current_time ?from_t)
      (travel_9 ?from_loc ?to_loc ?from_t ?to_t)
    )
    :effect (and
      (not (at ?from_loc))
      (at ?to_loc)
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action meet_joseph_15
    :parameters ()
    :precondition (and
      (at union_square)
      (current_time t_0930pm)
      (available joseph t_0930pm t_0945pm)
      (not (met joseph))
    )
    :effect (and
      (met joseph)
      (not (current_time t_0930pm))
      (current_time t_0945pm)
    )
  )
)