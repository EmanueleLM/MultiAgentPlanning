(define (domain trip_planning_example26)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:constants porto berlin reykjavik - city)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (friend_window ?d - day)

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

    (met_friend)
    (trip_finished)
  )

  (:action stay_in_porto_0_1
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at porto)
      (porto_count_0)
      (not (porto_count_7))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (porto_count_0))
      (porto_count_1)
    )
  )

  (:action stay_in_porto_1_2
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at porto)
      (porto_count_1)
      (not (porto_count_7))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (porto_count_1))
      (porto_count_2)
    )
  )

  (:action stay_in_porto_2_3
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at porto)
      (porto_count_2)
      (not (porto_count_7))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (porto_count_2))
      (porto_count_3)
    )
  )

  (:action stay_in_porto_3_4
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at porto)
      (porto_count_3)
      (not (porto_count_7))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (porto_count_3))
      (porto_count_4)
    )
  )

  (:action stay_in_porto_4_5
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at porto)
      (porto_count_4)
      (not (porto_count_7))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (porto_count_4))
      (porto_count_5)
    )
  )

  (:action stay_in_porto_5_6
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at porto)
      (porto_count_5)
      (not (porto_count_7))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (porto_count_5))
      (porto_count_6)
    )
  )

  (:action stay_in_berlin_0_1
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at berlin)
      (berlin_count_0)
      (not (berlin_count_6))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (berlin_count_0))
      (berlin_count_1)
    )
  )

  (:action stay_in_berlin_1_2
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at berlin)
      (berlin_count_1)
      (not (berlin_count_6))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (berlin_count_1))
      (berlin_count_2)
    )
  )

  (:action stay_in_berlin_2_3
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at berlin)
      (berlin_count_2)
      (not (berlin_count_6))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (berlin_count_2))
      (berlin_count_3)
    )
  )

  (:action stay_in_berlin_3_4
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at berlin)
      (berlin_count_3)
      (not (berlin_count_6))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (berlin_count_3))
      (berlin_count_4)
    )
  )

  (:action stay_in_berlin_4_5
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at berlin)
      (berlin_count_4)
      (not (berlin_count_6))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (berlin_count_4))
      (berlin_count_5)
    )
  )

  (:action stay_in_reykjavik_0_1
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at reykjavik)
      (reykjavik_count_0)
      (not (reykjavik_count_5))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (reykjavik_count_0))
      (reykjavik_count_1)
    )
  )

  (:action stay_in_reykjavik_1_2
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at reykjavik)
      (reykjavik_count_1)
      (not (reykjavik_count_5))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (reykjavik_count_1))
      (reykjavik_count_2)
    )
  )

  (:action stay_in_reykjavik_2_3
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at reykjavik)
      (reykjavik_count_2)
      (not (reykjavik_count_5))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (reykjavik_count_2))
      (reykjavik_count_3)
    )
  )

  (:action stay_in_reykjavik_3_4
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at reykjavik)
      (reykjavik_count_3)
      (not (reykjavik_count_5))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (not (reykjavik_count_3))
      (reykjavik_count_4)
    )
  )

  (:action meet_friend_in_reykjavik_4_5
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at reykjavik)
      (friend_window ?d)
      (not (met_friend))
      (reykjavik_count_4)
    )
    :effect (and
      (met_friend)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (reykjavik_count_4))
      (reykjavik_count_5)
    )
  )

  (:action meet_friend_in_reykjavik_0_1
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at reykjavik)
      (friend_window ?d)
      (not (met_friend))
      (reykjavik_count_0)
      (not (reykjavik_count_5))
    )
    :effect (and
      (met_friend)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (reykjavik_count_0))
      (reykjavik_count_1)
    )
  )

  (:action meet_friend_in_reykjavik_1_2
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at reykjavik)
      (friend_window ?d)
      (not (met_friend))
      (reykjavik_count_1)
      (not (reykjavik_count_5))
    )
    :effect (and
      (met_friend)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (reykjavik_count_1))
      (reykjavik_count_2)
    )
  )

  (:action meet_friend_in_reykjavik_2_3
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at reykjavik)
      (friend_window ?d)
      (not (met_friend))
      (reykjavik_count_2)
      (not (reykjavik_count_5))
    )
    :effect (and
      (met_friend)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (reykjavik_count_2))
      (reykjavik_count_3)
    )
  )

  (:action meet_friend_in_reykjavik_3_4
    :parameters (?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at reykjavik)
      (friend_window ?d)
      (not (met_friend))
      (reykjavik_count_3)
      (not (reykjavik_count_5))
    )
    :effect (and
      (met_friend)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (reykjavik_count_3))
      (reykjavik_count_4)
    )
  )

  (:action fly_porto_to_berlin
    :parameters ()
    :precondition (and
      (at porto)
      (direct porto berlin)
    )
    :effect (and
      (not (at porto))
      (at berlin)
    )
  )

  (:action fly_berlin_to_porto
    :parameters ()
    :precondition (and
      (at berlin)
      (direct berlin porto)
    )
    :effect (and
      (not (at berlin))
      (at porto)
    )
  )

  (:action fly_berlin_to_reykjavik
    :parameters ()
    :precondition (and
      (at berlin)
      (direct berlin reykjavik)
    )
    :effect (and
      (not (at berlin))
      (at reykjavik)
    )
  )

  (:action fly_reykjavik_to_berlin
    :parameters ()
    :precondition (and
      (at reykjavik)
      (direct reykjavik berlin)
    )
    :effect (and
      (not (at reykjavik))
      (at berlin)
    )
  )

  (:action finish_in_porto
    :parameters ()
    :precondition (and
      (current_day d16)
      (at porto)
      (porto_count_6)
      (berlin_count_6)
      (reykjavik_count_5)
      (met_friend)
    )
    :effect (and
      (not (current_day d16))
      (not (porto_count_6))
      (porto_count_7)
      (trip_finished)
    )
  )
)