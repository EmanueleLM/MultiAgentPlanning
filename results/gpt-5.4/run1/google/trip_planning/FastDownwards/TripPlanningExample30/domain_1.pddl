(define (domain european_trip_14_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day count
  )

  (:constants
    istanbul tallinn zurich - city
    d1 d14 - day
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (direct ?from - city ?to - city)
    (spent ?d - day ?c - city)
    (show_day ?d - day)
    (start_unchosen)
    (count_istanbul ?n - count)
    (count_tallinn ?n - count)
    (count_zurich ?n - count)
    (next_count ?n1 - count ?n2 - count)
    (finished)
  )

  (:action choose_start_istanbul
    :parameters ()
    :precondition (and
      (start_unchosen)
      (current_day d1)
    )
    :effect (and
      (not (start_unchosen))
      (at istanbul)
    )
  )

  (:action choose_start_tallinn
    :parameters ()
    :precondition (and
      (start_unchosen)
      (current_day d1)
    )
    :effect (and
      (not (start_unchosen))
      (at tallinn)
    )
  )

  (:action choose_start_zurich
    :parameters ()
    :precondition (and
      (start_unchosen)
      (current_day d1)
    )
    :effect (and
      (not (start_unchosen))
      (at zurich)
    )
  )

  (:action stay_istanbul
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at istanbul)
      (current_day ?d)
      (next_day ?d ?d2)
      (not (show_day ?d))
      (count_istanbul ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (spent ?d istanbul)
      (not (count_istanbul ?n1))
      (count_istanbul ?n2)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_tallinn
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at tallinn)
      (current_day ?d)
      (next_day ?d ?d2)
      (not (show_day ?d))
      (count_tallinn ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (spent ?d tallinn)
      (not (count_tallinn ?n1))
      (count_tallinn ?n2)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_zurich
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at zurich)
      (current_day ?d)
      (next_day ?d ?d2)
      (count_zurich ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (spent ?d zurich)
      (not (count_zurich ?n1))
      (count_zurich ?n2)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_istanbul_last
    :parameters (?n1 - count ?n2 - count)
    :precondition (and
      (at istanbul)
      (current_day d14)
      (not (show_day d14))
      (count_istanbul ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (spent d14 istanbul)
      (not (count_istanbul ?n1))
      (count_istanbul ?n2)
      (not (current_day d14))
      (finished)
    )
  )

  (:action stay_tallinn_last
    :parameters (?n1 - count ?n2 - count)
    :precondition (and
      (at tallinn)
      (current_day d14)
      (not (show_day d14))
      (count_tallinn ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (spent d14 tallinn)
      (not (count_tallinn ?n1))
      (count_tallinn ?n2)
      (not (current_day d14))
      (finished)
    )
  )

  (:action stay_zurich_last
    :parameters (?n1 - count ?n2 - count)
    :precondition (and
      (at zurich)
      (current_day d14)
      (count_zurich ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (spent d14 zurich)
      (not (count_zurich ?n1))
      (count_zurich ?n2)
      (not (current_day d14))
      (finished)
    )
  )

  (:action fly_istanbul_tallinn
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at istanbul)
      (direct istanbul tallinn)
      (current_day ?d)
      (next_day ?d ?d2)
      (not (show_day ?d))
      (count_tallinn ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at istanbul))
      (at tallinn)
      (spent ?d tallinn)
      (not (count_tallinn ?n1))
      (count_tallinn ?n2)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_istanbul_zurich
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at istanbul)
      (direct istanbul zurich)
      (current_day ?d)
      (next_day ?d ?d2)
      (count_zurich ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at istanbul))
      (at zurich)
      (spent ?d zurich)
      (not (count_zurich ?n1))
      (count_zurich ?n2)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_tallinn_istanbul
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at tallinn)
      (direct tallinn istanbul)
      (current_day ?d)
      (next_day ?d ?d2)
      (not (show_day ?d))
      (count_istanbul ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at tallinn))
      (at istanbul)
      (spent ?d istanbul)
      (not (count_istanbul ?n1))
      (count_istanbul ?n2)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_tallinn_zurich
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at tallinn)
      (direct tallinn zurich)
      (current_day ?d)
      (next_day ?d ?d2)
      (count_zurich ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at tallinn))
      (at zurich)
      (spent ?d zurich)
      (not (count_zurich ?n1))
      (count_zurich ?n2)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_zurich_istanbul
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at zurich)
      (direct zurich istanbul)
      (current_day ?d)
      (next_day ?d ?d2)
      (not (show_day ?d))
      (count_istanbul ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at zurich))
      (at istanbul)
      (spent ?d istanbul)
      (not (count_istanbul ?n1))
      (count_istanbul ?n2)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_zurich_tallinn
    :parameters (?d - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at zurich)
      (direct zurich tallinn)
      (current_day ?d)
      (next_day ?d ?d2)
      (not (show_day ?d))
      (count_tallinn ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at zurich))
      (at tallinn)
      (spent ?d tallinn)
      (not (count_tallinn ?n1))
      (count_tallinn ?n2)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_istanbul_tallinn_last
    :parameters (?n1 - count ?n2 - count)
    :precondition (and
      (at istanbul)
      (direct istanbul tallinn)
      (current_day d14)
      (not (show_day d14))
      (count_tallinn ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at istanbul))
      (at tallinn)
      (spent d14 tallinn)
      (not (count_tallinn ?n1))
      (count_tallinn ?n2)
      (not (current_day d14))
      (finished)
    )
  )

  (:action fly_istanbul_zurich_last
    :parameters (?n1 - count ?n2 - count)
    :precondition (and
      (at istanbul)
      (direct istanbul zurich)
      (current_day d14)
      (count_zurich ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at istanbul))
      (at zurich)
      (spent d14 zurich)
      (not (count_zurich ?n1))
      (count_zurich ?n2)
      (not (current_day d14))
      (finished)
    )
  )

  (:action fly_tallinn_istanbul_last
    :parameters (?n1 - count ?n2 - count)
    :precondition (and
      (at tallinn)
      (direct tallinn istanbul)
      (current_day d14)
      (not (show_day d14))
      (count_istanbul ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at tallinn))
      (at istanbul)
      (spent d14 istanbul)
      (not (count_istanbul ?n1))
      (count_istanbul ?n2)
      (not (current_day d14))
      (finished)
    )
  )

  (:action fly_tallinn_zurich_last
    :parameters (?n1 - count ?n2 - count)
    :precondition (and
      (at tallinn)
      (direct tallinn zurich)
      (current_day d14)
      (count_zurich ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at tallinn))
      (at zurich)
      (spent d14 zurich)
      (not (count_zurich ?n1))
      (count_zurich ?n2)
      (not (current_day d14))
      (finished)
    )
  )

  (:action fly_zurich_istanbul_last
    :parameters (?n1 - count ?n2 - count)
    :precondition (and
      (at zurich)
      (direct zurich istanbul)
      (current_day d14)
      (not (show_day d14))
      (count_istanbul ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at zurich))
      (at istanbul)
      (spent d14 istanbul)
      (not (count_istanbul ?n1))
      (count_istanbul ?n2)
      (not (current_day d14))
      (finished)
    )
  )

  (:action fly_zurich_tallinn_last
    :parameters (?n1 - count ?n2 - count)
    :precondition (and
      (at zurich)
      (direct zurich tallinn)
      (current_day d14)
      (not (show_day d14))
      (count_tallinn ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at zurich))
      (at tallinn)
      (spent d14 tallinn)
      (not (count_tallinn ?n1))
      (count_tallinn ?n2)
      (not (current_day d14))
      (finished)
    )
  )
)