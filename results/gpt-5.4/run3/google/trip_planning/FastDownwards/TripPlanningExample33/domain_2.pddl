(define (domain european_trip_13_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (visited ?c - city)
    (meeting_day ?d - day)
    (met_friend)
  )

  (:action choose_start
    :parameters (?c - city)
    :precondition (and
      (not (current_day day1))
      (not (visited barcelona))
      (not (visited krakow))
      (not (visited rome))
    )
    :effect (and
      (current_day day1)
      (at ?c day1)
      (visited ?c)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
      (not (at barcelona ?d2))
      (not (at krakow ?d2))
      (not (at rome ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (at barcelona ?d2))
      (not (at krakow ?d2))
      (not (at rome ?d2))
      (not (= ?from ?to))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?to ?d2)
      (visited ?to)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at krakow ?d)
      (meeting_day ?d)
      (not (met_friend))
    )
    :effect (met_friend)
  )
)