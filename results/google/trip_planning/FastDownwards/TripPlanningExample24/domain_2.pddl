(define (domain europe-trip)
  (:requirements :strips :typing :equality :action-costs)
  (:types city day)
  (:constants florence amsterdam riga - city)
  (:predicates
    (on ?c - city ?d - day)
    (connected ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (free ?d - day)
  )

  (:action florence-stay
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (on florence ?d1) (next ?d1 ?d2) (free ?d2))
    :effect (and (on florence ?d2) (not (free ?d2)))
    :cost 0
  )

  (:action amsterdam-stay
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (on amsterdam ?d1) (next ?d1 ?d2) (free ?d2))
    :effect (and (on amsterdam ?d2) (not (free ?d2)))
    :cost 0
  )

  (:action riga-stay
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (on riga ?d1) (next ?d1 ?d2) (free ?d2))
    :effect (and (on riga ?d2) (not (free ?d2)))
    :cost 0
  )

  (:action florence-fly-to-amsterdam
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (on florence ?d1) (next ?d1 ?d2) (free ?d2) (connected florence amsterdam))
    :effect (and (on amsterdam ?d2) (not (free ?d2)))
    :cost 1
  )

  (:action amsterdam-fly-to-florence
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (on amsterdam ?d1) (next ?d1 ?d2) (free ?d2) (connected amsterdam florence))
    :effect (and (on florence ?d2) (not (free ?d2)))
    :cost 1
  )

  (:action amsterdam-fly-to-riga
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (on amsterdam ?d1) (next ?d1 ?d2) (free ?d2) (connected amsterdam riga))
    :effect (and (on riga ?d2) (not (free ?d2)))
    :cost 1
  )

  (:action riga-fly-to-amsterdam
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (on riga ?d1) (next ?d1 ?d2) (free ?d2) (connected riga amsterdam))
    :effect (and (on amsterdam ?d2) (not (free ?d2)))
    :cost 1
  )
)