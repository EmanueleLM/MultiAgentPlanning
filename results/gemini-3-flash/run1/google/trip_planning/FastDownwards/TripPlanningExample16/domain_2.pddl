(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:constants prague vienna porto - city)
  (:predicates
    (at ?c - city ?d - day)
    (spent_prague ?d - day)
    (spent_vienna ?d - day)
    (spent_porto ?d - day)
    (prague_stay ?c - count)
    (vienna_stay ?c - count)
    (porto_stay ?c - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?c1 ?c2 - count)
    (flight ?c1 ?c2 - city)
  )

  (:action spend_day_prague
    :parameters (?d - day ?c_before ?c_after - count)
    :precondition (and
      (at prague ?d)
      (not (spent_prague ?d))
      (prague_stay ?c_before)
      (next_count ?c_before ?c_after)
    )
    :effect (and
      (spent_prague ?d)
      (not (prague_stay ?c_before))
      (prague_stay ?c_after)
    )
  )

  (:action spend_day_vienna
    :parameters (?d - day ?c_before ?c_after - count)
    :precondition (and
      (at vienna ?d)
      (not (spent_vienna ?d))
      (vienna_stay ?c_before)
      (next_count ?c_before ?c_after)
    )
    :effect (and
      (spent_vienna ?d)
      (not (vienna_stay ?c_before))
      (vienna_stay ?c_after)
    )
  )

  (:action spend_day_porto
    :parameters (?d - day ?c_before ?c_after - count)
    :precondition (and
      (at porto ?d)
      (not (spent_porto ?d))
      (porto_stay ?c_before)
      (next_count ?c_before ?c_after)
    )
    :effect (and
      (spent_porto ?d)
      (not (porto_stay ?c_before))
      (porto_stay ?c_after)
    )
  )

  (:action fly
    :parameters (?from ?to - city ?d - day)
    :precondition (and
      (at ?from ?d)
      (flight ?from ?to)
    )
    :effect (and
      (not (at ?from ?d))
      (at ?to ?d)
    )
  )

  (:action advance_day
    :parameters (?d_from ?d_to - day ?c - city)
    :precondition (and
      (at ?c ?d_from)
      (next_day ?d_from ?d_to)
    )
    :effect (and
      (not (at ?c ?d_from))
      (at ?c ?d_to)
    )
  )
)