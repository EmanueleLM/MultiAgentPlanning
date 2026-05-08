(define (domain meet_george_san_francisco_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:constants
    north_beach haight_ashbury - location
    george - person
  )

  (:predicates
    (at ?l - location)
    (person_at ?p - person ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (travel_edge ?from - location ?to - location ?depart - time ?arrive - time)
    (meet45_edge ?start - time ?end - time)
    (available_start ?p - person ?t - time)
    (met ?p - person)
  )

  (:action wait
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

  (:action move
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (travel_edge ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_george_45
    :parameters (?start - time ?end - time)
    :precondition (and
      (at haight_ashbury)
      (person_at george haight_ashbury)
      (current_time ?start)
      (available_start george ?start)
      (meet45_edge ?start ?end)
      (not (met george))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met george)
    )
  )
)