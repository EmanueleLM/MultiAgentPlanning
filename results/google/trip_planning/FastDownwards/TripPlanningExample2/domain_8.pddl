(define (domain travel)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types city day)
  (:constants reykjavik vienna venice - city)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d - day ?d2 - day)
    (connected ?from - city ?to - city)
    (occupied ?d - day)
    (wedding-day ?d - day)
    (attended-wedding)
  )

  (:action reykjavik-stay
    :parameters (?d - day ?d2 - day)
    :precondition (and (at reykjavik ?d) (next ?d ?d2) (not (occupied ?d2)))
    :effect (and (at reykjavik ?d2) (occupied ?d2))
  )

  (:action vienna-stay
    :parameters (?d - day ?d2 - day)
    :precondition (and (at vienna ?d) (next ?d ?d2) (not (occupied ?d2)))
    :effect (and (at vienna ?d2) (occupied ?d2))
  )

  (:action venice-stay
    :parameters (?d - day ?d2 - day)
    :precondition (and (at venice ?d) (next ?d ?d2) (not (occupied ?d2)))
    :effect (and (at venice ?d2) (occupied ?d2))
  )

  (:action fly-reykjavik-to-vienna
    :parameters (?d - day ?d2 - day)
    :precondition (and (at reykjavik ?d) (connected reykjavik vienna) (next ?d ?d2) (not (occupied ?d2)))
    :effect (and (at vienna ?d2) (occupied ?d2))
  )

  (:action fly-vienna-to-reykjavik
    :parameters (?d - day ?d2 - day)
    :precondition (and (at vienna ?d) (connected vienna reykjavik) (next ?d ?d2) (not (occupied ?d2)))
    :effect (and (at reykjavik ?d2) (occupied ?d2))
  )

  (:action fly-vienna-to-venice
    :parameters (?d - day ?d2 - day)
    :precondition (and (at vienna ?d) (connected vienna venice) (next ?d ?d2) (not (occupied ?d2)))
    :effect (and (at venice ?d2) (occupied ?d2))
  )

  (:action fly-venice-to-vienna
    :parameters (?d - day ?d2 - day)
    :precondition (and (at venice ?d) (connected venice vienna) (next ?d ?d2) (not (occupied ?d2)))
    :effect (and (at vienna ?d2) (occupied ?d2))
  )

  (:action venice-attend-wedding
    :parameters (?d - day)
    :precondition (and (at venice ?d) (wedding-day ?d) (not (attended-wedding)))
    :effect (and (attended-wedding))
  )
)