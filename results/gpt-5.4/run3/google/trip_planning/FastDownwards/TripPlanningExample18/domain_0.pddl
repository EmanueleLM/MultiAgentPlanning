(define (domain european_trip_11_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    quota_token
  )

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (last_day ?d - day)

    (at_on_day ?c - city ?d - day)
    (assigned_day ?d - day)

    (can_follow ?c1 - city ?c2 - city)

    (token_for_city ?t - quota_token ?c - city)
    (unused_token ?t - quota_token)

    (meeting_window_day ?d - day)
    (met_friends)

    (city_bucharest ?c - city)
  )

  (:action assign_first_day
    :parameters (?c - city ?t - quota_token)
    :precondition (and
      (not (assigned_day day_1))
      (token_for_city ?t ?c)
      (unused_token ?t)
    )
    :effect (and
      (at_on_day ?c day_1)
      (assigned_day day_1)
      (not (unused_token ?t))
      (current_day day_1)
    )
  )

  (:action assign_next_day_normal
    :parameters (?d1 - day ?d2 - day ?c1 - city ?c2 - city ?t - quota_token)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on_day ?c1 ?d1)
      (not (assigned_day ?d2))
      (can_follow ?c1 ?c2)
      (token_for_city ?t ?c2)
      (unused_token ?t)
      (not (and (city_bucharest ?c2) (meeting_window_day ?d2)))
    )
    :effect (and
      (at_on_day ?c2 ?d2)
      (assigned_day ?d2)
      (not (unused_token ?t))
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action assign_next_day_meet_bucharest
    :parameters (?d1 - day ?d2 - day ?c1 - city ?c2 - city ?t - quota_token)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on_day ?c1 ?d1)
      (not (assigned_day ?d2))
      (can_follow ?c1 ?c2)
      (token_for_city ?t ?c2)
      (unused_token ?t)
      (city_bucharest ?c2)
      (meeting_window_day ?d2)
    )
    :effect (and
      (at_on_day ?c2 ?d2)
      (assigned_day ?d2)
      (not (unused_token ?t))
      (not (current_day ?d1))
      (current_day ?d2)
      (met_friends)
    )
  )
)