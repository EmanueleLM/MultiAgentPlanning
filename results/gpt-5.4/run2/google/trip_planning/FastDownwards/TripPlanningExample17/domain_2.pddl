(define (domain tripplanningexample17)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (trip_complete)
    (at ?c - city)
    (visited_on ?d - day ?c - city)

    (need_copenhagen_1)
    (need_copenhagen_2)
    (need_copenhagen_3)
    (need_copenhagen_4)
    (need_copenhagen_5)

    (need_vienna_1)
    (need_vienna_2)
    (need_vienna_3)
    (need_vienna_4)

    (need_lyon_1)
    (need_lyon_2)
    (need_lyon_3)
    (need_lyon_4)
  )

  (:action stay_regular
    :parameters (?d - day ?dnext - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?c)
      (not (visited_on ?d ?c))
    )
    :effect (and
      (visited_on ?d ?c)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action fly_regular
    :parameters (?d - day ?dnext - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?from)
      (direct ?from ?to)
      (not (visited_on ?d ?to))
    )
    :effect (and
      (visited_on ?d ?to)
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action stay_day_1_copenhagen
    :parameters (?dnext - day)
    :precondition (and
      (current_day day_1)
      (next_day day_1 ?dnext)
      (at copenhagen)
      (need_copenhagen_1)
      (not (visited_on day_1 copenhagen))
    )
    :effect (and
      (visited_on day_1 copenhagen)
      (not (need_copenhagen_1))
      (need_copenhagen_2)
      (not (current_day day_1))
      (current_day ?dnext)
    )
  )

  (:action fly_day_1_to_copenhagen
    :parameters (?dnext - day ?from - city)
    :precondition (and
      (current_day day_1)
      (next_day day_1 ?dnext)
      (at ?from)
      (direct ?from copenhagen)
      (need_copenhagen_1)
      (not (visited_on day_1 copenhagen))
    )
    :effect (and
      (visited_on day_1 copenhagen)
      (not (at ?from))
      (at copenhagen)
      (not (need_copenhagen_1))
      (need_copenhagen_2)
      (not (current_day day_1))
      (current_day ?dnext)
    )
  )

  (:action stay_day_5_copenhagen
    :parameters (?dnext - day)
    :precondition (and
      (current_day day_5)
      (next_day day_5 ?dnext)
      (at copenhagen)
      (need_copenhagen_4)
      (not (visited_on day_5 copenhagen))
    )
    :effect (and
      (visited_on day_5 copenhagen)
      (not (need_copenhagen_4))
      (need_copenhagen_5)
      (not (current_day day_5))
      (current_day ?dnext)
    )
  )

  (:action fly_day_5_to_copenhagen
    :parameters (?dnext - day ?from - city)
    :precondition (and
      (current_day day_5)
      (next_day day_5 ?dnext)
      (at ?from)
      (direct ?from copenhagen)
      (need_copenhagen_4)
      (not (visited_on day_5 copenhagen))
    )
    :effect (and
      (visited_on day_5 copenhagen)
      (not (at ?from))
      (at copenhagen)
      (not (need_copenhagen_4))
      (need_copenhagen_5)
      (not (current_day day_5))
      (current_day ?dnext)
    )
  )

  (:action stay_regular_copenhagen
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at copenhagen)
      (not (visited_on ?d copenhagen))
      (need_copenhagen_2)
    )
    :effect (and
      (visited_on ?d copenhagen)
      (not (need_copenhagen_2))
      (need_copenhagen_3)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action fly_regular_to_copenhagen_2
    :parameters (?d - day ?dnext - day ?from - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?from)
      (direct ?from copenhagen)
      (not (visited_on ?d copenhagen))
      (need_copenhagen_2)
      (not (= ?d day_1))
      (not (= ?d day_5))
    )
    :effect (and
      (visited_on ?d copenhagen)
      (not (at ?from))
      (at copenhagen)
      (not (need_copenhagen_2))
      (need_copenhagen_3)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action stay_regular_copenhagen_3
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at copenhagen)
      (not (visited_on ?d copenhagen))
      (need_copenhagen_3)
    )
    :effect (and
      (visited_on ?d copenhagen)
      (not (need_copenhagen_3))
      (need_copenhagen_4)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action fly_regular_to_copenhagen_3
    :parameters (?d - day ?dnext - day ?from - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?from)
      (direct ?from copenhagen)
      (not (visited_on ?d copenhagen))
      (need_copenhagen_3)
      (not (= ?d day_1))
      (not (= ?d day_5))
    )
    :effect (and
      (visited_on ?d copenhagen)
      (not (at ?from))
      (at copenhagen)
      (not (need_copenhagen_3))
      (need_copenhagen_4)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action stay_regular_vienna_1
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at vienna)
      (not (visited_on ?d vienna))
      (need_vienna_1)
    )
    :effect (and
      (visited_on ?d vienna)
      (not (need_vienna_1))
      (need_vienna_2)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action fly_regular_to_vienna_1
    :parameters (?d - day ?dnext - day ?from - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?from)
      (direct ?from vienna)
      (not (visited_on ?d vienna))
      (need_vienna_1)
    )
    :effect (and
      (visited_on ?d vienna)
      (not (at ?from))
      (at vienna)
      (not (need_vienna_1))
      (need_vienna_2)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action stay_regular_vienna_2
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at vienna)
      (not (visited_on ?d vienna))
      (need_vienna_2)
    )
    :effect (and
      (visited_on ?d vienna)
      (not (need_vienna_2))
      (need_vienna_3)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action fly_regular_to_vienna_2
    :parameters (?d - day ?dnext - day ?from - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?from)
      (direct ?from vienna)
      (not (visited_on ?d vienna))
      (need_vienna_2)
    )
    :effect (and
      (visited_on ?d vienna)
      (not (at ?from))
      (at vienna)
      (not (need_vienna_2))
      (need_vienna_3)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action stay_regular_vienna_3
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at vienna)
      (not (visited_on ?d vienna))
      (need_vienna_3)
    )
    :effect (and
      (visited_on ?d vienna)
      (not (need_vienna_3))
      (need_vienna_4)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action fly_regular_to_vienna_3
    :parameters (?d - day ?dnext - day ?from - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?from)
      (direct ?from vienna)
      (not (visited_on ?d vienna))
      (need_vienna_3)
    )
    :effect (and
      (visited_on ?d vienna)
      (not (at ?from))
      (at vienna)
      (not (need_vienna_3))
      (need_vienna_4)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action stay_regular_vienna_4
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at vienna)
      (not (visited_on ?d vienna))
      (need_vienna_4)
    )
    :effect (and
      (visited_on ?d vienna)
      (not (need_vienna_4))
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action fly_regular_to_vienna_4
    :parameters (?d - day ?dnext - day ?from - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?from)
      (direct ?from vienna)
      (not (visited_on ?d vienna))
      (need_vienna_4)
    )
    :effect (and
      (visited_on ?d vienna)
      (not (at ?from))
      (at vienna)
      (not (need_vienna_4))
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action stay_regular_lyon_1
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at lyon)
      (not (visited_on ?d lyon))
      (need_lyon_1)
    )
    :effect (and
      (visited_on ?d lyon)
      (not (need_lyon_1))
      (need_lyon_2)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action fly_regular_to_lyon_1
    :parameters (?d - day ?dnext - day ?from - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?from)
      (direct ?from lyon)
      (not (visited_on ?d lyon))
      (need_lyon_1)
    )
    :effect (and
      (visited_on ?d lyon)
      (not (at ?from))
      (at lyon)
      (not (need_lyon_1))
      (need_lyon_2)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action stay_regular_lyon_2
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at lyon)
      (not (visited_on ?d lyon))
      (need_lyon_2)
    )
    :effect (and
      (visited_on ?d lyon)
      (not (need_lyon_2))
      (need_lyon_3)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action fly_regular_to_lyon_2
    :parameters (?d - day ?dnext - day ?from - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?from)
      (direct ?from lyon)
      (not (visited_on ?d lyon))
      (need_lyon_2)
    )
    :effect (and
      (visited_on ?d lyon)
      (not (at ?from))
      (at lyon)
      (not (need_lyon_2))
      (need_lyon_3)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action stay_regular_lyon_3
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at lyon)
      (not (visited_on ?d lyon))
      (need_lyon_3)
    )
    :effect (and
      (visited_on ?d lyon)
      (not (need_lyon_3))
      (need_lyon_4)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action fly_regular_to_lyon_3
    :parameters (?d - day ?dnext - day ?from - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?from)
      (direct ?from lyon)
      (not (visited_on ?d lyon))
      (need_lyon_3)
    )
    :effect (and
      (visited_on ?d lyon)
      (not (at ?from))
      (at lyon)
      (not (need_lyon_3))
      (need_lyon_4)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action stay_regular_lyon_4
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at lyon)
      (not (visited_on ?d lyon))
      (need_lyon_4)
    )
    :effect (and
      (visited_on ?d lyon)
      (not (need_lyon_4))
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action fly_regular_to_lyon_4
    :parameters (?d - day ?dnext - day ?from - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?from)
      (direct ?from lyon)
      (not (visited_on ?d lyon))
      (need_lyon_4)
    )
    :effect (and
      (visited_on ?d lyon)
      (not (at ?from))
      (at lyon)
      (not (need_lyon_4))
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action finish_by_staying
    :parameters (?c - city)
    :precondition (and
      (current_day day_11)
      (at ?c)
      (not (visited_on day_11 ?c))
      (not (need_copenhagen_1))
      (not (need_copenhagen_2))
      (not (need_copenhagen_3))
      (not (need_copenhagen_4))
      (not (need_copenhagen_5))
      (not (need_vienna_1))
      (not (need_vienna_2))
      (not (need_vienna_3))
      (not (need_vienna_4))
      (not (need_lyon_1))
      (not (need_lyon_2))
      (not (need_lyon_3))
      (need_lyon_4)
    )
    :effect (and
      (visited_on day_11 ?c)
      (not (need_lyon_4))
      (not (current_day day_11))
      (trip_complete)
    )
  )

  (:action finish_by_flying
    :parameters (?from - city ?to - city)
    :precondition (and
      (current_day day_11)
      (at ?from)
      (direct ?from ?to)
      (not (visited_on day_11 ?to))
      (not (need_copenhagen_1))
      (not (need_copenhagen_2))
      (not (need_copenhagen_3))
      (not (need_copenhagen_4))
      (not (need_copenhagen_5))
      (not (need_vienna_1))
      (not (need_vienna_2))
      (not (need_vienna_3))
      (not (need_vienna_4))
      (not (need_lyon_1))
      (not (need_lyon_2))
      (not (need_lyon_3))
      (need_lyon_4)
    )
    :effect (and
      (visited_on day_11 ?to)
      (not (at ?from))
      (at ?to)
      (not (need_lyon_4))
      (not (current_day day_11))
      (trip_complete)
    )
  )
)