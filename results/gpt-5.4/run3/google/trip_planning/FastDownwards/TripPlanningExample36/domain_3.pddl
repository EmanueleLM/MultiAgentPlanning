(define (domain trip_planning_example36)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:constants florence munich warsaw - city)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (counted_florence ?d - day)
    (counted_munich ?d - day)
    (counted_warsaw ?d - day)
  )

  (:action stay_florence
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at florence ?d1)
      (not (counted_florence ?d2)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (counted_florence ?d2))
  )

  (:action stay_munich
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at munich ?d1)
      (not (counted_munich ?d2)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at munich ?d2)
      (counted_munich ?d2))
  )

  (:action stay_warsaw
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at warsaw ?d1)
      (not (counted_warsaw ?d2)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at warsaw ?d2)
      (counted_warsaw ?d2))
  )

  (:action fly_florence_munich
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at florence ?d1)
      (direct florence munich)
      (not (counted_munich ?d2)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at munich ?d2)
      (counted_munich ?d2))
  )

  (:action fly_florence_warsaw
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at florence ?d1)
      (direct florence warsaw)
      (not (counted_warsaw ?d2)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at warsaw ?d2)
      (counted_warsaw ?d2))
  )

  (:action fly_munich_florence
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at munich ?d1)
      (direct munich florence)
      (not (counted_florence ?d2)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (counted_florence ?d2))
  )

  (:action fly_munich_warsaw
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at munich ?d1)
      (direct munich warsaw)
      (not (counted_warsaw ?d2)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at warsaw ?d2)
      (counted_warsaw ?d2))
  )

  (:action fly_warsaw_florence
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at warsaw ?d1)
      (direct warsaw florence)
      (not (counted_florence ?d2)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at florence ?d2)
      (counted_florence ?d2))
  )

  (:action fly_warsaw_munich
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at warsaw ?d1)
      (direct warsaw munich)
      (not (counted_munich ?d2)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at munich ?d2)
      (counted_munich ?d2))
  )
)