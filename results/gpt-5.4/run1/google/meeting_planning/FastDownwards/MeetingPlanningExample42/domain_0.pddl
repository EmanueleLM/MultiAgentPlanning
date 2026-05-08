(define (domain san_francisco_timothy_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?l - location)
    (timothy_at ?l - location)
    (current_time ?t - timepoint)
    (next_time ?from - timepoint ?to - timepoint)
    (route_17 ?from - location ?to - location)
    (after_17 ?from - timepoint ?to - timepoint)
    (meeting_window_start ?p - person ?t - timepoint)
    (meeting_window_end ?p - person ?t - timepoint)
    (thirty_min_later ?from - timepoint ?to - timepoint)
    (met ?p - person)
  )

  (:action wait
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and
      (current_time ?from)
      (next_time ?from ?to)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action travel_17
    :parameters (?from_loc - location ?to_loc - location ?from_t - timepoint ?to_t - timepoint)
    :precondition (and
      (at ?from_loc)
      (current_time ?from_t)
      (route_17 ?from_loc ?to_loc)
      (after_17 ?from_t ?to_t)
    )
    :effect (and
      (not (at ?from_loc))
      (at ?to_loc)
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action meet_timothy_30
    :parameters ()
    :precondition (and
      (at presidio)
      (timothy_at presidio)
      (current_time t_1300)
      (thirty_min_later t_1300 t_1330)
      (meeting_window_start timothy t_1300)
      (meeting_window_end timothy t_1900)
      (not (met timothy))
    )
    :effect (and
      (not (current_time t_1300))
      (current_time t_1330)
      (met timothy)
    )
  )
)