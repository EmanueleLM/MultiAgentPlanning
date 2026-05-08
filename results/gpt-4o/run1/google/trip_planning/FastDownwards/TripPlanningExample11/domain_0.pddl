(define (domain travel_plan)
  (:requirements :strips :typing :negative-preconditions)
  (:types city time)
  (:predicates
    (at ?city - city ?time - time)
    (has_flight ?from - city ?to - city)
    (attend_conference_valencia ?time - time)
    (visited_vienna)
    (visited_vilnius)
    (visited_valencia)
    (next ?t1 - time ?t2 - time)
  )
  
  (:action fly
    :parameters (?from - city ?to - city ?from_time - time ?to_time - time)
    :precondition (and
      (at ?from ?from_time)
      (has_flight ?from ?to)
      (next ?from_time ?to_time)
    )
    :effect (and
      (not (at ?from ?from_time))
      (at ?to ?to_time)
    )
  )

  (:action stay
    :parameters (?city - city ?start_time - time ?end_time - time)
    :precondition (and
      (at ?city ?start_time)
      (next ?start_time ?end_time)
    )
    :effect (and
      (not (at ?city ?start_time))
      (at ?city ?end_time)
    )
  )

  (:action mark_visit_vienna
    :parameters ()
    :precondition (and
      (at vienna ?time)
      (not (visited_vienna))
    )
    :effect (visited_vienna)
  )

  (:action mark_visit_vilnius
    :parameters ()
    :precondition (and
      (at vilnius ?time)
      (not (visited_vilnius))
    )
    :effect (visited_vilnius)
  )

  (:action mark_visit_valencia
    :parameters ()
    :precondition (and
      (at valencia ?time)
      (not (visited_valencia))
    )
    :effect (visited_valencia)
  )
)