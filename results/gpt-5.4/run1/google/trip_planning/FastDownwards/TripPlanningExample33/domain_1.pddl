(define (domain european_trip_13_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (day_now ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)

    (in_barcelona ?d - day)
    (in_krakow ?d - day)
    (in_rome ?d - day)

    (friend_window ?d - day)
    (met_friend)
  )

  (:action stay_barcelona
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (day_now ?d)
      (next_day ?d ?d2)
      (at barcelona)
      (not (in_barcelona ?d))
    )
    :effect (and
      (not (day_now ?d))
      (day_now ?d2)
      (in_barcelona ?d)
    )
  )

  (:action stay_krakow
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (day_now ?d)
      (next_day ?d ?d2)
      (at krakow)
      (not (in_krakow ?d))
    )
    :effect (and
      (not (day_now ?d))
      (day_now ?d2)
      (in_krakow ?d)
    )
  )

  (:action stay_krakow_meet_friend
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (day_now ?d)
      (next_day ?d ?d2)
      (at krakow)
      (friend_window ?d)
      (not (in_krakow ?d))
      (not (met_friend))
    )
    :effect (and
      (not (day_now ?d))
      (day_now ?d2)
      (in_krakow ?d)
      (met_friend)
    )
  )

  (:action stay_rome
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (day_now ?d)
      (next_day ?d ?d2)
      (at rome)
      (not (in_rome ?d))
    )
    :effect (and
      (not (day_now ?d))
      (day_now ?d2)
      (in_rome ?d)
    )
  )

  (:action fly_barcelona_krakow
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (day_now ?d)
      (next_day ?d ?d2)
      (at barcelona)
      (direct barcelona krakow)
      (not (in_krakow ?d))
    )
    :effect (and
      (not (day_now ?d))
      (day_now ?d2)
      (not (at barcelona))
      (at krakow)
      (in_krakow ?d)
    )
  )

  (:action fly_barcelona_krakow_meet_friend
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (day_now ?d)
      (next_day ?d ?d2)
      (at barcelona)
      (direct barcelona krakow)
      (friend_window ?d)
      (not (in_krakow ?d))
      (not (met_friend))
    )
    :effect (and
      (not (day_now ?d))
      (day_now ?d2)
      (not (at barcelona))
      (at krakow)
      (in_krakow ?d)
      (met_friend)
    )
  )

  (:action fly_krakow_barcelona
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (day_now ?d)
      (next_day ?d ?d2)
      (at krakow)
      (direct krakow barcelona)
      (not (in_barcelona ?d))
    )
    :effect (and
      (not (day_now ?d))
      (day_now ?d2)
      (not (at krakow))
      (at barcelona)
      (in_barcelona ?d)
    )
  )

  (:action fly_barcelona_rome
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (day_now ?d)
      (next_day ?d ?d2)
      (at barcelona)
      (direct barcelona rome)
      (not (in_rome ?d))
    )
    :effect (and
      (not (day_now ?d))
      (day_now ?d2)
      (not (at barcelona))
      (at rome)
      (in_rome ?d)
    )
  )

  (:action fly_rome_barcelona
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (day_now ?d)
      (next_day ?d ?d2)
      (at rome)
      (direct rome barcelona)
      (not (in_barcelona ?d))
    )
    :effect (and
      (not (day_now ?d))
      (day_now ?d2)
      (not (at rome))
      (at barcelona)
      (in_barcelona ?d)
    )
  )
)