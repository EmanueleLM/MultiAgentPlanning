(define (domain european_trip_13_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    count_barcelona
    count_krakow
    count_rome
  )

  (:predicates
    (at ?c - city)
    (today ?d - day)
    (next_day ?d1 - day ?d2 - day)

    (direct ?from - city ?to - city)

    (barcelona_count ?b - count_barcelona)
    (next_barcelona ?b1 - count_barcelona ?b2 - count_barcelona)

    (krakow_count ?k - count_krakow)
    (next_krakow ?k1 - count_krakow ?k2 - count_krakow)

    (rome_count ?r - count_rome)
    (next_rome ?r1 - count_rome ?r2 - count_rome)

    (meeting_window ?d - day)
    (met_friend_in_krakow)

    (visited ?c - city)
  )

  (:action stay_barcelona
    :parameters (?d - day ?d2 - day ?b1 - count_barcelona ?b2 - count_barcelona)
    :precondition (and
      (today ?d)
      (next_day ?d ?d2)
      (at barcelona)
      (barcelona_count ?b1)
      (next_barcelona ?b1 ?b2)
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (not (barcelona_count ?b1))
      (barcelona_count ?b2)
      (visited barcelona)
    )
  )

  (:action stay_krakow
    :parameters (?d - day ?d2 - day ?k1 - count_krakow ?k2 - count_krakow)
    :precondition (and
      (today ?d)
      (next_day ?d ?d2)
      (at krakow)
      (krakow_count ?k1)
      (next_krakow ?k1 ?k2)
      (not (meeting_window ?d))
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (not (krakow_count ?k1))
      (krakow_count ?k2)
      (visited krakow)
    )
  )

  (:action stay_krakow_meeting
    :parameters (?d - day ?d2 - day ?k1 - count_krakow ?k2 - count_krakow)
    :precondition (and
      (today ?d)
      (next_day ?d ?d2)
      (at krakow)
      (krakow_count ?k1)
      (next_krakow ?k1 ?k2)
      (meeting_window ?d)
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (not (krakow_count ?k1))
      (krakow_count ?k2)
      (visited krakow)
      (met_friend_in_krakow)
    )
  )

  (:action stay_rome
    :parameters (?d - day ?d2 - day ?r1 - count_rome ?r2 - count_rome)
    :precondition (and
      (today ?d)
      (next_day ?d ?d2)
      (at rome)
      (rome_count ?r1)
      (next_rome ?r1 ?r2)
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (not (rome_count ?r1))
      (rome_count ?r2)
      (visited rome)
    )
  )

  (:action fly_to_barcelona_and_stay
    :parameters (?from - city ?d - day ?d2 - day ?b1 - count_barcelona ?b2 - count_barcelona)
    :precondition (and
      (today ?d)
      (next_day ?d ?d2)
      (at ?from)
      (direct ?from barcelona)
      (barcelona_count ?b1)
      (next_barcelona ?b1 ?b2)
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (not (at ?from))
      (at barcelona)
      (not (barcelona_count ?b1))
      (barcelona_count ?b2)
      (visited barcelona)
    )
  )

  (:action fly_to_krakow_and_stay
    :parameters (?from - city ?d - day ?d2 - day ?k1 - count_krakow ?k2 - count_krakow)
    :precondition (and
      (today ?d)
      (next_day ?d ?d2)
      (at ?from)
      (direct ?from krakow)
      (krakow_count ?k1)
      (next_krakow ?k1 ?k2)
      (not (meeting_window ?d))
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (not (at ?from))
      (at krakow)
      (not (krakow_count ?k1))
      (krakow_count ?k2)
      (visited krakow)
    )
  )

  (:action fly_to_krakow_and_stay_meeting
    :parameters (?from - city ?d - day ?d2 - day ?k1 - count_krakow ?k2 - count_krakow)
    :precondition (and
      (today ?d)
      (next_day ?d ?d2)
      (at ?from)
      (direct ?from krakow)
      (krakow_count ?k1)
      (next_krakow ?k1 ?k2)
      (meeting_window ?d)
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (not (at ?from))
      (at krakow)
      (not (krakow_count ?k1))
      (krakow_count ?k2)
      (visited krakow)
      (met_friend_in_krakow)
    )
  )

  (:action fly_to_rome_and_stay
    :parameters (?from - city ?d - day ?d2 - day ?r1 - count_rome ?r2 - count_rome)
    :precondition (and
      (today ?d)
      (next_day ?d ?d2)
      (at ?from)
      (direct ?from rome)
      (rome_count ?r1)
      (next_rome ?r1 ?r2)
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (not (at ?from))
      (at rome)
      (not (rome_count ?r1))
      (rome_count ?r2)
      (visited rome)
    )
  )
)