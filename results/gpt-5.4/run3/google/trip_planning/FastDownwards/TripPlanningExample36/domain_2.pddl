(define (domain trip_planning_example36)
  (:requirements :strips :typing)

  (:types city day)

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
      (at florence ?d1))
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
      (at munich ?d1))
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
      (at warsaw ?d1))
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
      (direct florence munich))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at florence ?d1))
      (at munich ?d2)
      (counted_munich ?d2))
  )

  (:action fly_florence_warsaw
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at florence ?d1)
      (direct florence warsaw))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at florence ?d1))
      (at warsaw ?d2)
      (counted_warsaw ?d2))
  )

  (:action fly_munich_florence
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at munich ?d1)
      (direct munich florence))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at munich ?d1))
      (at florence ?d2)
      (counted_florence ?d2))
  )

  (:action fly_munich_warsaw
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at munich ?d1)
      (direct munich warsaw))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at munich ?d1))
      (at warsaw ?d2)
      (counted_warsaw ?d2))
  )

  (:action fly_warsaw_florence
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at warsaw ?d1)
      (direct warsaw florence))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at warsaw ?d1))
      (at florence ?d2)
      (counted_florence ?d2))
  )

  (:action fly_warsaw_munich
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at warsaw ?d1)
      (direct warsaw munich))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at warsaw ?d1))
      (at munich ?d2)
      (counted_munich ?d2))
  )
)