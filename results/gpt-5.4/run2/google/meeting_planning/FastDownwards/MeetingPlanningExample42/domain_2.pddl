(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing)

  (:types
    traveler
    location
    time
  )

  (:predicates
    (at ?a - traveler ?l - location)
    (time_now ?t - time)
    (next ?t1 - time ?t2 - time)
    (travel ?from - location ?to - location ?depart - time ?arrive - time)
    (met_timothy_minimum)
  )

  (:action wait
    :parameters (?from - time ?to - time)
    :precondition (and
      (time_now ?from)
      (next ?from ?to)
    )
    :effect (and
      (not (time_now ?from))
      (time_now ?to)
    )
  )

  (:action move
    :parameters (?a - traveler ?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?a ?from)
      (time_now ?depart)
      (travel ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (time_now ?depart))
      (time_now ?arrive)
    )
  )

  (:action meet_timothy_30
    :parameters (?a - traveler)
    :precondition (and
      (at ?a presidio)
      (time_now t1317)
    )
    :effect (met_timothy_minimum)
  )
)