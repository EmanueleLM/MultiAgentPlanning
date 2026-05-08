(define (domain tripplanningexample37)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d - day ?nd - day)
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (visited_reykjavik ?d - day)
    (visited_milan ?d - day)
    (visited_porto ?d - day)
    (started)
  )

  (:action start
    :parameters (?c - city)
    :precondition (and
      (not (started))
      (current_day day_1)
    )
    :effect (and
      (started)
      (at ?c day_1)
      (visited_reykjavik day_1)
      (visited_milan day_1)
      (visited_porto day_1)
    )
  )

  (:action stay_reykjavik
    :parameters (?d - day ?nd - day)
    :precondition (and
      (started)
      (current_day ?d)
      (next ?d ?nd)
      (at reykjavik ?d)
      (not (at reykjavik ?nd))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (at reykjavik ?nd)
      (visited_reykjavik ?nd)
    )
  )

  (:action stay_milan
    :parameters (?d - day ?nd - day)
    :precondition (and
      (started)
      (current_day ?d)
      (next ?d ?nd)
      (at milan ?d)
      (not (at milan ?nd))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (at milan ?nd)
      (visited_milan ?nd)
    )
  )

  (:action stay_porto
    :parameters (?d - day ?nd - day)
    :precondition (and
      (started)
      (current_day ?d)
      (next ?d ?nd)
      (at porto ?d)
      (not (at porto ?nd))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (at porto ?nd)
      (visited_porto ?nd)
    )
  )

  (:action fly_reykjavik_to_milan
    :parameters (?d - day ?nd - day)
    :precondition (and
      (started)
      (current_day ?d)
      (next ?d ?nd)
      (at reykjavik ?d)
      (direct reykjavik milan)
      (not (at milan ?nd))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (at milan ?nd)
      (visited_milan ?nd)
    )
  )

  (:action fly_milan_to_reykjavik
    :parameters (?d - day ?nd - day)
    :precondition (and
      (started)
      (current_day ?d)
      (next ?d ?nd)
      (at milan ?d)
      (direct milan reykjavik)
      (not (at reykjavik ?nd))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (at reykjavik ?nd)
      (visited_reykjavik ?nd)
    )
  )

  (:action fly_milan_to_porto
    :parameters (?d - day ?nd - day)
    :precondition (and
      (started)
      (current_day ?d)
      (next ?d ?nd)
      (at milan ?d)
      (direct milan porto)
      (not (at porto ?nd))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (at porto ?nd)
      (visited_porto ?nd)
    )
  )

  (:action fly_porto_to_milan
    :parameters (?d - day ?nd - day)
    :precondition (and
      (started)
      (current_day ?d)
      (next ?d ?nd)
      (at porto ?d)
      (direct porto milan)
      (not (at milan ?nd))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (at milan ?nd)
      (visited_milan ?nd)
    )
  )
)