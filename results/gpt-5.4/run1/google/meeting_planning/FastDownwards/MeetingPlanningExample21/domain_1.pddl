(define (domain san_francisco_meet_margaret)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:constants
    mission_district haight_ashbury - location
    margaret - person
    t_900 t_912 t_315pm t_345pm - time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (connected ?from - location ?to - location)
    (travel_arrival ?from - location ?to - location ?depart - time ?arrive - time)
    (available_at ?p - person ?l - location ?t - time)
    (met ?p - person)
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time ?l - location)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (at ?l)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t_depart - time ?t_arrive - time)
    :precondition (and
      (at ?from)
      (current_time ?t_depart)
      (connected ?from ?to)
      (travel_arrival ?from ?to ?t_depart ?t_arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t_depart))
      (current_time ?t_arrive)
    )
  )

  (:action meet_margaret_30min
    :parameters ()
    :precondition (and
      (at haight_ashbury)
      (current_time t_315pm)
      (available_at margaret haight_ashbury t_315pm)
      (available_at margaret haight_ashbury t_345pm)
      (not (met margaret))
    )
    :effect (and
      (not (current_time t_315pm))
      (current_time t_345pm)
      (met margaret)
    )
  )
)