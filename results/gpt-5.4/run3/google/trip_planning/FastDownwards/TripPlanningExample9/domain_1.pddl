(define (domain european_trip_10_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)

    (current_day ?d - day)
    (next_day ?d - day ?n - day)
    (last_day ?d - day)

    (visit_day ?d - day ?c - city)

    (frankfurt_count_0)
    (frankfurt_count_1)
    (frankfurt_count_2)
    (frankfurt_count_3)

    (bucharest_count_0)
    (bucharest_count_1)
    (bucharest_count_2)
    (bucharest_count_3)

    (stuttgart_count_0)
    (stuttgart_count_1)
    (stuttgart_count_2)
    (stuttgart_count_3)
    (stuttgart_count_4)
    (stuttgart_count_5)
    (stuttgart_count_6)

    (workshop_done)
  )

  (:action spend_day_bucharest_0_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at bucharest)
      (bucharest_count_0)
      (not (visit_day ?d bucharest))
    )
    :effect (and
      (visit_day ?d bucharest)
      (not (current_day ?d))
      (current_day ?n)
      (not (bucharest_count_0))
      (bucharest_count_1)
    )
  )

  (:action spend_day_bucharest_1_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at bucharest)
      (bucharest_count_1)
      (not (visit_day ?d bucharest))
    )
    :effect (and
      (visit_day ?d bucharest)
      (not (current_day ?d))
      (current_day ?n)
      (not (bucharest_count_1))
      (bucharest_count_2)
    )
  )

  (:action spend_day_bucharest_2_3
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at bucharest)
      (bucharest_count_2)
      (not (visit_day ?d bucharest))
    )
    :effect (and
      (visit_day ?d bucharest)
      (not (current_day ?d))
      (current_day ?n)
      (not (bucharest_count_2))
      (bucharest_count_3)
    )
  )

  (:action spend_day_frankfurt_0_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at frankfurt)
      (frankfurt_count_0)
      (not (visit_day ?d frankfurt))
    )
    :effect (and
      (visit_day ?d frankfurt)
      (not (current_day ?d))
      (current_day ?n)
      (not (frankfurt_count_0))
      (frankfurt_count_1)
    )
  )

  (:action spend_day_frankfurt_1_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at frankfurt)
      (frankfurt_count_1)
      (not (visit_day ?d frankfurt))
    )
    :effect (and
      (visit_day ?d frankfurt)
      (not (current_day ?d))
      (current_day ?n)
      (not (frankfurt_count_1))
      (frankfurt_count_2)
    )
  )

  (:action spend_day_frankfurt_2_3
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at frankfurt)
      (frankfurt_count_2)
      (not (visit_day ?d frankfurt))
    )
    :effect (and
      (visit_day ?d frankfurt)
      (not (current_day ?d))
      (current_day ?n)
      (not (frankfurt_count_2))
      (frankfurt_count_3)
    )
  )

  (:action spend_day_stuttgart_0_1
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at stuttgart)
      (stuttgart_count_0)
      (not (visit_day ?d stuttgart))
    )
    :effect (and
      (visit_day ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
      (not (stuttgart_count_0))
      (stuttgart_count_1)
    )
  )

  (:action spend_day_stuttgart_1_2
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at stuttgart)
      (stuttgart_count_1)
      (not (visit_day ?d stuttgart))
    )
    :effect (and
      (visit_day ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
      (not (stuttgart_count_1))
      (stuttgart_count_2)
    )
  )

  (:action spend_day_stuttgart_2_3
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at stuttgart)
      (stuttgart_count_2)
      (not (visit_day ?d stuttgart))
    )
    :effect (and
      (visit_day ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
      (not (stuttgart_count_2))
      (stuttgart_count_3)
    )
  )

  (:action spend_day_stuttgart_3_4
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at stuttgart)
      (stuttgart_count_3)
      (not (visit_day ?d stuttgart))
    )
    :effect (and
      (visit_day ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
      (not (stuttgart_count_3))
      (stuttgart_count_4)
    )
  )

  (:action spend_day_stuttgart_4_5
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at stuttgart)
      (stuttgart_count_4)
      (not (visit_day ?d stuttgart))
    )
    :effect (and
      (visit_day ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
      (not (stuttgart_count_4))
      (stuttgart_count_5)
    )
  )

  (:action spend_day_stuttgart_5_6
    :parameters (?d - day ?n - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?n)
      (at stuttgart)
      (stuttgart_count_5)
      (not (visit_day ?d stuttgart))
    )
    :effect (and
      (visit_day ?d stuttgart)
      (not (current_day ?d))
      (current_day ?n)
      (not (stuttgart_count_5))
      (stuttgart_count_6)
    )
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and
      (visit_day ?d stuttgart)
      (not (workshop_done))
    )
    :effect (workshop_done)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )
)