(define (domain san_francisco_day_meeting)
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
    (travel_nob_hill_to_presidio ?t1 - time ?t2 - time)
    (travel_presidio_to_nob_hill ?t1 - time ?t2 - time)
    (available_start ?p - person ?t - time)
    (available_end ?p - person ?t - time)
    (meeting_slot_timothy ?t1 - time ?t2 - time)
    (met ?p - person)
  )

  (:action wait
    :parameters (?from - time ?to - time ?l - location)
    :precondition (and
      (current_time ?from)
      (at ?l)
      (next_time ?from ?to)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action move_nob_hill_to_presidio
    :parameters (?from - time ?to - time)
    :precondition (and
      (current_time ?from)
      (at nob_hill)
      (travel_nob_hill_to_presidio ?from ?to)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
      (not (at nob_hill))
      (at presidio)
    )
  )

  (:action move_presidio_to_nob_hill
    :parameters (?from - time ?to - time)
    :precondition (and
      (current_time ?from)
      (at presidio)
      (travel_presidio_to_nob_hill ?from ?to)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
      (not (at presidio))
      (at nob_hill)
    )
  )

  (:action meet_timothy_for_30_minutes
    :parameters (?start - time ?end - time)
    :precondition (and
      (current_time ?start)
      (at presidio)
      (meeting_slot_timothy ?start ?end)
      (available_start timothy ?start)
      (available_end timothy t1900)
      (not (met timothy))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met timothy)
    )
  )
)