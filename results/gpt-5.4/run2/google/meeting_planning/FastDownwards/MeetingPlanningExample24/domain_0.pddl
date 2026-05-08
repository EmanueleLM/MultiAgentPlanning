(define (domain meet_matthew_san_francisco_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent
    traveler friend - agent
    location
    time
  )

  (:predicates
    (at ?a - agent ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (connected_depart_arrive ?from - location ?to - location ?t_depart - time ?t_arrive - time)
    (available ?f - friend ?l - location ?t_start - time ?t_end - time)
    (met_minimum ?f - friend)
  )

  (:action wait_to_next
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t_depart - time ?t_arrive - time)
    :precondition (and
      (at you ?from)
      (current_time ?t_depart)
      (connected_depart_arrive ?from ?to ?t_depart ?t_arrive)
    )
    :effect (and
      (not (at you ?from))
      (at you ?to)
      (not (current_time ?t_depart))
      (current_time ?t_arrive)
    )
  )

  (:action meet_matthew_30m
    :parameters (?t_start - time ?t_end - time ?l - location)
    :precondition (and
      (current_time ?t_start)
      (at you ?l)
      (at matthew ?l)
      (available matthew ?l ?t_start t1515)
      (available matthew presidio t1100 t1515)
      (not (met_minimum matthew))
      (not (current_time t1130))
    )
    :effect (and
      (not (current_time ?t_start))
      (current_time ?t_end)
      (met_minimum matthew)
    )
  )
)