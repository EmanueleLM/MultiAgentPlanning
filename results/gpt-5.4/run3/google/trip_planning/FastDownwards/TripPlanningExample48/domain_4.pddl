(define (domain european_trip_4_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:constants manchester split geneva - city
              d1 d2 d3 d4 - day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (visited_on ?c - city ?d - day)
    (meeting_day ?d - day)
    (met_friend)
  )

  (:action start_day_1
    :parameters (?c - city)
    :precondition (and
      (current d1)
      (not (at manchester))
      (not (at split))
      (not (at geneva))
      (not (visited_on manchester d1))
      (not (visited_on split d1))
      (not (visited_on geneva d1))
    )
    :effect (and
      (at ?c)
      (visited_on ?c d1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current ?d1)
      (next ?d1 ?d2)
      (not (visited_on manchester ?d2))
      (not (visited_on split ?d2))
      (not (visited_on geneva ?d2))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (visited_on ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (visited_on manchester ?d2))
      (not (visited_on split ?d2))
      (not (visited_on geneva ?d2))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current ?d1))
      (current ?d2)
      (visited_on ?to ?d2)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (current ?d)
      (meeting_day ?d)
      (at split)
      (not (met_friend))
    )
    :effect (met_friend)
  )
)