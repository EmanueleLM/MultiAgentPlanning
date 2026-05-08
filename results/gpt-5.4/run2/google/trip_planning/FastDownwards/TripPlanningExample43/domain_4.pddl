(define (domain tripplanningexample43)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)

    (current_day ?d - day)
    (at ?c - city)
    (started)

    (occupied ?c - city ?d - day)

    (friends_window ?d - day)
    (met_friends)

    (venice_block_started)
    (venice_block_ended)
    (porto_block_started)
    (porto_block_ended)

    (venice_start_candidate ?d - day)
    (porto_start_candidate ?d - day)

    (venice_day1 ?d - day)
    (venice_day2 ?d - day)
    (venice_day3 ?d - day)
    (venice_day4 ?d - day)

    (porto_day1 ?d - day)
    (porto_day2 ?d - day)
    (porto_day3 ?d - day)
    (porto_day4 ?d - day)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (not (started))
    :effect (and
      (started)
      (current_day day_1)
      (at ?c)
      (occupied ?c day_1)
    )
  )

  (:action stay
    :parameters (?from_d - day ?to_d - day ?c - city)
    :precondition (and
      (started)
      (current_day ?from_d)
      (next_day ?from_d ?to_d)
      (at ?c)
      (not (occupied ?c ?to_d))
    )
    :effect (and
      (not (current_day ?from_d))
      (current_day ?to_d)
      (occupied ?c ?to_d)
    )
  )

  (:action fly
    :parameters (?from_d - day ?to_d - day ?from - city ?to - city)
    :precondition (and
      (started)
      (current_day ?from_d)
      (next_day ?from_d ?to_d)
      (at ?from)
      (direct_flight ?from ?to)
      (not (occupied ?to ?to_d))
    )
    :effect (and
      (not (current_day ?from_d))
      (current_day ?to_d)
      (not (at ?from))
      (at ?to)
      (occupied ?to ?to_d)
    )
  )

  (:action meet_friends
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (friends_window ?d)
      (at venice)
      (not (met_friends))
    )
    :effect (met_friends)
  )

  (:action start_venice_block
    :parameters (?d1 - day ?d2 - day ?d3 - day ?d4 - day)
    :precondition (and
      (venice_start_candidate ?d1)
      (next_day ?d1 ?d2)
      (next_day ?d2 ?d3)
      (next_day ?d3 ?d4)
      (occupied venice ?d1)
      (occupied venice ?d2)
      (occupied venice ?d3)
      (occupied venice ?d4)
      (not (venice_block_started))
    )
    :effect (and
      (venice_block_started)
      (venice_day1 ?d1)
      (venice_day2 ?d2)
      (venice_day3 ?d3)
      (venice_day4 ?d4)
    )
  )

  (:action end_venice_block
    :parameters ()
    :precondition (and
      (venice_block_started)
      (not (venice_block_ended))
    )
    :effect (venice_block_ended)
  )

  (:action start_porto_block
    :parameters (?d1 - day ?d2 - day ?d3 - day ?d4 - day)
    :precondition (and
      (porto_start_candidate ?d1)
      (next_day ?d1 ?d2)
      (next_day ?d2 ?d3)
      (next_day ?d3 ?d4)
      (occupied porto ?d1)
      (occupied porto ?d2)
      (occupied porto ?d3)
      (occupied porto ?d4)
      (venice_block_ended)
      (not (porto_block_started))
    )
    :effect (and
      (porto_block_started)
      (porto_day1 ?d1)
      (porto_day2 ?d2)
      (porto_day3 ?d3)
      (porto_day4 ?d4)
    )
  )

  (:action end_porto_block
    :parameters ()
    :precondition (and
      (porto_block_started)
      (not (porto_block_ended))
    )
    :effect (porto_block_ended)
  )
)