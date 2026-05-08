(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (connected ?from - location ?to - location)
    (travel_time_900 ?from - location ?to - location ?arrive - time)
    (next_time ?t1 - time ?t2 - time)
    (available_at ?p - person ?loc - location ?start - time ?end - time)

    (at ?loc - location)
    (person_at ?p - person ?loc - location)
    (current_time ?t - time)
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

  (:action travel_from_900
    :parameters (?from - location ?to - location ?arrive - time)
    :precondition (and
      (current_time t900)
      (at ?from)
      (connected ?from ?to)
      (travel_time_900 ?from ?to ?arrive)
    )
    :effect (and
      (not (current_time t900))
      (current_time ?arrive)
      (not (at ?from))
      (at ?to)
    )
  )

  (:action meet_sarah_45
    :parameters ()
    :precondition (and
      (current_time t1415)
      (at bayview)
      (person_at sarah bayview)
      (available_at sarah bayview t1415 t1730)
      (not (met sarah))
    )
    :effect (and
      (not (current_time t1415))
      (current_time t1500)
      (met sarah)
    )
  )
)