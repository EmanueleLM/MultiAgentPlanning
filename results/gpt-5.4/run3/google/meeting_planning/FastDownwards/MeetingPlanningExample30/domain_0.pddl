(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)

    (travel_17 ?from - location ?to - location)
    (travel_18 ?from - location ?to - location)

    (next ?t1 - timepoint ?t2 - timepoint)
    (after_17 ?t1 - timepoint ?t2 - timepoint)
    (after_18 ?t1 - timepoint ?t2 - timepoint)

    (person_at ?p - person ?l - location)
    (available_at ?p - person ?t - timepoint)

    (met_minimum ?p - person)
  )

  (:action wait
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and
      (current_time ?from)
      (next ?from ?to)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action move_17
    :parameters (?from_l - location ?to_l - location ?from_t - timepoint ?to_t - timepoint)
    :precondition (and
      (at ?from_l)
      (current_time ?from_t)
      (travel_17 ?from_l ?to_l)
      (after_17 ?from_t ?to_t)
    )
    :effect (and
      (not (at ?from_l))
      (at ?to_l)
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action move_18
    :parameters (?from_l - location ?to_l - location ?from_t - timepoint ?to_t - timepoint)
    :precondition (and
      (at ?from_l)
      (current_time ?from_t)
      (travel_18 ?from_l ?to_l)
      (after_18 ?from_t ?to_t)
    )
    :effect (and
      (not (at ?from_l))
      (at ?to_l)
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action meet_stephanie_120
    :parameters ()
    :precondition (and
      (at north_beach)
      (person_at stephanie north_beach)
      (current_time t_930)
      (available_at stephanie t_930)
      (not (met_minimum stephanie))
    )
    :effect (and
      (not (current_time t_930))
      (current_time t_1130)
      (met_minimum stephanie)
    )
  )
)