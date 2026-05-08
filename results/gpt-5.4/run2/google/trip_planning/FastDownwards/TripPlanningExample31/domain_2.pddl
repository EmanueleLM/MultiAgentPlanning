(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)

    (spent ?c - city ?d - day)

    (workshop_day ?d - day)
    (workshop_done)

    (need_frankfurt_0)
    (need_frankfurt_1)
    (need_frankfurt_2)

    (need_reykjavik_0)
    (need_reykjavik_1)
    (need_reykjavik_2)
    (need_reykjavik_3)

    (need_split_0)
    (need_split_1)
    (need_split_2)
    (need_split_3)
    (need_split_4)
    (need_split_5)
    (need_split_6)
    (need_split_7)
  )

  (:action stay_frankfurt_0_1
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at frankfurt)
      (need_frankfurt_0)
      (not (spent frankfurt ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (spent frankfurt ?d)
      (not (need_frankfurt_0))
      (need_frankfurt_1)
    )
  )

  (:action stay_frankfurt_1_2
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at frankfurt)
      (need_frankfurt_1)
      (not (spent frankfurt ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (spent frankfurt ?d)
      (not (need_frankfurt_1))
      (need_frankfurt_2)
    )
  )

  (:action stay_reykjavik_0_1
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at reykjavik)
      (need_reykjavik_0)
      (not (spent reykjavik ?d))
      (not (workshop_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (spent reykjavik ?d)
      (not (need_reykjavik_0))
      (need_reykjavik_1)
    )
  )

  (:action stay_reykjavik_1_2
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at reykjavik)
      (need_reykjavik_1)
      (not (spent reykjavik ?d))
      (not (workshop_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (spent reykjavik ?d)
      (not (need_reykjavik_1))
      (need_reykjavik_2)
    )
  )

  (:action stay_reykjavik_2_3
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at reykjavik)
      (need_reykjavik_2)
      (not (spent reykjavik ?d))
      (not (workshop_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (spent reykjavik ?d)
      (not (need_reykjavik_2))
      (need_reykjavik_3)
    )
  )

  (:action stay_reykjavik_workshop_0_1
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at reykjavik)
      (need_reykjavik_0)
      (not (spent reykjavik ?d))
      (workshop_day ?d)
      (not (workshop_done))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (spent reykjavik ?d)
      (not (need_reykjavik_0))
      (need_reykjavik_1)
      (workshop_done)
    )
  )

  (:action stay_reykjavik_workshop_1_2
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at reykjavik)
      (need_reykjavik_1)
      (not (spent reykjavik ?d))
      (workshop_day ?d)
      (not (workshop_done))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (spent reykjavik ?d)
      (not (need_reykjavik_1))
      (need_reykjavik_2)
      (workshop_done)
    )
  )

  (:action stay_reykjavik_workshop_2_3
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at reykjavik)
      (need_reykjavik_2)
      (not (spent reykjavik ?d))
      (workshop_day ?d)
      (not (workshop_done))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (spent reykjavik ?d)
      (not (need_reykjavik_2))
      (need_reykjavik_3)
      (workshop_done)
    )
  )

  (:action stay_split_0_1
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at split)
      (need_split_0)
      (not (spent split ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (spent split ?d)
      (not (need_split_0))
      (need_split_1)
    )
  )

  (:action stay_split_1_2
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at split)
      (need_split_1)
      (not (spent split ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (spent split ?d)
      (not (need_split_1))
      (need_split_2)
    )
  )

  (:action stay_split_2_3
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at split)
      (need_split_2)
      (not (spent split ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (spent split ?d)
      (not (need_split_2))
      (need_split_3)
    )
  )

  (:action stay_split_3_4
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at split)
      (need_split_3)
      (not (spent split ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (spent split ?d)
      (not (need_split_3))
      (need_split_4)
    )
  )

  (:action stay_split_4_5
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at split)
      (need_split_4)
      (not (spent split ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (spent split ?d)
      (not (need_split_4))
      (need_split_5)
    )
  )

  (:action stay_split_5_6
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at split)
      (need_split_5)
      (not (spent split ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (spent split ?d)
      (not (need_split_5))
      (need_split_6)
    )
  )

  (:action stay_split_6_7
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at split)
      (need_split_6)
      (not (spent split ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (spent split ?d)
      (not (need_split_6))
      (need_split_7)
    )
  )

  (:action fly_frankfurt_to_reykjavik
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at frankfurt)
      (direct frankfurt reykjavik)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (at frankfurt))
      (at reykjavik)
    )
  )

  (:action fly_reykjavik_to_frankfurt
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at reykjavik)
      (direct reykjavik frankfurt)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (at reykjavik))
      (at frankfurt)
    )
  )

  (:action fly_frankfurt_to_split
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at frankfurt)
      (direct frankfurt split)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (at frankfurt))
      (at split)
    )
  )

  (:action fly_split_to_frankfurt
    :parameters (?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at split)
      (direct split frankfurt)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (at split))
      (at frankfurt)
    )
  )
)