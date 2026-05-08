(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (direct_flight ?from - city ?to - city)

    (occupied_mykonos_s1)
    (occupied_mykonos_s2)
    (occupied_mykonos_s3)
    (occupied_mykonos_s4)
    (occupied_mykonos_s5)
    (occupied_mykonos_s6)
    (occupied_mykonos_s7)
    (occupied_mykonos_s8)
    (occupied_mykonos_s9)
    (occupied_mykonos_s10)

    (occupied_vienna_s1)
    (occupied_vienna_s2)
    (occupied_vienna_s3)
    (occupied_vienna_s4)
    (occupied_vienna_s5)
    (occupied_vienna_s6)
    (occupied_vienna_s7)
    (occupied_vienna_s8)
    (occupied_vienna_s9)
    (occupied_vienna_s10)

    (occupied_venice_s1)
    (occupied_venice_s2)
    (occupied_venice_s3)
    (occupied_venice_s4)
    (occupied_venice_s5)
    (occupied_venice_s6)
    (occupied_venice_s7)
    (occupied_venice_s8)
    (occupied_venice_s9)
    (occupied_venice_s10)

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

  (:action stay_mykonos_s1_from_0
    :parameters ()
    :precondition (and
      (current_day d0)
      (next_day d0 d1)
      (at mykonos)
      (mykonos_count_0))
    :effect (and
      (not (current_day d0))
      (current_day d1)
      (not (mykonos_count_0))
      (mykonos_count_1)
      (occupied_mykonos_s1))
  )

  (:action stay_mykonos_s2_from_0
    :parameters ()
    :precondition (and
      (current_day d1)
      (next_day d1 d2)
      (at mykonos)
      (mykonos_count_0))
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (not (mykonos_count_0))
      (mykonos_count_1)
      (occupied_mykonos_s2))
  )

  (:action stay_mykonos_s2_from_1
    :parameters ()
    :precondition (and
      (current_day d1)
      (next_day d1 d2)
      (at mykonos)
      (mykonos_count_1))
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (not (mykonos_count_1))
      (mykonos_count_2)
      (occupied_mykonos_s2))
  )

  (:action stay_mykonos_s3_from_0
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d2 d3)
      (at mykonos)
      (mykonos_count_0))
    :effect (and
      (not (current_day d2))
      (current_day d3)
      (not (mykonos_count_0))
      (mykonos_count_1)
      (occupied_mykonos_s3))
  )

  (:action stay_mykonos_s3_from_1
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d2 d3)
      (at mykonos)
      (mykonos_count_1))
    :effect (and
      (not (current_day d2))
      (current_day d3)
      (not (mykonos_count_1))
      (mykonos_count_2)
      (occupied_mykonos_s3))
  )

  (:action stay_mykonos_s4_from_0
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d3 d4)
      (at mykonos)
      (mykonos_count_0))
    :effect (and
      (not (current_day d3))
      (current_day d4)
      (not (mykonos_count_0))
      (mykonos_count_1)
      (occupied_mykonos_s4))
  )

  (:action stay_mykonos_s4_from_1
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d3 d4)
      (at mykonos)
      (mykonos_count_1))
    :effect (and
      (not (current_day d3))
      (current_day d4)
      (not (mykonos_count_1))
      (mykonos_count_2)
      (occupied_mykonos_s4))
  )

  (:action stay_mykonos_s5_from_0
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d4 d5)
      (at mykonos)
      (mykonos_count_0))
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (not (mykonos_count_0))
      (mykonos_count_1)
      (occupied_mykonos_s5))
  )

  (:action stay_mykonos_s5_from_1
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d4 d5)
      (at mykonos)
      (mykonos_count_1))
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (not (mykonos_count_1))
      (mykonos_count_2)
      (occupied_mykonos_s5))
  )

  (:action stay_mykonos_s6_from_0
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d5 d6)
      (at mykonos)
      (mykonos_count_0))
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (not (mykonos_count_0))
      (mykonos_count_1)
      (occupied_mykonos_s6))
  )

  (:action stay_mykonos_s6_from_1
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d5 d6)
      (at mykonos)
      (mykonos_count_1))
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (not (mykonos_count_1))
      (mykonos_count_2)
      (occupied_mykonos_s6))
  )

  (:action stay_mykonos_s7_from_0
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d6 d7)
      (at mykonos)
      (mykonos_count_0))
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (not (mykonos_count_0))
      (mykonos_count_1)
      (occupied_mykonos_s7))
  )

  (:action stay_mykonos_s7_from_1
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d6 d7)
      (at mykonos)
      (mykonos_count_1))
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (not (mykonos_count_1))
      (mykonos_count_2)
      (occupied_mykonos_s7))
  )

  (:action stay_mykonos_s8_from_0
    :parameters ()
    :precondition (and
      (current_day d7)
      (next_day d7 d8)
      (at mykonos)
      (mykonos_count_0))
    :effect (and
      (not (current_day d7))
      (current_day d8)
      (not (mykonos_count_0))
      (mykonos_count_1)
      (occupied_mykonos_s8))
  )

  (:action stay_mykonos_s8_from_1
    :parameters ()
    :precondition (and
      (current_day d7)
      (next_day d7 d8)
      (at mykonos)
      (mykonos_count_1))
    :effect (and
      (not (current_day d7))
      (current_day d8)
      (not (mykonos_count_1))
      (mykonos_count_2)
      (occupied_mykonos_s8))
  )

  (:action stay_mykonos_s9_from_0
    :parameters ()
    :precondition (and
      (current_day d8)
      (next_day d8 d9)
      (at mykonos)
      (mykonos_count_0))
    :effect (and
      (not (current_day d8))
      (current_day d9)
      (not (mykonos_count_0))
      (mykonos_count_1)
      (occupied_mykonos_s9))
  )

  (:action stay_mykonos_s9_from_1
    :parameters ()
    :precondition (and
      (current_day d8)
      (next_day d8 d9)
      (at mykonos)
      (mykonos_count_1))
    :effect (and
      (not (current_day d8))
      (current_day d9)
      (not (mykonos_count_1))
      (mykonos_count_2)
      (occupied_mykonos_s9))
  )

  (:action stay_mykonos_s10_from_0
    :parameters ()
    :precondition (and
      (current_day d9)
      (next_day d9 d10)
      (at mykonos)
      (mykonos_count_0))
    :effect (and
      (not (current_day d9))
      (current_day d10)
      (not (mykonos_count_0))
      (mykonos_count_1)
      (occupied_mykonos_s10))
  )

  (:action stay_mykonos_s10_from_1
    :parameters ()
    :precondition (and
      (current_day d9)
      (next_day d9 d10)
      (at mykonos)
      (mykonos_count_1))
    :effect (and
      (not (current_day d9))
      (current_day d10)
      (not (mykonos_count_1))
      (mykonos_count_2)
      (occupied_mykonos_s10))
  )

  (:action stay_vienna_s1_from_0
    :parameters ()
    :precondition (and
      (current_day d0)
      (next_day d0 d1)
      (at vienna)
      (vienna_count_0))
    :effect (and
      (not (current_day d0))
      (current_day d1)
      (not (vienna_count_0))
      (vienna_count_1)
      (occupied_vienna_s1))
  )

  (:action stay_vienna_s2_from_0
    :parameters ()
    :precondition (and
      (current_day d1)
      (next_day d1 d2)
      (at vienna)
      (vienna_count_0))
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (not (vienna_count_0))
      (vienna_count_1)
      (occupied_vienna_s2))
  )

  (:action stay_vienna_s2_from_1
    :parameters ()
    :precondition (and
      (current_day d1)
      (next_day d1 d2)
      (at vienna)
      (vienna_count_1))
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (not (vienna_count_1))
      (vienna_count_2)
      (occupied_vienna_s2))
  )

  (:action stay_vienna_s3_from_0
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d2 d3)
      (at vienna)
      (vienna_count_0))
    :effect (and
      (not (current_day d2))
      (current_day d3)
      (not (vienna_count_0))
      (vienna_count_1)
      (occupied_vienna_s3))
  )

  (:action stay_vienna_s3_from_1
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d2 d3)
      (at vienna)
      (vienna_count_1))
    :effect (and
      (not (current_day d2))
      (current_day d3)
      (not (vienna_count_1))
      (vienna_count_2)
      (occupied_vienna_s3))
  )

  (:action stay_vienna_s3_from_2
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d2 d3)
      (at vienna)
      (vienna_count_2))
    :effect (and
      (not (current_day d2))
      (current_day d3)
      (not (vienna_count_2))
      (vienna_count_3)
      (occupied_vienna_s3))
  )

  (:action stay_vienna_s4_from_0
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d3 d4)
      (at vienna)
      (vienna_count_0))
    :effect (and
      (not (current_day d3))
      (current_day d4)
      (not (vienna_count_0))
      (vienna_count_1)
      (occupied_vienna_s4))
  )

  (:action stay_vienna_s4_from_1
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d3 d4)
      (at vienna)
      (vienna_count_1))
    :effect (and
      (not (current_day d3))
      (current_day d4)
      (not (vienna_count_1))
      (vienna_count_2)
      (occupied_vienna_s4))
  )

  (:action stay_vienna_s4_from_2
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d3 d4)
      (at vienna)
      (vienna_count_2))
    :effect (and
      (not (current_day d3))
      (current_day d4)
      (not (vienna_count_2))
      (vienna_count_3)
      (occupied_vienna_s4))
  )

  (:action stay_vienna_s4_from_3
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d3 d4)
      (at vienna)
      (vienna_count_3))
    :effect (and
      (not (current_day d3))
      (current_day d4)
      (not (vienna_count_3))
      (vienna_count_4)
      (occupied_vienna_s4))
  )

  (:action stay_vienna_s5_from_0
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d4 d5)
      (at vienna)
      (vienna_count_0))
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (not (vienna_count_0))
      (vienna_count_1)
      (occupied_vienna_s5))
  )

  (:action stay_vienna_s5_from_1
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d4 d5)
      (at vienna)
      (vienna_count_1))
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (not (vienna_count_1))
      (vienna_count_2)
      (occupied_vienna_s5))
  )

  (:action stay_vienna_s5_from_2
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d4 d5)
      (at vienna)
      (vienna_count_2))
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (not (vienna_count_2))
      (vienna_count_3)
      (occupied_vienna_s5))
  )

  (:action stay_vienna_s5_from_3
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d4 d5)
      (at vienna)
      (vienna_count_3))
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (not (vienna_count_3))
      (vienna_count_4)
      (occupied_vienna_s5))
  )

  (:action stay_vienna_s6_from_0
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d5 d6)
      (at vienna)
      (vienna_count_0))
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (not (vienna_count_0))
      (vienna_count_1)
      (occupied_vienna_s6))
  )

  (:action stay_vienna_s6_from_1
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d5 d6)
      (at vienna)
      (vienna_count_1))
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (not (vienna_count_1))
      (vienna_count_2)
      (occupied_vienna_s6))
  )

  (:action stay_vienna_s6_from_2
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d5 d6)
      (at vienna)
      (vienna_count_2))
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (not (vienna_count_2))
      (vienna_count_3)
      (occupied_vienna_s6))
  )

  (:action stay_vienna_s6_from_3
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d5 d6)
      (at vienna)
      (vienna_count_3))
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (not (vienna_count_3))
      (vienna_count_4)
      (occupied_vienna_s6))
  )

  (:action stay_vienna_s7_from_0
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d6 d7)
      (at vienna)
      (vienna_count_0))
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (not (vienna_count_0))
      (vienna_count_1)
      (occupied_vienna_s7))
  )

  (:action stay_vienna_s7_from_1
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d6 d7)
      (at vienna)
      (vienna_count_1))
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (not (vienna_count_1))
      (vienna_count_2)
      (occupied_vienna_s7))
  )

  (:action stay_vienna_s7_from_2
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d6 d7)
      (at vienna)
      (vienna_count_2))
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (not (vienna_count_2))
      (vienna_count_3)
      (occupied_vienna_s7))
  )

  (:action stay_vienna_s7_from_3
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d6 d7)
      (at vienna)
      (vienna_count_3))
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (not (vienna_count_3))
      (vienna_count_4)
      (occupied_vienna_s7))
  )

  (:action stay_vienna_s8_from_0
    :parameters ()
    :precondition (and
      (current_day d7)
      (next_day d7 d8)
      (at vienna)
      (vienna_count_0))
    :effect (and
      (not (current_day d7))
      (current_day d8)
      (not (vienna_count_0))
      (vienna_count_1)
      (occupied_vienna_s8))
  )

  (:action stay_vienna_s8_from_1
    :parameters ()
    :precondition (and
      (current_day d7)
      (next_day d7 d8)
      (at vienna)
      (vienna_count_1))
    :effect (and
      (not (current_day d7))
      (current_day d8)
      (not (vienna_count_1))
      (vienna_count_2)
      (occupied_vienna_s8))
  )

  (:action stay_vienna_s8_from_2
    :parameters ()
    :precondition (and
      (current_day d7)
      (next_day d7 d8)
      (at vienna)
      (vienna_count_2))
    :effect (and
      (not (current_day d7))
      (current_day d8)
      (not (vienna_count_2))
      (vienna_count_3)
      (occupied_vienna_s8))
  )

  (:action stay_vienna_s8_from_3
    :parameters ()
    :precondition (and
      (current_day d7)
      (next_day d7 d8)
      (at vienna)
      (vienna_count_3))
    :effect (and
      (not (current_day d7))
      (current_day d8)
      (not (vienna_count_3))
      (vienna_count_4)
      (occupied_vienna_s8))
  )

  (:action stay_vienna_s9_from_0
    :parameters ()
    :precondition (and
      (current_day d8)
      (next_day d8 d9)
      (at vienna)
      (vienna_count_0))
    :effect (and
      (not (current_day d8))
      (current_day d9)
      (not (vienna_count_0))
      (vienna_count_1)
      (occupied_vienna_s9))
  )

  (:action stay_vienna_s9_from_1
    :parameters ()
    :precondition (and
      (current_day d8)
      (next_day d8 d9)
      (at vienna)
      (vienna_count_1))
    :effect (and
      (not (current_day d8))
      (current_day d9)
      (not (vienna_count_1))
      (vienna_count_2)
      (occupied_vienna_s9))
  )

  (:action stay_vienna_s9_from_2
    :parameters ()
    :precondition (and
      (current_day d8)
      (next_day d8 d9)
      (at vienna)
      (vienna_count_2))
    :effect (and
      (not (current_day d8))
      (current_day d9)
      (not (vienna_count_2))
      (vienna_count_3)
      (occupied_vienna_s9))
  )

  (:action stay_vienna_s9_from_3
    :parameters ()
    :precondition (and
      (current_day d8)
      (next_day d8 d9)
      (at vienna)
      (vienna_count_3))
    :effect (and
      (not (current_day d8))
      (current_day d9)
      (not (vienna_count_3))
      (vienna_count_4)
      (occupied_vienna_s9))
  )

  (:action stay_vienna_s10_from_0
    :parameters ()
    :precondition (and
      (current_day d9)
      (next_day d9 d10)
      (at vienna)
      (vienna_count_0))
    :effect (and
      (not (current_day d9))
      (current_day d10)
      (not (vienna_count_0))
      (vienna_count_1)
      (occupied_vienna_s10))
  )

  (:action stay_vienna_s10_from_1
    :parameters ()
    :precondition (and
      (current_day d9)
      (next_day d9 d10)
      (at vienna)
      (vienna_count_1))
    :effect (and
      (not (current_day d9))
      (current_day d10)
      (not (vienna_count_1))
      (vienna_count_2)
      (occupied_vienna_s10))
  )

  (:action stay_vienna_s10_from_2
    :parameters ()
    :precondition (and
      (current_day d9)
      (next_day d9 d10)
      (at vienna)
      (vienna_count_2))
    :effect (and
      (not (current_day d9))
      (current_day d10)
      (not (vienna_count_2))
      (vienna_count_3)
      (occupied_vienna_s10))
  )

  (:action stay_vienna_s10_from_3
    :parameters ()
    :precondition (and
      (current_day d9)
      (next_day d9 d10)
      (at vienna)
      (vienna_count_3))
    :effect (and
      (not (current_day d9))
      (current_day d10)
      (not (vienna_count_3))
      (vienna_count_4)
      (occupied_vienna_s10))
  )

  (:action stay_venice_s1_from_0
    :parameters ()
    :precondition (and
      (current_day d0)
      (next_day d0 d1)
      (at venice)
      (venice_count_0))
    :effect (and
      (not (current_day d0))
      (current_day d1)
      (not (venice_count_0))
      (venice_count_1)
      (occupied_venice_s1))
  )

  (:action stay_venice_s2_from_0
    :parameters ()
    :precondition (and
      (current_day d1)
      (next_day d1 d2)
      (at venice)
      (venice_count_0))
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (not (venice_count_0))
      (venice_count_1)
      (occupied_venice_s2))
  )

  (:action stay_venice_s2_from_1
    :parameters ()
    :precondition (and
      (current_day d1)
      (next_day d1 d2)
      (at venice)
      (venice_count_1))
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (not (venice_count_1))
      (venice_count_2)
      (occupied_venice_s2))
  )

  (:action stay_venice_s3_from_0
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d2 d3)
      (at venice)
      (venice_count_0))
    :effect (and
      (not (current_day d2))
      (current_day d3)
      (not (venice_count_0))
      (venice_count_1)
      (occupied_venice_s3))
  )

  (:action stay_venice_s3_from_1
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d2 d3)
      (at venice)
      (venice_count_1))
    :effect (and
      (not (current_day d2))
      (current_day d3)
      (not (venice_count_1))
      (venice_count_2)
      (occupied_venice_s3))
  )

  (:action stay_venice_s3_from_2
    :parameters ()
    :precondition (and
      (current_day d2)
      (next_day d2 d3)
      (at venice)
      (venice_count_2))
    :effect (and
      (not (current_day d2))
      (current_day d3)
      (not (venice_count_2))
      (venice_count_3)
      (occupied_venice_s3))
  )

  (:action stay_venice_s4_from_0
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d3 d4)
      (at venice)
      (venice_count_0))
    :effect (and
      (not (current_day d3))
      (current_day d4)
      (not (venice_count_0))
      (venice_count_1)
      (occupied_venice_s4))
  )

  (:action stay_venice_s4_from_1
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d3 d4)
      (at venice)
      (venice_count_1))
    :effect (and
      (not (current_day d3))
      (current_day d4)
      (not (venice_count_1))
      (venice_count_2)
      (occupied_venice_s4))
  )

  (:action stay_venice_s4_from_2
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d3 d4)
      (at venice)
      (venice_count_2))
    :effect (and
      (not (current_day d3))
      (current_day d4)
      (not (venice_count_2))
      (venice_count_3)
      (occupied_venice_s4))
  )

  (:action stay_venice_s4_from_3
    :parameters ()
    :precondition (and
      (current_day d3)
      (next_day d3 d4)
      (at venice)
      (venice_count_3))
    :effect (and
      (not (current_day d3))
      (current_day d4)
      (not (venice_count_3))
      (venice_count_4)
      (occupied_venice_s4))
  )

  (:action stay_venice_s5_from_0
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d4 d5)
      (at venice)
      (venice_count_0))
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (not (venice_count_0))
      (venice_count_1)
      (occupied_venice_s5)
      (workshop_attended))
  )

  (:action stay_venice_s5_from_1
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d4 d5)
      (at venice)
      (venice_count_1))
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (not (venice_count_1))
      (venice_count_2)
      (occupied_venice_s5)
      (workshop_attended))
  )

  (:action stay_venice_s5_from_2
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d4 d5)
      (at venice)
      (venice_count_2))
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (not (venice_count_2))
      (venice_count_3)
      (occupied_venice_s5)
      (workshop_attended))
  )

  (:action stay_venice_s5_from_3
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d4 d5)
      (at venice)
      (venice_count_3))
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (not (venice_count_3))
      (venice_count_4)
      (occupied_venice_s5)
      (workshop_attended))
  )

  (:action stay_venice_s5_from_4
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d4 d5)
      (at venice)
      (venice_count_4))
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (not (venice_count_4))
      (venice_count_5)
      (occupied_venice_s5)
      (workshop_attended))
  )

  (:action stay_venice_s5_from_5
    :parameters ()
    :precondition (and
      (current_day d4)
      (next_day d4 d5)
      (at venice)
      (venice_count_5))
    :effect (and
      (not (current_day d4))
      (current_day d5)
      (not (venice_count_5))
      (venice_count_6)
      (occupied_venice_s5)
      (workshop_attended))
  )

  (:action stay_venice_s6_from_0
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d5 d6)
      (at venice)
      (venice_count_0))
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (not (venice_count_0))
      (venice_count_1)
      (occupied_venice_s6)
      (workshop_attended))
  )

  (:action stay_venice_s6_from_1
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d5 d6)
      (at venice)
      (venice_count_1))
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (not (venice_count_1))
      (venice_count_2)
      (occupied_venice_s6)
      (workshop_attended))
  )

  (:action stay_venice_s6_from_2
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d5 d6)
      (at venice)
      (venice_count_2))
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (not (venice_count_2))
      (venice_count_3)
      (occupied_venice_s6)
      (workshop_attended))
  )

  (:action stay_venice_s6_from_3
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d5 d6)
      (at venice)
      (venice_count_3))
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (not (venice_count_3))
      (venice_count_4)
      (occupied_venice_s6)
      (workshop_attended))
  )

  (:action stay_venice_s6_from_4
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d5 d6)
      (at venice)
      (venice_count_4))
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (not (venice_count_4))
      (venice_count_5)
      (occupied_venice_s6)
      (workshop_attended))
  )

  (:action stay_venice_s6_from_5
    :parameters ()
    :precondition (and
      (current_day d5)
      (next_day d5 d6)
      (at venice)
      (venice_count_5))
    :effect (and
      (not (current_day d5))
      (current_day d6)
      (not (venice_count_5))
      (venice_count_6)
      (occupied_venice_s6)
      (workshop_attended))
  )

  (:action stay_venice_s7_from_0
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d6 d7)
      (at venice)
      (venice_count_0))
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (not (venice_count_0))
      (venice_count_1)
      (occupied_venice_s7)
      (workshop_attended))
  )

  (:action stay_venice_s7_from_1
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d6 d7)
      (at venice)
      (venice_count_1))
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (not (venice_count_1))
      (venice_count_2)
      (occupied_venice_s7)
      (workshop_attended))
  )

  (:action stay_venice_s7_from_2
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d6 d7)
      (at venice)
      (venice_count_2))
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (not (venice_count_2))
      (venice_count_3)
      (occupied_venice_s7)
      (workshop_attended))
  )

  (:action stay_venice_s7_from_3
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d6 d7)
      (at venice)
      (venice_count_3))
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (not (venice_count_3))
      (venice_count_4)
      (occupied_venice_s7)
      (workshop_attended))
  )

  (:action stay_venice_s7_from_4
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d6 d7)
      (at venice)
      (venice_count_4))
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (not (venice_count_4))
      (venice_count_5)
      (occupied_venice_s7)
      (workshop_attended))
  )

  (:action stay_venice_s7_from_5
    :parameters ()
    :precondition (and
      (current_day d6)
      (next_day d6 d7)
      (at venice)
      (venice_count_5))
    :effect (and
      (not (current_day d6))
      (current_day d7)
      (not (venice_count_5))
      (venice_count_6)
      (occupied_venice_s7)
      (workshop_attended))
  )

  (:action stay_venice_s8_from_0
    :parameters ()
    :precondition (and
      (current_day d7)
      (next_day d7 d8)
      (at venice)
      (venice_count_0))
    :effect (and
      (not (current_day d7))
      (current_day d8)
      (not (venice_count_0))
      (venice_count_1)
      (occupied_venice_s8)
      (workshop_attended))
  )

  (:action stay_venice_s8_from_1
    :parameters ()
    :precondition (and
      (current_day d7)
      (next_day d7 d8)
      (at venice)
      (venice_count_1))
    :effect (and
      (not (current_day d7))
      (current_day d8)
      (not (venice_count_1))
      (venice_count_2)
      (occupied_venice_s8)
      (workshop_attended))
  )

  (:action stay_venice_s8_from_2
    :parameters ()
    :precondition (and
      (current_day d7)
      (next_day d7 d8)
      (at venice)
      (venice_count_2))
    :effect (and
      (not (current_day d7))
      (current_day d8)
      (not (venice_count_2))
      (venice_count_3)
      (occupied_venice_s8)
      (workshop_attended))
  )

  (:action stay_venice_s8_from_3
    :parameters ()
    :precondition (and
      (current_day d7)
      (next_day d7 d8)
      (at venice)
      (venice_count_3))
    :effect (and
      (not (current_day d7))
      (current_day d8)
      (not (venice_count_3))
      (venice_count_4)
      (occupied_venice_s8)
      (workshop_attended))
  )

  (:action stay_venice_s8_from_4
    :parameters ()
    :precondition (and
      (current_day d7)
      (next_day d7 d8)
      (at venice)
      (venice_count_4))
    :effect (and
      (not (current_day d7))
      (current_day d8)
      (not (venice_count_4))
      (venice_count_5)
      (occupied_venice_s8)
      (workshop_attended))
  )

  (:action stay_venice_s8_from_5
    :parameters ()
    :precondition (and
      (current_day d7)
      (next_day d7 d8)
      (at venice)
      (venice_count_5))
    :effect (and
      (not (current_day d7))
      (current_day d8)
      (not (venice_count_5))
      (venice_count_6)
      (occupied_venice_s8)
      (workshop_attended))
  )

  (:action stay_venice_s9_from_0
    :parameters ()
    :precondition (and
      (current_day d8)
      (next_day d8 d9)
      (at venice)
      (venice_count_0))
    :effect (and
      (not (current_day d8))
      (current_day d9)
      (not (venice_count_0))
      (venice_count_1)
      (occupied_venice_s9)
      (workshop_attended))
  )

  (:action stay_venice_s9_from_1
    :parameters ()
    :precondition (and
      (current_day d8)
      (next_day d8 d9)
      (at venice)
      (venice_count_1))
    :effect (and
      (not (current_day d8))
      (current_day d9)
      (not (venice_count_1))
      (venice_count_2)
      (occupied_venice_s9)
      (workshop_attended))
  )

  (:action stay_venice_s9_from_2
    :parameters ()
    :precondition (and
      (current_day d8)
      (next_day d8 d9)
      (at venice)
      (venice_count_2))
    :effect (and
      (not (current_day d8))
      (current_day d9)
      (not (venice_count_2))
      (venice_count_3)
      (occupied_venice_s9)
      (workshop_attended))
  )

  (:action stay_venice_s9_from_3
    :parameters ()
    :precondition (and
      (current_day d8)
      (next_day d8 d9)
      (at venice)
      (venice_count_3))
    :effect (and
      (not (current_day d8))
      (current_day d9)
      (not (venice_count_3))
      (venice_count_4)
      (occupied_venice_s9)
      (workshop_attended))
  )

  (:action stay_venice_s9_from_4
    :parameters ()
    :precondition (and
      (current_day d8)
      (next_day d8 d9)
      (at venice)
      (venice_count_4))
    :effect (and
      (not (current_day d8))
      (current_day d9)
      (not (venice_count_4))
      (venice_count_5)
      (occupied_venice_s9)
      (workshop_attended))
  )

  (:action stay_venice_s9_from_5
    :parameters ()
    :precondition (and
      (current_day d8)
      (next_day d8 d9)
      (at venice)
      (venice_count_5))
    :effect (and
      (not (current_day d8))
      (current_day d9)
      (not (venice_count_5))
      (venice_count_6)
      (occupied_venice_s9)
      (workshop_attended))
  )

  (:action stay_venice_s10_from_0
    :parameters ()
    :precondition (and
      (current_day d9)
      (next_day d9 d10)
      (at venice)
      (venice_count_0))
    :effect (and
      (not (current_day d9))
      (current_day d10)
      (not (venice_count_0))
      (venice_count_1)
      (occupied_venice_s10)
      (workshop_attended))
  )

  (:action stay_venice_s10_from_1
    :parameters ()
    :precondition (and
      (current_day d9)
      (next_day d9 d10)
      (at venice)
      (venice_count_1))
    :effect (and
      (not (current_day d9))
      (current_day d10)
      (not (venice_count_1))
      (venice_count_2)
      (occupied_venice_s10)
      (workshop_attended))
  )

  (:action stay_venice_s10_from_2
    :parameters ()
    :precondition (and
      (current_day d9)
      (next_day d9 d10)
      (at venice)
      (venice_count_2))
    :effect (and
      (not (current_day d9))
      (current_day d10)
      (not (venice_count_2))
      (venice_count_3)
      (occupied_venice_s10)
      (workshop_attended))
  )

  (:action stay_venice_s10_from_3
    :parameters ()
    :precondition (and
      (current_day d9)
      (next_day d9 d10)
      (at venice)
      (venice_count_3))
    :effect (and
      (not (current_day d9))
      (current_day d10)
      (not (venice_count_3))
      (venice_count_4)
      (occupied_venice_s10)
      (workshop_attended))
  )

  (:action stay_venice_s10_from_4
    :parameters ()
    :precondition (and
      (current_day d9)
      (next_day d9 d10)
      (at venice)
      (venice_count_4))
    :effect (and
      (not (current_day d9))
      (current_day d10)
      (not (venice_count_4))
      (venice_count_5)
      (occupied_venice_s10)
      (workshop_attended))
  )

  (:action stay_venice_s10_from_5
    :parameters ()
    :precondition (and
      (current_day d9)
      (next_day d9 d10)
      (at venice)
      (venice_count_5))
    :effect (and
      (not (current_day d9))
      (current_day d10)
      (not (venice_count_5))
      (venice_count_6)
      (occupied_venice_s10)
      (workshop_attended))
  )

  (:action fly_mykonos_to_vienna_s1_from_0
    :parameters ()
    :precondition (and
      (current_day d0)
      (next_day d0 d1)
      (at mykonos)
      (direct_flight mykonos vienna)
      (vienna_count_0))
    :effect (and
      (not (current_day d0))
      (current_day d1)
      (not (at mykonos))
      (at vienna)
      (not (vienna_count_0))
      (vienna_count_1)
      (occupied_vienna_s1))
  )

  (:action fly_mykonos_to_vienna_s2_from_0
    :parameters ()
    :precondition (and
      (current_day d1)
      (next_day d1 d2)
      (at mykonos)
      (direct_flight mykonos vienna)
      (vienna_count_0))
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (not (at mykonos))
      (at vienna)
      (not (vienna_count_0))
      (vienna_count_1)
      (occupied_vienna_s2))
  )

  (:action fly_mykonos_to_vienna_s2_from_1
    :parameters ()
    :precondition (and
      (current_day d1)
      (next_day d1 d2)
      (at mykonos)
      (direct_flight mykonos vienna)
      (vienna_count_1))
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (not (at mykonos))
      (at vienna)
      (not (vienna_count_1))
      (vienna_count_2)
      (occupied_vienna_s2))
  )

  (:action fly_mykonos_to_vienna_s2_from_2
    :parameters ()
    :precondition (and
      (current_day d1)
      (next_day d1 d2)
      (at mykonos)
      (direct_flight mykonos vienna)
      (vienna_count_2))
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (not (at mykonos))
      (at vienna)
      (not (vienna_count_2))
      (vienna_count_3)
      (occupied_vienna_s2))
  )

  (:action fly_mykonos_to_vienna_s2_from_3
    :parameters ()
    :precondition (and
      (current_day d1)
      (next_day d1 d2)
      (at mykonos)
      (direct_flight mykonos vienna)
      (vienna_count_3))
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (not (at mykonos))
      (at vienna)
      (not (vienna_count_3))
      (vienna_count_4)
      (occupied_vienna_s2))
  )

  (:action fly_vienna_to_mykonos_s1_from_0
    :parameters ()
    :precondition (and
      (current_day d0)
      (next_day d0 d1)
      (at vienna)
      (direct_flight vienna mykonos)
      (mykonos_count_0))
    :effect (and
      (not (current_day d0))
      (current_day d1)
      (not (at vienna))
      (at mykonos)
      (not (mykonos_count_0))
      (mykonos_count_1)
      (occupied_mykonos_s1))
  )

  (:action fly_vienna_to_mykonos_s2_from_0
    :parameters ()
    :precondition (and
      (current_day d1)
      (next_day d1 d2)
      (at vienna)
      (direct_flight vienna mykonos)
      (mykonos_count_0))
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (not (at vienna))
      (at mykonos)
      (not (mykonos_count_0))
      (mykonos_count_1)
      (occupied_mykonos_s2))
  )

  (:action fly_vienna_to_mykonos_s2_from_1
    :parameters ()
    :precondition (and
      (current_day d1)
      (next_day d1 d2)
      (at vienna)
      (direct_flight vienna mykonos)
      (mykonos_count_1))
    :effect (and
      (not (current_day d1))
      (current_day d2)
      (not (at vienna))
      (at mykonos)
      (not (mykonos_count_1))
      (mykonos_count_2)
      (occupied_mykonos_s2))
  )

  (:action fly_vienna_to_venice_s1_from_0
    :parameters ()
    :precondition (and
      (current_day d0)
      (next_day d0 d1)
      (at vienna)
      (direct_flight vienna venice)
      (venice_count_0))
    :effect (and
      (not (current_day d0))
      (current_day d1)
      (not (at vienna))
      (at venice)
      (not (venice_count_0))
      (venice_count_1)
      (occupied_venice_s1))
  )

  (:action fly_venice_to_vienna_s1_from_0
    :parameters ()
    :precondition (and
      (current_day d0)
      (next_day d0 d1)
      (at venice)
      (direct_flight venice vienna)
      (vienna_count_0))
    :effect (and
      (not (current_day d0))
      (current_day d1)
      (not (at venice))
      (at vienna)
      (not (vienna_count_0))
      (vienna_count_1)
      (occupied_vienna_s1))
  )
)