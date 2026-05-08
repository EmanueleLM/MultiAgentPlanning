(define (domain european_trip_16_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (at_on ?c - city ?d - day)
    (assigned ?d - day)
    (current_day ?d - day)
    (started)
    (eligible_meeting_day ?d - day)
    (met_friend)

    (porto_count_0)
    (porto_count_1)
    (porto_count_2)
    (porto_count_3)
    (porto_count_4)
    (porto_count_5)
    (porto_count_6)
    (porto_count_7)

    (berlin_count_0)
    (berlin_count_1)
    (berlin_count_2)
    (berlin_count_3)
    (berlin_count_4)
    (berlin_count_5)
    (berlin_count_6)

    (reykjavik_count_0)
    (reykjavik_count_1)
    (reykjavik_count_2)
    (reykjavik_count_3)
    (reykjavik_count_4)
    (reykjavik_count_5)
  )

  (:action start_in_porto
    :parameters ()
    :precondition (and
      (not (started))
      (not (assigned d1))
      (porto_count_0)
    )
    :effect (and
      (started)
      (assigned d1)
      (at_on porto d1)
      (current_day d1)
      (not (porto_count_0))
      (porto_count_1)
    )
  )

  (:action start_in_berlin
    :parameters ()
    :precondition (and
      (not (started))
      (not (assigned d1))
      (berlin_count_0)
    )
    :effect (and
      (started)
      (assigned d1)
      (at_on berlin d1)
      (current_day d1)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action start_in_reykjavik
    :parameters ()
    :precondition (and
      (not (started))
      (not (assigned d1))
      (reykjavik_count_0)
    )
    :effect (and
      (started)
      (assigned d1)
      (at_on reykjavik d1)
      (current_day d1)
      (not (reykjavik_count_0))
      (reykjavik_count_1)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (eligible_meeting_day ?d)
      (at_on reykjavik ?d)
      (not (met_friend))
    )
    :effect (and
      (met_friend)
    )
  )

  (:action stay_next_in_porto_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on porto ?d1)
      (not (assigned ?d2))
      (porto_count_1)
    )
    :effect (and
      (assigned ?d2)
      (at_on porto ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (porto_count_1))
      (porto_count_2)
    )
  )

  (:action stay_next_in_porto_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on porto ?d1)
      (not (assigned ?d2))
      (porto_count_2)
    )
    :effect (and
      (assigned ?d2)
      (at_on porto ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (porto_count_2))
      (porto_count_3)
    )
  )

  (:action stay_next_in_porto_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on porto ?d1)
      (not (assigned ?d2))
      (porto_count_3)
    )
    :effect (and
      (assigned ?d2)
      (at_on porto ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (porto_count_3))
      (porto_count_4)
    )
  )

  (:action stay_next_in_porto_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on porto ?d1)
      (not (assigned ?d2))
      (porto_count_4)
    )
    :effect (and
      (assigned ?d2)
      (at_on porto ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (porto_count_4))
      (porto_count_5)
    )
  )

  (:action stay_next_in_porto_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on porto ?d1)
      (not (assigned ?d2))
      (porto_count_5)
    )
    :effect (and
      (assigned ?d2)
      (at_on porto ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (porto_count_5))
      (porto_count_6)
    )
  )

  (:action stay_next_in_porto_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on porto ?d1)
      (not (assigned ?d2))
      (porto_count_6)
    )
    :effect (and
      (assigned ?d2)
      (at_on porto ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (porto_count_6))
      (porto_count_7)
    )
  )

  (:action stay_next_in_berlin_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on berlin ?d1)
      (not (assigned ?d2))
      (berlin_count_1)
    )
    :effect (and
      (assigned ?d2)
      (at_on berlin ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action stay_next_in_berlin_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on berlin ?d1)
      (not (assigned ?d2))
      (berlin_count_2)
    )
    :effect (and
      (assigned ?d2)
      (at_on berlin ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action stay_next_in_berlin_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on berlin ?d1)
      (not (assigned ?d2))
      (berlin_count_3)
    )
    :effect (and
      (assigned ?d2)
      (at_on berlin ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (berlin_count_3))
      (berlin_count_4)
    )
  )

  (:action stay_next_in_berlin_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on berlin ?d1)
      (not (assigned ?d2))
      (berlin_count_4)
    )
    :effect (and
      (assigned ?d2)
      (at_on berlin ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (berlin_count_4))
      (berlin_count_5)
    )
  )

  (:action stay_next_in_berlin_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on berlin ?d1)
      (not (assigned ?d2))
      (berlin_count_5)
    )
    :effect (and
      (assigned ?d2)
      (at_on berlin ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (berlin_count_5))
      (berlin_count_6)
    )
  )

  (:action stay_next_in_reykjavik_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on reykjavik ?d1)
      (not (assigned ?d2))
      (reykjavik_count_1)
    )
    :effect (and
      (assigned ?d2)
      (at_on reykjavik ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (reykjavik_count_1))
      (reykjavik_count_2)
    )
  )

  (:action stay_next_in_reykjavik_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on reykjavik ?d1)
      (not (assigned ?d2))
      (reykjavik_count_2)
    )
    :effect (and
      (assigned ?d2)
      (at_on reykjavik ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (reykjavik_count_2))
      (reykjavik_count_3)
    )
  )

  (:action stay_next_in_reykjavik_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on reykjavik ?d1)
      (not (assigned ?d2))
      (reykjavik_count_3)
    )
    :effect (and
      (assigned ?d2)
      (at_on reykjavik ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (reykjavik_count_3))
      (reykjavik_count_4)
    )
  )

  (:action stay_next_in_reykjavik_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on reykjavik ?d1)
      (not (assigned ?d2))
      (reykjavik_count_4)
    )
    :effect (and
      (assigned ?d2)
      (at_on reykjavik ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (reykjavik_count_4))
      (reykjavik_count_5)
    )
  )

  (:action fly_next_porto_to_berlin_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on porto ?d1)
      (direct_flight porto berlin)
      (not (assigned ?d2))
      (berlin_count_0)
    )
    :effect (and
      (assigned ?d2)
      (at_on berlin ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action fly_next_porto_to_berlin_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on porto ?d1)
      (direct_flight porto berlin)
      (not (assigned ?d2))
      (berlin_count_1)
    )
    :effect (and
      (assigned ?d2)
      (at_on berlin ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action fly_next_porto_to_berlin_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on porto ?d1)
      (direct_flight porto berlin)
      (not (assigned ?d2))
      (berlin_count_2)
    )
    :effect (and
      (assigned ?d2)
      (at_on berlin ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action fly_next_porto_to_berlin_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on porto ?d1)
      (direct_flight porto berlin)
      (not (assigned ?d2))
      (berlin_count_3)
    )
    :effect (and
      (assigned ?d2)
      (at_on berlin ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (berlin_count_3))
      (berlin_count_4)
    )
  )

  (:action fly_next_porto_to_berlin_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on porto ?d1)
      (direct_flight porto berlin)
      (not (assigned ?d2))
      (berlin_count_4)
    )
    :effect (and
      (assigned ?d2)
      (at_on berlin ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (berlin_count_4))
      (berlin_count_5)
    )
  )

  (:action fly_next_porto_to_berlin_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on porto ?d1)
      (direct_flight porto berlin)
      (not (assigned ?d2))
      (berlin_count_5)
    )
    :effect (and
      (assigned ?d2)
      (at_on berlin ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (berlin_count_5))
      (berlin_count_6)
    )
  )

  (:action fly_next_berlin_to_porto_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on berlin ?d1)
      (direct_flight berlin porto)
      (not (assigned ?d2))
      (porto_count_0)
    )
    :effect (and
      (assigned ?d2)
      (at_on porto ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (porto_count_0))
      (porto_count_1)
    )
  )

  (:action fly_next_berlin_to_porto_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on berlin ?d1)
      (direct_flight berlin porto)
      (not (assigned ?d2))
      (porto_count_1)
    )
    :effect (and
      (assigned ?d2)
      (at_on porto ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (porto_count_1))
      (porto_count_2)
    )
  )

  (:action fly_next_berlin_to_porto_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on berlin ?d1)
      (direct_flight berlin porto)
      (not (assigned ?d2))
      (porto_count_2)
    )
    :effect (and
      (assigned ?d2)
      (at_on porto ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (porto_count_2))
      (porto_count_3)
    )
  )

  (:action fly_next_berlin_to_porto_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on berlin ?d1)
      (direct_flight berlin porto)
      (not (assigned ?d2))
      (porto_count_3)
    )
    :effect (and
      (assigned ?d2)
      (at_on porto ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (porto_count_3))
      (porto_count_4)
    )
  )

  (:action fly_next_berlin_to_porto_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on berlin ?d1)
      (direct_flight berlin porto)
      (not (assigned ?d2))
      (porto_count_4)
    )
    :effect (and
      (assigned ?d2)
      (at_on porto ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (porto_count_4))
      (porto_count_5)
    )
  )

  (:action fly_next_berlin_to_porto_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on berlin ?d1)
      (direct_flight berlin porto)
      (not (assigned ?d2))
      (porto_count_5)
    )
    :effect (and
      (assigned ?d2)
      (at_on porto ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (porto_count_5))
      (porto_count_6)
    )
  )

  (:action fly_next_berlin_to_porto_6
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on berlin ?d1)
      (direct_flight berlin porto)
      (not (assigned ?d2))
      (porto_count_6)
    )
    :effect (and
      (assigned ?d2)
      (at_on porto ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (porto_count_6))
      (porto_count_7)
    )
  )

  (:action fly_next_berlin_to_reykjavik_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on berlin ?d1)
      (direct_flight berlin reykjavik)
      (not (assigned ?d2))
      (reykjavik_count_0)
    )
    :effect (and
      (assigned ?d2)
      (at_on reykjavik ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (reykjavik_count_0))
      (reykjavik_count_1)
    )
  )

  (:action fly_next_berlin_to_reykjavik_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on berlin ?d1)
      (direct_flight berlin reykjavik)
      (not (assigned ?d2))
      (reykjavik_count_1)
    )
    :effect (and
      (assigned ?d2)
      (at_on reykjavik ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (reykjavik_count_1))
      (reykjavik_count_2)
    )
  )

  (:action fly_next_berlin_to_reykjavik_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on berlin ?d1)
      (direct_flight berlin reykjavik)
      (not (assigned ?d2))
      (reykjavik_count_2)
    )
    :effect (and
      (assigned ?d2)
      (at_on reykjavik ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (reykjavik_count_2))
      (reykjavik_count_3)
    )
  )

  (:action fly_next_berlin_to_reykjavik_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on berlin ?d1)
      (direct_flight berlin reykjavik)
      (not (assigned ?d2))
      (reykjavik_count_3)
    )
    :effect (and
      (assigned ?d2)
      (at_on reykjavik ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (reykjavik_count_3))
      (reykjavik_count_4)
    )
  )

  (:action fly_next_berlin_to_reykjavik_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on berlin ?d1)
      (direct_flight berlin reykjavik)
      (not (assigned ?d2))
      (reykjavik_count_4)
    )
    :effect (and
      (assigned ?d2)
      (at_on reykjavik ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (reykjavik_count_4))
      (reykjavik_count_5)
    )
  )

  (:action fly_next_reykjavik_to_berlin_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on reykjavik ?d1)
      (direct_flight reykjavik berlin)
      (not (assigned ?d2))
      (berlin_count_0)
    )
    :effect (and
      (assigned ?d2)
      (at_on berlin ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action fly_next_reykjavik_to_berlin_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on reykjavik ?d1)
      (direct_flight reykjavik berlin)
      (not (assigned ?d2))
      (berlin_count_1)
    )
    :effect (and
      (assigned ?d2)
      (at_on berlin ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action fly_next_reykjavik_to_berlin_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on reykjavik ?d1)
      (direct_flight reykjavik berlin)
      (not (assigned ?d2))
      (berlin_count_2)
    )
    :effect (and
      (assigned ?d2)
      (at_on berlin ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action fly_next_reykjavik_to_berlin_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on reykjavik ?d1)
      (direct_flight reykjavik berlin)
      (not (assigned ?d2))
      (berlin_count_3)
    )
    :effect (and
      (assigned ?d2)
      (at_on berlin ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (berlin_count_3))
      (berlin_count_4)
    )
  )

  (:action fly_next_reykjavik_to_berlin_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on reykjavik ?d1)
      (direct_flight reykjavik berlin)
      (not (assigned ?d2))
      (berlin_count_4)
    )
    :effect (and
      (assigned ?d2)
      (at_on berlin ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (berlin_count_4))
      (berlin_count_5)
    )
  )

  (:action fly_next_reykjavik_to_berlin_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on reykjavik ?d1)
      (direct_flight reykjavik berlin)
      (not (assigned ?d2))
      (berlin_count_5)
    )
    :effect (and
      (assigned ?d2)
      (at_on berlin ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (berlin_count_5))
      (berlin_count_6)
    )
  )
)