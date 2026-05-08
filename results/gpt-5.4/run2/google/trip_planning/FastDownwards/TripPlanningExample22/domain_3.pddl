(define (domain tripplanningexample22)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)

    (current_city ?c - city)
    (current_day ?d - day)

    (in_berlin_segment)
    (in_frankfurt_segment)
    (in_bucharest_segment)

    (finished_berlin_segment)
    (finished_frankfurt_segment)

    (berlin_day ?d - day)
    (frankfurt_day ?d - day)
    (bucharest_day ?d - day)
  )

  (:action stay_berlin
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_city berlin)
      (current_day ?d)
      (next_day ?d ?dn)
      (in_berlin_segment)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (berlin_day ?dn)
    )
  )

  (:action finish_berlin_and_fly_to_frankfurt
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_city berlin)
      (current_day ?d)
      (next_day ?d ?dn)
      (in_berlin_segment)
      (direct_flight berlin frankfurt)
    )
    :effect (and
      (not (current_city berlin))
      (current_city frankfurt)
      (not (current_day ?d))
      (current_day ?dn)
      (not (in_berlin_segment))
      (finished_berlin_segment)
      (in_frankfurt_segment)
      (frankfurt_day ?dn)
    )
  )

  (:action stay_frankfurt
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_city frankfurt)
      (current_day ?d)
      (next_day ?d ?dn)
      (in_frankfurt_segment)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (frankfurt_day ?dn)
    )
  )

  (:action finish_frankfurt_and_fly_to_bucharest
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_city frankfurt)
      (current_day ?d)
      (next_day ?d ?dn)
      (in_frankfurt_segment)
      (finished_berlin_segment)
      (direct_flight frankfurt bucharest)
    )
    :effect (and
      (not (current_city frankfurt))
      (current_city bucharest)
      (not (current_day ?d))
      (current_day ?dn)
      (not (in_frankfurt_segment))
      (finished_frankfurt_segment)
      (in_bucharest_segment)
      (bucharest_day ?dn)
    )
  )

  (:action stay_bucharest
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_city bucharest)
      (current_day ?d)
      (next_day ?d ?dn)
      (in_bucharest_segment)
      (finished_frankfurt_segment)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (bucharest_day ?dn)
    )
  )
)