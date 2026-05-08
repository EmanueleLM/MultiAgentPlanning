(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (workshop_day ?d1 - day ?d2 - day)
    (attended_workshop)

    (frankfurt_days_0)
    (frankfurt_days_1)
    (frankfurt_days_2)

    (reykjavik_days_0)
    (reykjavik_days_1)
    (reykjavik_days_2)
    (reykjavik_days_3)

    (split_days_0)
    (split_days_1)
    (split_days_2)
    (split_days_3)
    (split_days_4)
    (split_days_5)
    (split_days_6)
    (split_days_7)
  )

  (:action stay_frankfurt_0_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at frankfurt)
      (frankfurt_days_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (frankfurt_days_0))
      (frankfurt_days_1)
    )
  )

  (:action stay_frankfurt_1_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at frankfurt)
      (frankfurt_days_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (frankfurt_days_1))
      (frankfurt_days_2)
    )
  )

  (:action fly_to_frankfurt_0_1
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at ?from)
      (direct ?from frankfurt)
      (frankfurt_days_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at frankfurt)
      (not (frankfurt_days_0))
      (frankfurt_days_1)
    )
  )

  (:action fly_to_frankfurt_1_2
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at ?from)
      (direct ?from frankfurt)
      (frankfurt_days_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at frankfurt)
      (not (frankfurt_days_1))
      (frankfurt_days_2)
    )
  )

  (:action stay_split_0_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at split)
      (split_days_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (split_days_0))
      (split_days_1)
    )
  )

  (:action stay_split_1_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at split)
      (split_days_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (split_days_1))
      (split_days_2)
    )
  )

  (:action stay_split_2_3
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at split)
      (split_days_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (split_days_2))
      (split_days_3)
    )
  )

  (:action stay_split_3_4
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at split)
      (split_days_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (split_days_3))
      (split_days_4)
    )
  )

  (:action stay_split_4_5
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at split)
      (split_days_4)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (split_days_4))
      (split_days_5)
    )
  )

  (:action stay_split_5_6
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at split)
      (split_days_5)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (split_days_5))
      (split_days_6)
    )
  )

  (:action stay_split_6_7
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at split)
      (split_days_6)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (split_days_6))
      (split_days_7)
    )
  )

  (:action fly_to_split_0_1
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at ?from)
      (direct ?from split)
      (split_days_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at split)
      (not (split_days_0))
      (split_days_1)
    )
  )

  (:action fly_to_split_1_2
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at ?from)
      (direct ?from split)
      (split_days_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at split)
      (not (split_days_1))
      (split_days_2)
    )
  )

  (:action fly_to_split_2_3
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at ?from)
      (direct ?from split)
      (split_days_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at split)
      (not (split_days_2))
      (split_days_3)
    )
  )

  (:action fly_to_split_3_4
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at ?from)
      (direct ?from split)
      (split_days_3)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at split)
      (not (split_days_3))
      (split_days_4)
    )
  )

  (:action fly_to_split_4_5
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at ?from)
      (direct ?from split)
      (split_days_4)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at split)
      (not (split_days_4))
      (split_days_5)
    )
  )

  (:action fly_to_split_5_6
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at ?from)
      (direct ?from split)
      (split_days_5)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at split)
      (not (split_days_5))
      (split_days_6)
    )
  )

  (:action fly_to_split_6_7
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at ?from)
      (direct ?from split)
      (split_days_6)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at split)
      (not (split_days_6))
      (split_days_7)
    )
  )

  (:action stay_reykjavik_0_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at reykjavik)
      (reykjavik_days_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (reykjavik_days_0))
      (reykjavik_days_1)
    )
  )

  (:action stay_reykjavik_1_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at reykjavik)
      (reykjavik_days_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (reykjavik_days_1))
      (reykjavik_days_2)
    )
  )

  (:action stay_reykjavik_2_3
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at reykjavik)
      (reykjavik_days_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (reykjavik_days_2))
      (reykjavik_days_3)
    )
  )

  (:action fly_to_reykjavik_0_1
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at ?from)
      (direct ?from reykjavik)
      (reykjavik_days_0)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at reykjavik)
      (not (reykjavik_days_0))
      (reykjavik_days_1)
    )
  )

  (:action fly_to_reykjavik_1_2
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at ?from)
      (direct ?from reykjavik)
      (reykjavik_days_1)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at reykjavik)
      (not (reykjavik_days_1))
      (reykjavik_days_2)
    )
  )

  (:action fly_to_reykjavik_2_3
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at ?from)
      (direct ?from reykjavik)
      (reykjavik_days_2)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at reykjavik)
      (not (reykjavik_days_2))
      (reykjavik_days_3)
    )
  )

  (:action stay_reykjavik_workshop_0_1
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (workshop_day ?d ?d_next)
      (at reykjavik)
      (reykjavik_days_0)
      (not (attended_workshop))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (reykjavik_days_0))
      (reykjavik_days_1)
      (attended_workshop)
    )
  )

  (:action stay_reykjavik_workshop_1_2
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (workshop_day ?d ?d_next)
      (at reykjavik)
      (reykjavik_days_1)
      (not (attended_workshop))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (reykjavik_days_1))
      (reykjavik_days_2)
      (attended_workshop)
    )
  )

  (:action stay_reykjavik_workshop_2_3
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (workshop_day ?d ?d_next)
      (at reykjavik)
      (reykjavik_days_2)
      (not (attended_workshop))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (reykjavik_days_2))
      (reykjavik_days_3)
      (attended_workshop)
    )
  )

  (:action fly_to_reykjavik_workshop_0_1
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (workshop_day ?d ?d_next)
      (at ?from)
      (direct ?from reykjavik)
      (reykjavik_days_0)
      (not (attended_workshop))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at reykjavik)
      (not (reykjavik_days_0))
      (reykjavik_days_1)
      (attended_workshop)
    )
  )

  (:action fly_to_reykjavik_workshop_1_2
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (workshop_day ?d ?d_next)
      (at ?from)
      (direct ?from reykjavik)
      (reykjavik_days_1)
      (not (attended_workshop))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at reykjavik)
      (not (reykjavik_days_1))
      (reykjavik_days_2)
      (attended_workshop)
    )
  )

  (:action fly_to_reykjavik_workshop_2_3
    :parameters (?from - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (workshop_day ?d ?d_next)
      (at ?from)
      (direct ?from reykjavik)
      (reykjavik_days_2)
      (not (attended_workshop))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at reykjavik)
      (not (reykjavik_days_2))
      (reykjavik_days_3)
      (attended_workshop)
    )
  )
)