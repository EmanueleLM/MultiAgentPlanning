(define (domain trip)
  (:requirements :typing)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (connected ?c1 - city ?c2 - city)
  )

  (:action stay_florence
    :parameters (?d - day ?d2 - day)
    :precondition (and (at florence ?d) (next ?d ?d2))
    :effect (and (at florence ?d2))
  )

  (:action stay_amsterdam
    :parameters (?d - day ?d2 - day)
    :precondition (and (at amsterdam ?d) (next ?d ?d2))
    :effect (and (at amsterdam ?d2))
  )

  (:action stay_riga
    :parameters (?d - day ?d2 - day)
    :precondition (and (at riga ?d) (next ?d ?d2))
    :effect (and (at riga ?d2))
  )

  (:action fly_florence_to_amsterdam
    :parameters (?d - day ?d2 - day)
    :precondition (and (at florence ?d) (next ?d ?d2) (connected florence amsterdam))
    :effect (and (at amsterdam ?d2))
  )

  (:action fly_amsterdam_to_florence
    :parameters (?d - day ?d2 - day)
    :precondition (and (at amsterdam ?d) (next ?d ?d2) (connected amsterdam florence))
    :effect (and (at florence ?d2))
  )

  (:action fly_amsterdam_to_riga
    :parameters (?d - day ?d2 - day)
    :precondition (and (at amsterdam ?d) (next ?d ?d2) (connected amsterdam riga))
    :effect (and (at riga ?d2))
  )

  (:action fly_riga_to_amsterdam
    :parameters (?d - day ?d2 - day)
    :precondition (and (at riga ?d) (next ?d ?d2) (connected riga amsterdam))
    :effect (and (at amsterdam ?d2))
  )
)