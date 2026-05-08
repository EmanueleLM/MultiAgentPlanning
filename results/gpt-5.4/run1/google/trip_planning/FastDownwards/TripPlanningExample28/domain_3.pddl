(define (domain trip_planning_example28)
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
    (last_day ?d - day)
    (visited_on ?d - day ?c - city)
    (venice_0)
    (venice_1)
    (venice_2)
    (venice_3)
    (venice_4)
    (venice_5)
    (venice_6)
    (florence_0)
    (florence_1)
    (florence_2)
    (florence_3)
    (florence_4)
    (florence_5)
    (florence_6)
    (zurich_0)
    (zurich_1)
    (zurich_2)
    (day_visited)
    (trip_done)
  )

  (:action start_in_venice
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (not (at venice))
      (not (at florence))
      (not (at zurich))
      (venice_0)
      (not (visited_on ?d venice))
    )
    :effect (and
      (at venice)
      (visited_on ?d venice)
      (day_visited)
      (not (venice_0))
      (venice_1)
    )
  )

  (:action start_in_florence
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (not (at venice))
      (not (at florence))
      (not (at zurich))
      (florence_0)
      (not (visited_on ?d florence))
    )
    :effect (and
      (at florence)
      (visited_on ?d florence)
      (day_visited)
      (not (florence_0))
      (florence_1)
    )
  )

  (:action start_in_zurich
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (not (at venice))
      (not (at florence))
      (not (at zurich))
      (zurich_0)
      (not (visited_on ?d zurich))
    )
    :effect (and
      (at zurich)
      (visited_on ?d zurich)
      (day_visited)
      (not (zurich_0))
      (zurich_1)
    )
  )

  (:action stay_venice_1_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at venice)
      (venice_1)
      (not (visited_on ?d venice))
    )
    :effect (and
      (visited_on ?d venice)
      (day_visited)
      (not (venice_1))
      (venice_2)
    )
  )

  (:action stay_venice_2_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at venice)
      (venice_2)
      (not (visited_on ?d venice))
    )
    :effect (and
      (visited_on ?d venice)
      (day_visited)
      (not (venice_2))
      (venice_3)
    )
  )

  (:action stay_venice_3_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at venice)
      (venice_3)
      (not (visited_on ?d venice))
    )
    :effect (and
      (visited_on ?d venice)
      (day_visited)
      (not (venice_3))
      (venice_4)
    )
  )

  (:action stay_venice_4_5
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at venice)
      (venice_4)
      (not (visited_on ?d venice))
    )
    :effect (and
      (visited_on ?d venice)
      (day_visited)
      (not (venice_4))
      (venice_5)
    )
  )

  (:action stay_venice_5_6
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at venice)
      (venice_5)
      (not (visited_on ?d venice))
    )
    :effect (and
      (visited_on ?d venice)
      (day_visited)
      (not (venice_5))
      (venice_6)
    )
  )

  (:action stay_florence_1_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at florence)
      (florence_1)
      (not (visited_on ?d florence))
    )
    :effect (and
      (visited_on ?d florence)
      (day_visited)
      (not (florence_1))
      (florence_2)
    )
  )

  (:action stay_florence_2_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at florence)
      (florence_2)
      (not (visited_on ?d florence))
    )
    :effect (and
      (visited_on ?d florence)
      (day_visited)
      (not (florence_2))
      (florence_3)
    )
  )

  (:action stay_florence_3_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at florence)
      (florence_3)
      (not (visited_on ?d florence))
    )
    :effect (and
      (visited_on ?d florence)
      (day_visited)
      (not (florence_3))
      (florence_4)
    )
  )

  (:action stay_florence_4_5
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at florence)
      (florence_4)
      (not (visited_on ?d florence))
    )
    :effect (and
      (visited_on ?d florence)
      (day_visited)
      (not (florence_4))
      (florence_5)
    )
  )

  (:action stay_florence_5_6
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at florence)
      (florence_5)
      (not (visited_on ?d florence))
    )
    :effect (and
      (visited_on ?d florence)
      (day_visited)
      (not (florence_5))
      (florence_6)
    )
  )

  (:action stay_zurich_1_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at zurich)
      (zurich_1)
      (not (visited_on ?d zurich))
    )
    :effect (and
      (visited_on ?d zurich)
      (day_visited)
      (not (zurich_1))
      (zurich_2)
    )
  )

  (:action fly_venice_to_zurich_0_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at venice)
      (direct venice zurich)
      (zurich_0)
      (not (visited_on ?d zurich))
    )
    :effect (and
      (not (at venice))
      (at zurich)
      (visited_on ?d zurich)
      (day_visited)
      (not (zurich_0))
      (zurich_1)
    )
  )

  (:action fly_venice_to_zurich_1_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at venice)
      (direct venice zurich)
      (zurich_1)
      (not (visited_on ?d zurich))
    )
    :effect (and
      (not (at venice))
      (at zurich)
      (visited_on ?d zurich)
      (day_visited)
      (not (zurich_1))
      (zurich_2)
    )
  )

  (:action fly_zurich_to_venice_0_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at zurich)
      (direct zurich venice)
      (venice_0)
      (not (visited_on ?d venice))
    )
    :effect (and
      (not (at zurich))
      (at venice)
      (visited_on ?d venice)
      (day_visited)
      (not (venice_0))
      (venice_1)
    )
  )

  (:action fly_zurich_to_venice_1_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at zurich)
      (direct zurich venice)
      (venice_1)
      (not (visited_on ?d venice))
    )
    :effect (and
      (not (at zurich))
      (at venice)
      (visited_on ?d venice)
      (day_visited)
      (not (venice_1))
      (venice_2)
    )
  )

  (:action fly_zurich_to_venice_2_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at zurich)
      (direct zurich venice)
      (venice_2)
      (not (visited_on ?d venice))
    )
    :effect (and
      (not (at zurich))
      (at venice)
      (visited_on ?d venice)
      (day_visited)
      (not (venice_2))
      (venice_3)
    )
  )

  (:action fly_zurich_to_venice_3_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at zurich)
      (direct zurich venice)
      (venice_3)
      (not (visited_on ?d venice))
    )
    :effect (and
      (not (at zurich))
      (at venice)
      (visited_on ?d venice)
      (day_visited)
      (not (venice_3))
      (venice_4)
    )
  )

  (:action fly_zurich_to_venice_4_5
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at zurich)
      (direct zurich venice)
      (venice_4)
      (not (visited_on ?d venice))
    )
    :effect (and
      (not (at zurich))
      (at venice)
      (visited_on ?d venice)
      (day_visited)
      (not (venice_4))
      (venice_5)
    )
  )

  (:action fly_zurich_to_venice_5_6
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at zurich)
      (direct zurich venice)
      (venice_5)
      (not (visited_on ?d venice))
    )
    :effect (and
      (not (at zurich))
      (at venice)
      (visited_on ?d venice)
      (day_visited)
      (not (venice_5))
      (venice_6)
    )
  )

  (:action fly_zurich_to_florence_0_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at zurich)
      (direct zurich florence)
      (florence_0)
      (not (visited_on ?d florence))
    )
    :effect (and
      (not (at zurich))
      (at florence)
      (visited_on ?d florence)
      (day_visited)
      (not (florence_0))
      (florence_1)
    )
  )

  (:action fly_zurich_to_florence_1_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at zurich)
      (direct zurich florence)
      (florence_1)
      (not (visited_on ?d florence))
    )
    :effect (and
      (not (at zurich))
      (at florence)
      (visited_on ?d florence)
      (day_visited)
      (not (florence_1))
      (florence_2)
    )
  )

  (:action fly_zurich_to_florence_2_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at zurich)
      (direct zurich florence)
      (florence_2)
      (not (visited_on ?d florence))
    )
    :effect (and
      (not (at zurich))
      (at florence)
      (visited_on ?d florence)
      (day_visited)
      (not (florence_2))
      (florence_3)
    )
  )

  (:action fly_zurich_to_florence_3_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at zurich)
      (direct zurich florence)
      (florence_3)
      (not (visited_on ?d florence))
    )
    :effect (and
      (not (at zurich))
      (at florence)
      (visited_on ?d florence)
      (day_visited)
      (not (florence_3))
      (florence_4)
    )
  )

  (:action fly_zurich_to_florence_4_5
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at zurich)
      (direct zurich florence)
      (florence_4)
      (not (visited_on ?d florence))
    )
    :effect (and
      (not (at zurich))
      (at florence)
      (visited_on ?d florence)
      (day_visited)
      (not (florence_4))
      (florence_5)
    )
  )

  (:action fly_zurich_to_florence_5_6
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (day_visited))
      (at zurich)
      (direct zurich florence)
      (florence_5)
      (not (visited_on ?d florence))
    )
    :effect (and
      (not (at zurich))
      (at florence)
      (visited_on ?d florence)
      (day_visited)
      (not (florence_5))
      (florence_6)
    )
  )

  (:action advance_day
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (day_visited)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (day_visited))
    )
  )

  (:action finish_trip
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (day_visited)
      (venice_6)
      (florence_6)
      (zurich_2)
    )
    :effect (and
      (trip_done)
    )
  )
)