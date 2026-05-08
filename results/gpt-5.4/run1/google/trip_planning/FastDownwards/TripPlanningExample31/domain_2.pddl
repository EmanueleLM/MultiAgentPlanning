(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d - day ?dn - day)
    (direct_flight ?from - city ?to - city)

    (visited_frankfurt_d1)
    (visited_frankfurt_d2)

    (visited_reykjavik_d1)
    (visited_reykjavik_d2)
    (visited_reykjavik_d3)

    (visited_split_d1)
    (visited_split_d2)
    (visited_split_d3)
    (visited_split_d4)
    (visited_split_d5)
    (visited_split_d6)
    (visited_split_d7)

    (workshop_day ?d - day)
    (workshop_done)
  )

  (:action stay_frankfurt_day_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at frankfurt)
      (not (visited_frankfurt_d1))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (visited_frankfurt_d1)
    )
  )

  (:action stay_frankfurt_day_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at frankfurt)
      (visited_frankfurt_d1)
      (not (visited_frankfurt_d2))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (visited_frankfurt_d2)
    )
  )

  (:action stay_reykjavik_day_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at reykjavik)
      (not (visited_reykjavik_d1))
      (not (workshop_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (visited_reykjavik_d1)
    )
  )

  (:action stay_reykjavik_day_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at reykjavik)
      (visited_reykjavik_d1)
      (not (visited_reykjavik_d2))
      (not (workshop_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (visited_reykjavik_d2)
    )
  )

  (:action stay_reykjavik_day_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at reykjavik)
      (visited_reykjavik_d2)
      (not (visited_reykjavik_d3))
      (not (workshop_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (visited_reykjavik_d3)
    )
  )

  (:action stay_reykjavik_workshop_day_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at reykjavik)
      (workshop_day ?d)
      (not (workshop_done))
      (not (visited_reykjavik_d1))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (visited_reykjavik_d1)
      (workshop_done)
    )
  )

  (:action stay_reykjavik_workshop_day_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at reykjavik)
      (workshop_day ?d)
      (not (workshop_done))
      (visited_reykjavik_d1)
      (not (visited_reykjavik_d2))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (visited_reykjavik_d2)
      (workshop_done)
    )
  )

  (:action stay_reykjavik_workshop_day_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at reykjavik)
      (workshop_day ?d)
      (not (workshop_done))
      (visited_reykjavik_d2)
      (not (visited_reykjavik_d3))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (visited_reykjavik_d3)
      (workshop_done)
    )
  )

  (:action stay_split_day_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at split)
      (not (visited_split_d1))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (visited_split_d1)
    )
  )

  (:action stay_split_day_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at split)
      (visited_split_d1)
      (not (visited_split_d2))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (visited_split_d2)
    )
  )

  (:action stay_split_day_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at split)
      (visited_split_d2)
      (not (visited_split_d3))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (visited_split_d3)
    )
  )

  (:action stay_split_day_4
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at split)
      (visited_split_d3)
      (not (visited_split_d4))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (visited_split_d4)
    )
  )

  (:action stay_split_day_5
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at split)
      (visited_split_d4)
      (not (visited_split_d5))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (visited_split_d5)
    )
  )

  (:action stay_split_day_6
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at split)
      (visited_split_d5)
      (not (visited_split_d6))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (visited_split_d6)
    )
  )

  (:action stay_split_day_7
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at split)
      (visited_split_d6)
      (not (visited_split_d7))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dn)
      (visited_split_d7)
    )
  )

  (:action fly_frankfurt_to_reykjavik_day_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at frankfurt)
      (direct_flight frankfurt reykjavik)
      (not (visited_reykjavik_d1))
      (not (workshop_day ?d))
    )
    :effect (and
      (not (at frankfurt))
      (at reykjavik)
      (not (current_day ?d))
      (current_day ?dn)
      (visited_reykjavik_d1)
    )
  )

  (:action fly_frankfurt_to_reykjavik_day_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at frankfurt)
      (direct_flight frankfurt reykjavik)
      (visited_reykjavik_d1)
      (not (visited_reykjavik_d2))
      (not (workshop_day ?d))
    )
    :effect (and
      (not (at frankfurt))
      (at reykjavik)
      (not (current_day ?d))
      (current_day ?dn)
      (visited_reykjavik_d2)
    )
  )

  (:action fly_frankfurt_to_reykjavik_day_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at frankfurt)
      (direct_flight frankfurt reykjavik)
      (visited_reykjavik_d2)
      (not (visited_reykjavik_d3))
      (not (workshop_day ?d))
    )
    :effect (and
      (not (at frankfurt))
      (at reykjavik)
      (not (current_day ?d))
      (current_day ?dn)
      (visited_reykjavik_d3)
    )
  )

  (:action fly_frankfurt_to_reykjavik_workshop_day_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at frankfurt)
      (direct_flight frankfurt reykjavik)
      (workshop_day ?d)
      (not (workshop_done))
      (not (visited_reykjavik_d1))
    )
    :effect (and
      (not (at frankfurt))
      (at reykjavik)
      (not (current_day ?d))
      (current_day ?dn)
      (visited_reykjavik_d1)
      (workshop_done)
    )
  )

  (:action fly_frankfurt_to_reykjavik_workshop_day_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at frankfurt)
      (direct_flight frankfurt reykjavik)
      (workshop_day ?d)
      (not (workshop_done))
      (visited_reykjavik_d1)
      (not (visited_reykjavik_d2))
    )
    :effect (and
      (not (at frankfurt))
      (at reykjavik)
      (not (current_day ?d))
      (current_day ?dn)
      (visited_reykjavik_d2)
      (workshop_done)
    )
  )

  (:action fly_frankfurt_to_reykjavik_workshop_day_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at frankfurt)
      (direct_flight frankfurt reykjavik)
      (workshop_day ?d)
      (not (workshop_done))
      (visited_reykjavik_d2)
      (not (visited_reykjavik_d3))
    )
    :effect (and
      (not (at frankfurt))
      (at reykjavik)
      (not (current_day ?d))
      (current_day ?dn)
      (visited_reykjavik_d3)
      (workshop_done)
    )
  )

  (:action fly_reykjavik_to_frankfurt_day_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at reykjavik)
      (direct_flight reykjavik frankfurt)
      (not (visited_frankfurt_d1))
    )
    :effect (and
      (not (at reykjavik))
      (at frankfurt)
      (not (current_day ?d))
      (current_day ?dn)
      (visited_frankfurt_d1)
    )
  )

  (:action fly_reykjavik_to_frankfurt_day_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at reykjavik)
      (direct_flight reykjavik frankfurt)
      (visited_frankfurt_d1)
      (not (visited_frankfurt_d2))
    )
    :effect (and
      (not (at reykjavik))
      (at frankfurt)
      (not (current_day ?d))
      (current_day ?dn)
      (visited_frankfurt_d2)
    )
  )

  (:action fly_frankfurt_to_split_day_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at frankfurt)
      (direct_flight frankfurt split)
      (not (visited_split_d1))
    )
    :effect (and
      (not (at frankfurt))
      (at split)
      (not (current_day ?d))
      (current_day ?dn)
      (visited_split_d1)
    )
  )

  (:action fly_frankfurt_to_split_day_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at frankfurt)
      (direct_flight frankfurt split)
      (visited_split_d1)
      (not (visited_split_d2))
    )
    :effect (and
      (not (at frankfurt))
      (at split)
      (not (current_day ?d))
      (current_day ?dn)
      (visited_split_d2)
    )
  )

  (:action fly_frankfurt_to_split_day_3
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at frankfurt)
      (direct_flight frankfurt split)
      (visited_split_d2)
      (not (visited_split_d3))
    )
    :effect (and
      (not (at frankfurt))
      (at split)
      (not (current_day ?d))
      (current_day ?dn)
      (visited_split_d3)
    )
  )

  (:action fly_frankfurt_to_split_day_4
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at frankfurt)
      (direct_flight frankfurt split)
      (visited_split_d3)
      (not (visited_split_d4))
    )
    :effect (and
      (not (at frankfurt))
      (at split)
      (not (current_day ?d))
      (current_day ?dn)
      (visited_split_d4)
    )
  )

  (:action fly_frankfurt_to_split_day_5
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at frankfurt)
      (direct_flight frankfurt split)
      (visited_split_d4)
      (not (visited_split_d5))
    )
    :effect (and
      (not (at frankfurt))
      (at split)
      (not (current_day ?d))
      (current_day ?dn)
      (visited_split_d5)
    )
  )

  (:action fly_frankfurt_to_split_day_6
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at frankfurt)
      (direct_flight frankfurt split)
      (visited_split_d5)
      (not (visited_split_d6))
    )
    :effect (and
      (not (at frankfurt))
      (at split)
      (not (current_day ?d))
      (current_day ?dn)
      (visited_split_d6)
    )
  )

  (:action fly_frankfurt_to_split_day_7
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at frankfurt)
      (direct_flight frankfurt split)
      (visited_split_d6)
      (not (visited_split_d7))
    )
    :effect (and
      (not (at frankfurt))
      (at split)
      (not (current_day ?d))
      (current_day ?dn)
      (visited_split_d7)
    )
  )

  (:action fly_split_to_frankfurt_day_1
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at split)
      (direct_flight split frankfurt)
      (not (visited_frankfurt_d1))
    )
    :effect (and
      (not (at split))
      (at frankfurt)
      (not (current_day ?d))
      (current_day ?dn)
      (visited_frankfurt_d1)
    )
  )

  (:action fly_split_to_frankfurt_day_2
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at split)
      (direct_flight split frankfurt)
      (visited_frankfurt_d1)
      (not (visited_frankfurt_d2))
    )
    :effect (and
      (not (at split))
      (at frankfurt)
      (not (current_day ?d))
      (current_day ?dn)
      (visited_frankfurt_d2)
    )
  )
)