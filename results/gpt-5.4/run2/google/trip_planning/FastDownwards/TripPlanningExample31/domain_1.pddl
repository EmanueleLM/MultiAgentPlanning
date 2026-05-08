(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d ?nd - day)
    (current_day ?d - day)

    (visited_day ?c - city ?d - day)

    (need_workshop ?d - day)
    (workshop_done)

    (count_frankfurt_0)
    (count_frankfurt_1)
    (count_frankfurt_2)

    (count_reykjavik_0)
    (count_reykjavik_1)
    (count_reykjavik_2)
    (count_reykjavik_3)

    (count_split_0)
    (count_split_1)
    (count_split_2)
    (count_split_3)
    (count_split_4)
    (count_split_5)
    (count_split_6)
    (count_split_7)
  )

  (:action stay_frankfurt_0_1
    :parameters (?d ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at frankfurt)
      (count_frankfurt_0)
      (not (visited_day frankfurt ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (visited_day frankfurt ?d)
      (not (count_frankfurt_0))
      (count_frankfurt_1)
    )
  )

  (:action stay_frankfurt_1_2
    :parameters (?d ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at frankfurt)
      (count_frankfurt_1)
      (not (visited_day frankfurt ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (visited_day frankfurt ?d)
      (not (count_frankfurt_1))
      (count_frankfurt_2)
    )
  )

  (:action stay_reykjavik_0_1
    :parameters (?d ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at reykjavik)
      (count_reykjavik_0)
      (not (visited_day reykjavik ?d))
      (not (need_workshop ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (visited_day reykjavik ?d)
      (not (count_reykjavik_0))
      (count_reykjavik_1)
    )
  )

  (:action stay_reykjavik_1_2
    :parameters (?d ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at reykjavik)
      (count_reykjavik_1)
      (not (visited_day reykjavik ?d))
      (not (need_workshop ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (visited_day reykjavik ?d)
      (not (count_reykjavik_1))
      (count_reykjavik_2)
    )
  )

  (:action stay_reykjavik_2_3
    :parameters (?d ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at reykjavik)
      (count_reykjavik_2)
      (not (visited_day reykjavik ?d))
      (not (need_workshop ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (visited_day reykjavik ?d)
      (not (count_reykjavik_2))
      (count_reykjavik_3)
    )
  )

  (:action stay_reykjavik_workshop_0_1
    :parameters (?d ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at reykjavik)
      (count_reykjavik_0)
      (not (visited_day reykjavik ?d))
      (need_workshop ?d)
      (not (workshop_done))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (visited_day reykjavik ?d)
      (not (count_reykjavik_0))
      (count_reykjavik_1)
      (workshop_done)
    )
  )

  (:action stay_reykjavik_workshop_1_2
    :parameters (?d ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at reykjavik)
      (count_reykjavik_1)
      (not (visited_day reykjavik ?d))
      (need_workshop ?d)
      (not (workshop_done))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (visited_day reykjavik ?d)
      (not (count_reykjavik_1))
      (count_reykjavik_2)
      (workshop_done)
    )
  )

  (:action stay_reykjavik_workshop_2_3
    :parameters (?d ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at reykjavik)
      (count_reykjavik_2)
      (not (visited_day reykjavik ?d))
      (need_workshop ?d)
      (not (workshop_done))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (visited_day reykjavik ?d)
      (not (count_reykjavik_2))
      (count_reykjavik_3)
      (workshop_done)
    )
  )

  (:action stay_split_0_1
    :parameters (?d ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at split)
      (count_split_0)
      (not (visited_day split ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (visited_day split ?d)
      (not (count_split_0))
      (count_split_1)
    )
  )

  (:action stay_split_1_2
    :parameters (?d ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at split)
      (count_split_1)
      (not (visited_day split ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (visited_day split ?d)
      (not (count_split_1))
      (count_split_2)
    )
  )

  (:action stay_split_2_3
    :parameters (?d ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at split)
      (count_split_2)
      (not (visited_day split ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (visited_day split ?d)
      (not (count_split_2))
      (count_split_3)
    )
  )

  (:action stay_split_3_4
    :parameters (?d ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at split)
      (count_split_3)
      (not (visited_day split ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (visited_day split ?d)
      (not (count_split_3))
      (count_split_4)
    )
  )

  (:action stay_split_4_5
    :parameters (?d ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at split)
      (count_split_4)
      (not (visited_day split ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (visited_day split ?d)
      (not (count_split_4))
      (count_split_5)
    )
  )

  (:action stay_split_5_6
    :parameters (?d ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at split)
      (count_split_5)
      (not (visited_day split ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (visited_day split ?d)
      (not (count_split_5))
      (count_split_6)
    )
  )

  (:action stay_split_6_7
    :parameters (?d ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at split)
      (count_split_6)
      (not (visited_day split ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (visited_day split ?d)
      (not (count_split_6))
      (count_split_7)
    )
  )

  (:action fly_frankfurt_to_reykjavik
    :parameters (?d ?nd - day)
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
    :parameters (?d ?nd - day)
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
    :parameters (?d ?nd - day)
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
    :parameters (?d ?nd - day)
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