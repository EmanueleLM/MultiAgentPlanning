(define (domain european_trip_12_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    seville_count
    munich_count
    tallinn_count
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)

    (at ?c - city)
    (direct_flight ?from - city ?to - city)

    (started)

    (sev_prog ?s - seville_count)
    (mun_prog ?m - munich_count)
    (tal_prog ?t - tallinn_count)

    (sev_next ?a - seville_count ?b - seville_count)
    (mun_next ?a - munich_count ?b - munich_count)
    (tal_next ?a - tallinn_count ?b - tallinn_count)

    (met_friend)
    (meeting_window ?d - day)
  )

  (:action choose_start
    :parameters (?c - city)
    :precondition (and
      (current_day d1)
      (not (started))
    )
    :effect (and
      (started)
      (at ?c)
    )
  )

  (:action stay_seville
    :parameters (?d1 - day ?d2 - day ?a - seville_count ?b - seville_count)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at seville)
      (sev_prog ?a)
      (sev_next ?a ?b)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (sev_prog ?a))
      (sev_prog ?b)
    )
  )

  (:action stay_munich
    :parameters (?d1 - day ?d2 - day ?a - munich_count ?b - munich_count)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at munich)
      (mun_prog ?a)
      (mun_next ?a ?b)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (mun_prog ?a))
      (mun_prog ?b)
    )
  )

  (:action stay_tallinn
    :parameters (?d1 - day ?d2 - day ?a - tallinn_count ?b - tallinn_count)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at tallinn)
      (tal_prog ?a)
      (tal_next ?a ?b)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (tal_prog ?a))
      (tal_prog ?b)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (direct_flight ?from ?to)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (started)
      (current_day ?d)
      (meeting_window ?d)
      (at tallinn)
      (not (met_friend))
    )
    :effect (and
      (met_friend)
    )
  )
)