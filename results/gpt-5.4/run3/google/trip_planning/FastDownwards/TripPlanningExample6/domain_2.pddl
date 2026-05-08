(define (domain tripplanningexample6)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (current ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)

    (visited_on ?c - city ?d - day)

    (required_city ?d - day ?c - city)

    (need_block_berlin)
    (need_block_munich)
    (need_block_dubrovnik)

    (berlin_start ?d - day)
    (munich_start ?d - day)
    (dubrovnik_start ?d - day)

    (berlin_done)
    (munich_done)
    (dubrovnik_done)

    (trip_finished)
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (required_city ?d1 ?c)
      (not (visited_on ?c ?d1))
    )
    :effect (and
      (visited_on ?c ?d1)
      (not (current ?d1))
      (current ?d2)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (required_city ?d1 ?to)
      (not (visited_on ?to ?d1))
    )
    :effect (and
      (visited_on ?to ?d1)
      (not (at ?from))
      (at ?to)
      (not (current ?d1))
      (current ?d2)
    )
  )

  (:action stay_last
    :parameters (?d - day ?c - city)
    :precondition (and
      (current ?d)
      (at ?c)
      (required_city ?d ?c)
      (not (visited_on ?c ?d))
    )
    :effect (and
      (visited_on ?c ?d)
      (trip_finished)
      (not (current ?d))
    )
  )

  (:action fly_last
    :parameters (?d - day ?from - city ?to - city)
    :precondition (and
      (current ?d)
      (at ?from)
      (direct ?from ?to)
      (required_city ?d ?to)
      (not (visited_on ?to ?d))
    )
    :effect (and
      (visited_on ?to ?d)
      (not (at ?from))
      (at ?to)
      (trip_finished)
      (not (current ?d))
    )
  )

  (:action choose_berlin_block
    :parameters (?s - day ?d2 - day ?d3 - day ?d4 - day)
    :precondition (and
      (need_block_berlin)
      (berlin_start ?s)
      (next ?s ?d2)
      (next ?d2 ?d3)
      (next ?d3 ?d4)
    )
    :effect (and
      (required_city ?s berlin)
      (required_city ?d2 berlin)
      (required_city ?d3 berlin)
      (required_city ?d4 berlin)
      (berlin_done)
      (not (need_block_berlin))
    )
  )

  (:action choose_munich_block
    :parameters (?s - day ?d2 - day ?d3 - day)
    :precondition (and
      (need_block_munich)
      (munich_start ?s)
      (next ?s ?d2)
      (next ?d2 ?d3)
    )
    :effect (and
      (required_city ?s munich)
      (required_city ?d2 munich)
      (required_city ?d3 munich)
      (munich_done)
      (not (need_block_munich))
    )
  )

  (:action choose_dubrovnik_block
    :parameters (?s - day ?d2 - day ?d3 - day)
    :precondition (and
      (need_block_dubrovnik)
      (dubrovnik_start ?s)
      (next ?s ?d2)
      (next ?d2 ?d3)
    )
    :effect (and
      (required_city ?s dubrovnik)
      (required_city ?d2 dubrovnik)
      (required_city ?d3 dubrovnik)
      (dubrovnik_done)
      (not (need_block_dubrovnik))
    )
  )
)