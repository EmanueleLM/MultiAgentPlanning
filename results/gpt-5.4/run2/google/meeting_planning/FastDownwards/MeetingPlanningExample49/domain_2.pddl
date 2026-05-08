(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (connected ?from - location ?to - location)
    (travel_time_from_t9_00 ?from - location ?to - location ?arrive - time)
    (next_time ?t1 - time ?t2 - time)
    (available_at ?p - person ?loc - location ?start - time ?end - time)
    (person_at ?p - person ?loc - location)
    (at ?loc - location)
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

  (:action travel_from_t9_00
    :parameters (?from - location ?to - location ?arrive - time)
    :precondition (and
      (current_time t9_00)
      (at ?from)
      (connected ?from ?to)
      (travel_time_from_t9_00 ?from ?to ?arrive)
    )
    :effect (and
      (not (current_time t9_00))
      (current_time ?arrive)
      (not (at ?from))
      (at ?to)
    )
  )

  (:action meet_sarah_45
    :parameters ()
    :precondition (and
      (current_time t14_15)
      (at bayview)
      (person_at sarah bayview)
      (available_at sarah bayview t14_15 t17_30)
      (not (met sarah))
    )
    :effect (and
      (not (current_time t14_15))
      (current_time t15_00)
      (met sarah)
    )
  )
)