(define (domain san_francisco_meet_anthony)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:constants
    nob_hill alamo_square - location
    anthony - person
  )

  (:predicates
    (connected ?from - location ?to - location)
    (plus_11 ?start - time ?end - time)
    (plus_15 ?start - time ?end - time)
    (at ?l - location)
    (current_time ?t - time)
    (person_at ?p - person ?l - location)
    (available ?p - person ?t - time)
    (can_meet_15 ?p - person ?t - time)
    (met_minimum ?p - person)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t_start - time ?t_end - time)
    :precondition (and
      (at ?from)
      (current_time ?t_start)
      (connected ?from ?to)
      (plus_11 ?t_start ?t_end)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t_start))
      (current_time ?t_end)
    )
  )

  (:action meet_anthony_minimum
    :parameters (?t_start - time ?t_end - time)
    :precondition (and
      (at alamo_square)
      (person_at anthony alamo_square)
      (current_time ?t_start)
      (plus_15 ?t_start ?t_end)
      (available anthony ?t_start)
      (can_meet_15 anthony ?t_start)
      (not (met_minimum anthony))
    )
    :effect (and
      (not (current_time ?t_start))
      (current_time ?t_end)
      (met_minimum anthony)
    )
  )
)