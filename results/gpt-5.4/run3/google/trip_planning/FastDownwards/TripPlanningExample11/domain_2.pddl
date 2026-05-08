(define (domain tripplanningexample11)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    block
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)

    (assigned ?b - block ?c - city)
    (block_length_5 ?b - block)
    (block_length_7 ?b - block)

    (current_day ?d - day)
    (at ?c - city)

    (started ?b - block)
    (finished ?b - block)
    (current_block ?b - block)
    (remaining_5 ?b - block)
    (remaining_4 ?b - block)
    (remaining_3 ?b - block)
    (remaining_2 ?b - block)
    (remaining_1 ?b - block)
    (remaining_7 ?b - block)
    (remaining_6 ?b - block)

    (visited ?c - city ?d - day)
  )

  (:action start_block_5_same_city
    :parameters (?b - block ?c - city ?d - day ?dnext - day)
    :precondition (and
      (assigned ?b ?c)
      (block_length_5 ?b)
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?c)
      (not (started ?b))
      (not (finished ?b))
      (not (current_block ?b))
    )
    :effect (and
      (started ?b)
      (current_block ?b)
      (remaining_4 ?b)
      (visited ?c ?d)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action start_block_5_by_flight
    :parameters (?b - block ?from - city ?to - city ?d - day ?dnext - day)
    :precondition (and
      (assigned ?b ?to)
      (block_length_5 ?b)
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?from)
      (direct ?from ?to)
      (not (started ?b))
      (not (finished ?b))
      (not (current_block ?b))
      (not (at ?to))
    )
    :effect (and
      (started ?b)
      (current_block ?b)
      (remaining_4 ?b)
      (visited ?to ?d)
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action continue_block_5_r4
    :parameters (?b - block ?c - city ?d - day ?dnext - day)
    :precondition (and
      (assigned ?b ?c)
      (current_block ?b)
      (remaining_4 ?b)
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?c)
    )
    :effect (and
      (remaining_3 ?b)
      (visited ?c ?d)
      (not (remaining_4 ?b))
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action continue_block_5_r3
    :parameters (?b - block ?c - city ?d - day ?dnext - day)
    :precondition (and
      (assigned ?b ?c)
      (current_block ?b)
      (remaining_3 ?b)
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?c)
    )
    :effect (and
      (remaining_2 ?b)
      (visited ?c ?d)
      (not (remaining_3 ?b))
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action continue_block_5_r2
    :parameters (?b - block ?c - city ?d - day ?dnext - day)
    :precondition (and
      (assigned ?b ?c)
      (current_block ?b)
      (remaining_2 ?b)
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?c)
    )
    :effect (and
      (remaining_1 ?b)
      (visited ?c ?d)
      (not (remaining_2 ?b))
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action finish_block_5
    :parameters (?b - block ?c - city ?d - day ?dnext - day)
    :precondition (and
      (assigned ?b ?c)
      (current_block ?b)
      (remaining_1 ?b)
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?c)
    )
    :effect (and
      (finished ?b)
      (visited ?c ?d)
      (not (remaining_1 ?b))
      (not (current_block ?b))
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action start_block_7_same_city
    :parameters (?b - block ?c - city ?d - day ?dnext - day)
    :precondition (and
      (assigned ?b ?c)
      (block_length_7 ?b)
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?c)
      (not (started ?b))
      (not (finished ?b))
      (not (current_block ?b))
    )
    :effect (and
      (started ?b)
      (current_block ?b)
      (remaining_6 ?b)
      (visited ?c ?d)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action start_block_7_by_flight
    :parameters (?b - block ?from - city ?to - city ?d - day ?dnext - day)
    :precondition (and
      (assigned ?b ?to)
      (block_length_7 ?b)
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?from)
      (direct ?from ?to)
      (not (started ?b))
      (not (finished ?b))
      (not (current_block ?b))
      (not (at ?to))
    )
    :effect (and
      (started ?b)
      (current_block ?b)
      (remaining_6 ?b)
      (visited ?to ?d)
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action continue_block_7_r6
    :parameters (?b - block ?c - city ?d - day ?dnext - day)
    :precondition (and
      (assigned ?b ?c)
      (current_block ?b)
      (remaining_6 ?b)
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?c)
    )
    :effect (and
      (remaining_5 ?b)
      (visited ?c ?d)
      (not (remaining_6 ?b))
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action continue_block_7_r5
    :parameters (?b - block ?c - city ?d - day ?dnext - day)
    :precondition (and
      (assigned ?b ?c)
      (current_block ?b)
      (remaining_5 ?b)
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?c)
    )
    :effect (and
      (remaining_4 ?b)
      (visited ?c ?d)
      (not (remaining_5 ?b))
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action continue_block_7_r4
    :parameters (?b - block ?c - city ?d - day ?dnext - day)
    :precondition (and
      (assigned ?b ?c)
      (current_block ?b)
      (remaining_4 ?b)
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?c)
    )
    :effect (and
      (remaining_3 ?b)
      (visited ?c ?d)
      (not (remaining_4 ?b))
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action continue_block_7_r3
    :parameters (?b - block ?c - city ?d - day ?dnext - day)
    :precondition (and
      (assigned ?b ?c)
      (current_block ?b)
      (remaining_3 ?b)
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?c)
    )
    :effect (and
      (remaining_2 ?b)
      (visited ?c ?d)
      (not (remaining_3 ?b))
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action continue_block_7_r2
    :parameters (?b - block ?c - city ?d - day ?dnext - day)
    :precondition (and
      (assigned ?b ?c)
      (current_block ?b)
      (remaining_2 ?b)
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?c)
    )
    :effect (and
      (remaining_1 ?b)
      (visited ?c ?d)
      (not (remaining_2 ?b))
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action finish_block_7
    :parameters (?b - block ?c - city ?d - day)
    :precondition (and
      (assigned ?b ?c)
      (current_block ?b)
      (remaining_1 ?b)
      (current_day ?d)
      (at ?c)
    )
    :effect (and
      (finished ?b)
      (visited ?c ?d)
      (not (remaining_1 ?b))
      (not (current_block ?b))
      (not (current_day ?d))
    )
  )
)