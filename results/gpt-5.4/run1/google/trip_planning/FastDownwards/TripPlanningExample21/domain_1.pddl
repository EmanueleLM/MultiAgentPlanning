(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (direct_flight ?from - city ?to - city)

    (mykonos_count_0)
    (mykonos_count_1)
    (mykonos_count_2)

    (vienna_count_0)
    (vienna_count_1)
    (vienna_count_2)
    (vienna_count_3)
    (vienna_count_4)

    (venice_count_0)
    (venice_count_1)
    (venice_count_2)
    (venice_count_3)
    (venice_count_4)
    (venice_count_5)
    (venice_count_6)

    (workshop_attended)
  )

  (:action stay_in_mykonos_from_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at mykonos)
      (mykonos_count_0))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (mykonos_count_0))
      (mykonos_count_1))
  )

  (:action stay_in_mykonos_from_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at mykonos)
      (mykonos_count_1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (mykonos_count_1))
      (mykonos_count_2))
  )

  (:action stay_in_vienna_from_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at vienna)
      (vienna_count_0))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (vienna_count_0))
      (vienna_count_1))
  )

  (:action stay_in_vienna_from_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at vienna)
      (vienna_count_1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (vienna_count_1))
      (vienna_count_2))
  )

  (:action stay_in_vienna_from_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at vienna)
      (vienna_count_2))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (vienna_count_2))
      (vienna_count_3))
  )

  (:action stay_in_vienna_from_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at vienna)
      (vienna_count_3))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (vienna_count_3))
      (vienna_count_4))
  )

  (:action stay_in_venice_before_workshop_from_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at venice)
      (venice_count_0)
      (negative_pre_venice_workshop ?d1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (venice_count_0))
      (venice_count_1))
  )

  (:action stay_in_venice_before_workshop_from_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at venice)
      (venice_count_1)
      (negative_pre_venice_workshop ?d1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (venice_count_1))
      (venice_count_2))
  )

  (:action stay_in_venice_before_workshop_from_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at venice)
      (venice_count_2)
      (negative_pre_venice_workshop ?d1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (venice_count_2))
      (venice_count_3))
  )

  (:action stay_in_venice_before_workshop_from_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at venice)
      (venice_count_3)
      (negative_pre_venice_workshop ?d1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (venice_count_3))
      (venice_count_4))
  )

  (:action stay_in_venice_before_workshop_from_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at venice)
      (venice_count_4)
      (negative_pre_venice_workshop ?d1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (venice_count_4))
      (venice_count_5))
  )

  (:action stay_in_venice_before_workshop_from_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at venice)
      (venice_count_5)
      (negative_pre_venice_workshop ?d1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (venice_count_5))
      (venice_count_6))
  )

  (:action stay_in_venice_workshop_from_0
    :parameters (?d2 - day)
    :precondition (and
      (current_day d4)
      (next_day d4 ?d2)
      (at venice)
      (venice_count_0))
    :effect (and
      (not (current_day d4))
      (current_day ?d2)
      (not (venice_count_0))
      (venice_count_1)
      (workshop_attended))
  )

  (:action stay_in_venice_workshop_from_1
    :parameters (?d2 - day)
    :precondition (and
      (current_day d4)
      (next_day d4 ?d2)
      (at venice)
      (venice_count_1))
    :effect (and
      (not (current_day d4))
      (current_day ?d2)
      (not (venice_count_1))
      (venice_count_2)
      (workshop_attended))
  )

  (:action stay_in_venice_workshop_from_2
    :parameters (?d2 - day)
    :precondition (and
      (current_day d4)
      (next_day d4 ?d2)
      (at venice)
      (venice_count_2))
    :effect (and
      (not (current_day d4))
      (current_day ?d2)
      (not (venice_count_2))
      (venice_count_3)
      (workshop_attended))
  )

  (:action stay_in_venice_workshop_from_3
    :parameters (?d2 - day)
    :precondition (and
      (current_day d4)
      (next_day d4 ?d2)
      (at venice)
      (venice_count_3))
    :effect (and
      (not (current_day d4))
      (current_day ?d2)
      (not (venice_count_3))
      (venice_count_4)
      (workshop_attended))
  )

  (:action stay_in_venice_workshop_from_4
    :parameters (?d2 - day)
    :precondition (and
      (current_day d4)
      (next_day d4 ?d2)
      (at venice)
      (venice_count_4))
    :effect (and
      (not (current_day d4))
      (current_day ?d2)
      (not (venice_count_4))
      (venice_count_5)
      (workshop_attended))
  )

  (:action stay_in_venice_workshop_from_5
    :parameters (?d2 - day)
    :precondition (and
      (current_day d4)
      (next_day d4 ?d2)
      (at venice)
      (venice_count_5))
    :effect (and
      (not (current_day d4))
      (current_day ?d2)
      (not (venice_count_5))
      (venice_count_6)
      (workshop_attended))
  )

  (:action stay_in_venice_after_workshop_from_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at venice)
      (venice_count_0)
      (not (before_workshop_day ?d1)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (venice_count_0))
      (venice_count_1)
      (workshop_attended))
  )

  (:action stay_in_venice_after_workshop_from_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at venice)
      (venice_count_1)
      (not (before_workshop_day ?d1)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (venice_count_1))
      (venice_count_2)
      (workshop_attended))
  )

  (:action stay_in_venice_after_workshop_from_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at venice)
      (venice_count_2)
      (not (before_workshop_day ?d1)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (venice_count_2))
      (venice_count_3)
      (workshop_attended))
  )

  (:action stay_in_venice_after_workshop_from_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at venice)
      (venice_count_3)
      (not (before_workshop_day ?d1)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (venice_count_3))
      (venice_count_4)
      (workshop_attended))
  )

  (:action stay_in_venice_after_workshop_from_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at venice)
      (venice_count_4)
      (not (before_workshop_day ?d1)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (venice_count_4))
      (venice_count_5)
      (workshop_attended))
  )

  (:action stay_in_venice_after_workshop_from_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at venice)
      (venice_count_5)
      (not (before_workshop_day ?d1)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (venice_count_5))
      (venice_count_6)
      (workshop_attended))
  )

  (:action fly_mykonos_to_vienna_from_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at mykonos)
      (direct_flight mykonos vienna)
      (vienna_count_0))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at mykonos))
      (at vienna)
      (not (vienna_count_0))
      (vienna_count_1))
  )

  (:action fly_mykonos_to_vienna_from_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at mykonos)
      (direct_flight mykonos vienna)
      (vienna_count_1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at mykonos))
      (at vienna)
      (not (vienna_count_1))
      (vienna_count_2))
  )

  (:action fly_mykonos_to_vienna_from_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at mykonos)
      (direct_flight mykonos vienna)
      (vienna_count_2))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at mykonos))
      (at vienna)
      (not (vienna_count_2))
      (vienna_count_3))
  )

  (:action fly_mykonos_to_vienna_from_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at mykonos)
      (direct_flight mykonos vienna)
      (vienna_count_3))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at mykonos))
      (at vienna)
      (not (vienna_count_3))
      (vienna_count_4))
  )

  (:action fly_vienna_to_mykonos_from_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at vienna)
      (direct_flight vienna mykonos)
      (mykonos_count_0))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at vienna))
      (at mykonos)
      (not (mykonos_count_0))
      (mykonos_count_1))
  )

  (:action fly_vienna_to_mykonos_from_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at vienna)
      (direct_flight vienna mykonos)
      (mykonos_count_1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at vienna))
      (at mykonos)
      (not (mykonos_count_1))
      (mykonos_count_2))
  )

  (:action fly_vienna_to_venice_from_0_before_workshop
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_0)
      (negative_pre_venice_workshop ?d1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at vienna))
      (at venice)
      (not (venice_count_0))
      (venice_count_1))
  )

  (:action fly_vienna_to_venice_from_1_before_workshop
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_1)
      (negative_pre_venice_workshop ?d1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at vienna))
      (at venice)
      (not (venice_count_1))
      (venice_count_2))
  )

  (:action fly_vienna_to_venice_from_2_before_workshop
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_2)
      (negative_pre_venice_workshop ?d1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at vienna))
      (at venice)
      (not (venice_count_2))
      (venice_count_3))
  )

  (:action fly_vienna_to_venice_from_3_before_workshop
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_3)
      (negative_pre_venice_workshop ?d1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at vienna))
      (at venice)
      (not (venice_count_3))
      (venice_count_4))
  )

  (:action fly_vienna_to_venice_from_4_before_workshop
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_4)
      (negative_pre_venice_workshop ?d1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at vienna))
      (at venice)
      (not (venice_count_4))
      (venice_count_5))
  )

  (:action fly_vienna_to_venice_from_5_before_workshop
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_5)
      (negative_pre_venice_workshop ?d1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at vienna))
      (at venice)
      (not (venice_count_5))
      (venice_count_6))
  )

  (:action fly_vienna_to_venice_on_workshop_day_from_0
    :parameters (?d2 - day)
    :precondition (and
      (current_day d4)
      (next_day d4 ?d2)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_0))
    :effect (and
      (not (current_day d4))
      (current_day ?d2)
      (not (at vienna))
      (at venice)
      (not (venice_count_0))
      (venice_count_1)
      (workshop_attended))
  )

  (:action fly_vienna_to_venice_on_workshop_day_from_1
    :parameters (?d2 - day)
    :precondition (and
      (current_day d4)
      (next_day d4 ?d2)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_1))
    :effect (and
      (not (current_day d4))
      (current_day ?d2)
      (not (at vienna))
      (at venice)
      (not (venice_count_1))
      (venice_count_2)
      (workshop_attended))
  )

  (:action fly_vienna_to_venice_on_workshop_day_from_2
    :parameters (?d2 - day)
    :precondition (and
      (current_day d4)
      (next_day d4 ?d2)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_2))
    :effect (and
      (not (current_day d4))
      (current_day ?d2)
      (not (at vienna))
      (at venice)
      (not (venice_count_2))
      (venice_count_3)
      (workshop_attended))
  )

  (:action fly_vienna_to_venice_on_workshop_day_from_3
    :parameters (?d2 - day)
    :precondition (and
      (current_day d4)
      (next_day d4 ?d2)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_3))
    :effect (and
      (not (current_day d4))
      (current_day ?d2)
      (not (at vienna))
      (at venice)
      (not (venice_count_3))
      (venice_count_4)
      (workshop_attended))
  )

  (:action fly_vienna_to_venice_on_workshop_day_from_4
    :parameters (?d2 - day)
    :precondition (and
      (current_day d4)
      (next_day d4 ?d2)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_4))
    :effect (and
      (not (current_day d4))
      (current_day ?d2)
      (not (at vienna))
      (at venice)
      (not (venice_count_4))
      (venice_count_5)
      (workshop_attended))
  )

  (:action fly_vienna_to_venice_on_workshop_day_from_5
    :parameters (?d2 - day)
    :precondition (and
      (current_day d4)
      (next_day d4 ?d2)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_5))
    :effect (and
      (not (current_day d4))
      (current_day ?d2)
      (not (at vienna))
      (at venice)
      (not (venice_count_5))
      (venice_count_6)
      (workshop_attended))
  )

  (:action fly_vienna_to_venice_after_workshop_from_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_0)
      (not (before_workshop_day ?d1)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at vienna))
      (at venice)
      (not (venice_count_0))
      (venice_count_1)
      (workshop_attended))
  )

  (:action fly_vienna_to_venice_after_workshop_from_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_1)
      (not (before_workshop_day ?d1)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at vienna))
      (at venice)
      (not (venice_count_1))
      (venice_count_2)
      (workshop_attended))
  )

  (:action fly_vienna_to_venice_after_workshop_from_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_2)
      (not (before_workshop_day ?d1)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at vienna))
      (at venice)
      (not (venice_count_2))
      (venice_count_3)
      (workshop_attended))
  )

  (:action fly_vienna_to_venice_after_workshop_from_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_3)
      (not (before_workshop_day ?d1)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at vienna))
      (at venice)
      (not (venice_count_3))
      (venice_count_4)
      (workshop_attended))
  )

  (:action fly_vienna_to_venice_after_workshop_from_4
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_4)
      (not (before_workshop_day ?d1)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at vienna))
      (at venice)
      (not (venice_count_4))
      (venice_count_5)
      (workshop_attended))
  )

  (:action fly_vienna_to_venice_after_workshop_from_5
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_5)
      (not (before_workshop_day ?d1)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at vienna))
      (at venice)
      (not (venice_count_5))
      (venice_count_6)
      (workshop_attended))
  )

  (:action fly_venice_to_vienna_from_0
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at venice)
      (direct_flight venice vienna)
      (vienna_count_0))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at venice))
      (at vienna)
      (not (vienna_count_0))
      (vienna_count_1))
  )

  (:action fly_venice_to_vienna_from_1
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at venice)
      (direct_flight venice vienna)
      (vienna_count_1))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at venice))
      (at vienna)
      (not (vienna_count_1))
      (vienna_count_2))
  )

  (:action fly_venice_to_vienna_from_2
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at venice)
      (direct_flight venice vienna)
      (vienna_count_2))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at venice))
      (at vienna)
      (not (vienna_count_2))
      (vienna_count_3))
  )

  (:action fly_venice_to_vienna_from_3
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at venice)
      (direct_flight venice vienna)
      (vienna_count_3))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at venice))
      (at vienna)
      (not (vienna_count_3))
      (vienna_count_4))
  )
)