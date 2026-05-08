(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    person location time
  )

  (:predicates
    (at ?p - person ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (travel_arrives ?from - location ?to - location ?t_depart - time ?t_arrive - time)
    (available ?p - person ?l - location ?t_start - time ?t_end - time)
    (met ?p - person)
  )

  (:action wait
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?l)
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
      (at traveler ?from)
      (current_time ?t_depart)
      (travel_arrives ?from ?to ?t_depart ?t_arrive)
    )
    :effect (and
      (not (at traveler ?from))
      (at traveler ?to)
      (not (current_time ?t_depart))
      (current_time ?t_arrive)
    )
  )

  (:action meet_minimum_duration
    :parameters (?friend - person ?l - location ?t_start - time ?t_end - time)
    :precondition (and
      (at traveler ?l)
      (at ?friend ?l)
      (current_time ?t_start)
      (available ?friend ?l ?t_start ?t_end)
      (not (met ?friend))
    )
    :effect (and
      (not (current_time ?t_start))
      (current_time ?t_end)
      (met ?friend)
    )
  )
)