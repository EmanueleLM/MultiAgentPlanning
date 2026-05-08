(define (domain european_trip_9_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day stay_token
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)

    (token_for_city ?t - stay_token ?c - city)
    (unused ?t - stay_token)
    (used ?t - stay_token)

    (in_valencia_day1)
    (in_valencia_day2)
  )

  (:action stay_one_day
    :parameters (?c - city ?d - day ?dnext - day ?t - stay_token)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?dnext)
      (token_for_city ?t ?c)
      (unused ?t)
      (not (and (= ?c valencia) (= ?d day_1)))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (unused ?t))
      (used ?t)
    )
  )

  (:action fly_one_day
    :parameters (?from - city ?to - city ?d - day ?dnext - day ?t - stay_token)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (next_day ?d ?dnext)
      (direct_flight ?from ?to)
      (token_for_city ?t ?from)
      (unused ?t)
      (not (and (= ?from valencia) (= ?d day_1)))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (unused ?t))
      (used ?t)
    )
  )

  (:action stay_day1_in_valencia
    :parameters (?t - stay_token)
    :precondition (and
      (at valencia)
      (current_day day_1)
      (token_for_city ?t valencia)
      (unused ?t)
      (in_valencia_day1)
    )
    :effect (and
      (not (current_day day_1))
      (current_day day_2)
      (not (unused ?t))
      (used ?t)
      (in_valencia_day2)
    )
  )
)