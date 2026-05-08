(define (domain european_trip_13days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (assigned ?d - day)
    (at_on ?d - day ?c - city)
  )

  (:action initialize_day_1_in_stockholm
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (assigned day_1))
    )
    :effect (and
      (assigned day_1)
      (at_on day_1 stockholm)
      (not (current_day day_1))
      (current_day day_2)
    )
  )

  (:action assign_day_2_stockholm_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_1)
      (next_day day_1 day_2)
      (assigned day_1)
      (at_on day_1 stockholm)
      (not (assigned day_2))
    )
    :effect (and
      (assigned day_2)
      (at_on day_2 stockholm)
      (not (current_day day_1))
      (current_day day_2)
    )
  )

  (:action assign_day_2_athens_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_1)
      (next_day day_1 day_2)
      (assigned day_1)
      (at_on day_1 stockholm)
      (not (assigned day_2))
      (direct stockholm athens)
    )
    :effect (and
      (assigned day_2)
      (at_on day_2 athens)
      (not (current_day day_1))
      (current_day day_2)
    )
  )

  (:action assign_day_3_stockholm_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (assigned day_2)
      (at_on day_2 stockholm)
      (not (assigned day_3))
    )
    :effect (and
      (assigned day_3)
      (at_on day_3 stockholm)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action assign_day_3_athens_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (assigned day_2)
      (at_on day_2 stockholm)
      (not (assigned day_3))
      (direct stockholm athens)
    )
    :effect (and
      (assigned day_3)
      (at_on day_3 athens)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action assign_day_3_athens_from_athens
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (assigned day_2)
      (at_on day_2 athens)
      (not (assigned day_3))
    )
    :effect (and
      (assigned day_3)
      (at_on day_3 athens)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action assign_day_3_stockholm_from_athens
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (assigned day_2)
      (at_on day_2 athens)
      (not (assigned day_3))
      (direct athens stockholm)
    )
    :effect (and
      (assigned day_3)
      (at_on day_3 stockholm)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action assign_day_3_mykonos_from_athens
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (assigned day_2)
      (at_on day_2 athens)
      (not (assigned day_3))
      (direct athens mykonos)
    )
    :effect (and
      (assigned day_3)
      (at_on day_3 mykonos)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action assign_day_4_stockholm_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (assigned day_3)
      (at_on day_3 stockholm)
      (not (assigned day_4))
    )
    :effect (and
      (assigned day_4)
      (at_on day_4 stockholm)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action assign_day_4_athens_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (assigned day_3)
      (at_on day_3 stockholm)
      (not (assigned day_4))
      (direct stockholm athens)
    )
    :effect (and
      (assigned day_4)
      (at_on day_4 athens)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action assign_day_4_athens_from_athens
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (assigned day_3)
      (at_on day_3 athens)
      (not (assigned day_4))
    )
    :effect (and
      (assigned day_4)
      (at_on day_4 athens)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action assign_day_4_stockholm_from_athens
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (assigned day_3)
      (at_on day_3 athens)
      (not (assigned day_4))
      (direct athens stockholm)
    )
    :effect (and
      (assigned day_4)
      (at_on day_4 stockholm)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action assign_day_4_mykonos_from_athens
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (assigned day_3)
      (at_on day_3 athens)
      (not (assigned day_4))
      (direct athens mykonos)
    )
    :effect (and
      (assigned day_4)
      (at_on day_4 mykonos)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action assign_day_4_mykonos_from_mykonos
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (assigned day_3)
      (at_on day_3 mykonos)
      (not (assigned day_4))
    )
    :effect (and
      (assigned day_4)
      (at_on day_4 mykonos)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action assign_day_4_athens_from_mykonos
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (assigned day_3)
      (at_on day_3 mykonos)
      (not (assigned day_4))
      (direct mykonos athens)
    )
    :effect (and
      (assigned day_4)
      (at_on day_4 athens)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action assign_day_5_stockholm_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (assigned day_4)
      (at_on day_4 stockholm)
      (not (assigned day_5))
    )
    :effect (and
      (assigned day_5)
      (at_on day_5 stockholm)
      (not (current_day day_4))
      (current_day day_5)
    )
  )

  (:action assign_day_5_athens_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (assigned day_4)
      (at_on day_4 stockholm)
      (not (assigned day_5))
      (direct stockholm athens)
    )
    :effect (and
      (assigned day_5)
      (at_on day_5 athens)
      (not (current_day day_4))
      (current_day day_5)
    )
  )

  (:action assign_day_5_athens_from_athens
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (assigned day_4)
      (at_on day_4 athens)
      (not (assigned day_5))
    )
    :effect (and
      (assigned day_5)
      (at_on day_5 athens)
      (not (current_day day_4))
      (current_day day_5)
    )
  )

  (:action assign_day_5_stockholm_from_athens
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (assigned day_4)
      (at_on day_4 athens)
      (not (assigned day_5))
      (direct athens stockholm)
    )
    :effect (and
      (assigned day_5)
      (at_on day_5 stockholm)
      (not (current_day day_4))
      (current_day day_5)
    )
  )

  (:action assign_day_5_mykonos_from_athens
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (assigned day_4)
      (at_on day_4 athens)
      (not (assigned day_5))
      (direct athens mykonos)
    )
    :effect (and
      (assigned day_5)
      (at_on day_5 mykonos)
      (not (current_day day_4))
      (current_day day_5)
    )
  )

  (:action assign_day_5_mykonos_from_mykonos
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (assigned day_4)
      (at_on day_4 mykonos)
      (not (assigned day_5))
    )
    :effect (and
      (assigned day_5)
      (at_on day_5 mykonos)
      (not (current_day day_4))
      (current_day day_5)
    )
  )

  (:action assign_day_5_athens_from_mykonos
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (assigned day_4)
      (at_on day_4 mykonos)
      (not (assigned day_5))
      (direct mykonos athens)
    )
    :effect (and
      (assigned day_5)
      (at_on day_5 athens)
      (not (current_day day_4))
      (current_day day_5)
    )
  )

  (:action assign_day_6_stockholm_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_5)
      (next_day day_5 day_6)
      (assigned day_5)
      (at_on day_5 stockholm)
      (not (assigned day_6))
    )
    :effect (and
      (assigned day_6)
      (at_on day_6 stockholm)
      (not (current_day day_5))
      (current_day day_6)
    )
  )

  (:action assign_day_6_stockholm_from_athens
    :parameters ()
    :precondition (and
      (current_day day_5)
      (next_day day_5 day_6)
      (assigned day_5)
      (at_on day_5 athens)
      (not (assigned day_6))
      (direct athens stockholm)
    )
    :effect (and
      (assigned day_6)
      (at_on day_6 stockholm)
      (not (current_day day_5))
      (current_day day_6)
    )
  )

  (:action assign_day_7_stockholm_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_6)
      (next_day day_6 day_7)
      (assigned day_6)
      (at_on day_6 stockholm)
      (not (assigned day_7))
    )
    :effect (and
      (assigned day_7)
      (at_on day_7 stockholm)
      (not (current_day day_6))
      (current_day day_7)
    )
  )

  (:action assign_day_7_athens_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_6)
      (next_day day_6 day_7)
      (assigned day_6)
      (at_on day_6 stockholm)
      (not (assigned day_7))
      (direct stockholm athens)
    )
    :effect (and
      (assigned day_7)
      (at_on day_7 athens)
      (not (current_day day_6))
      (current_day day_7)
    )
  )

  (:action assign_day_8_stockholm_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (assigned day_7)
      (at_on day_7 stockholm)
      (not (assigned day_8))
    )
    :effect (and
      (assigned day_8)
      (at_on day_8 stockholm)
      (not (current_day day_7))
      (current_day day_8)
    )
  )

  (:action assign_day_8_athens_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (assigned day_7)
      (at_on day_7 stockholm)
      (not (assigned day_8))
      (direct stockholm athens)
    )
    :effect (and
      (assigned day_8)
      (at_on day_8 athens)
      (not (current_day day_7))
      (current_day day_8)
    )
  )

  (:action assign_day_8_athens_from_athens
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (assigned day_7)
      (at_on day_7 athens)
      (not (assigned day_8))
    )
    :effect (and
      (assigned day_8)
      (at_on day_8 athens)
      (not (current_day day_7))
      (current_day day_8)
    )
  )

  (:action assign_day_8_stockholm_from_athens
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (assigned day_7)
      (at_on day_7 athens)
      (not (assigned day_8))
      (direct athens stockholm)
    )
    :effect (and
      (assigned day_8)
      (at_on day_8 stockholm)
      (not (current_day day_7))
      (current_day day_8)
    )
  )

  (:action assign_day_8_mykonos_from_athens
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (assigned day_7)
      (at_on day_7 athens)
      (not (assigned day_8))
      (direct athens mykonos)
    )
    :effect (and
      (assigned day_8)
      (at_on day_8 mykonos)
      (not (current_day day_7))
      (current_day day_8)
    )
  )

  (:action assign_day_8_mykonos_from_mykonos
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (assigned day_7)
      (at_on day_7 mykonos)
      (not (assigned day_8))
    )
    :effect (and
      (assigned day_8)
      (at_on day_8 mykonos)
      (not (current_day day_7))
      (current_day day_8)
    )
  )

  (:action assign_day_8_athens_from_mykonos
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (assigned day_7)
      (at_on day_7 mykonos)
      (not (assigned day_8))
      (direct mykonos athens)
    )
    :effect (and
      (assigned day_8)
      (at_on day_8 athens)
      (not (current_day day_7))
      (current_day day_8)
    )
  )

  (:action assign_day_9_stockholm_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (assigned day_8)
      (at_on day_8 stockholm)
      (not (assigned day_9))
    )
    :effect (and
      (assigned day_9)
      (at_on day_9 stockholm)
      (not (current_day day_8))
      (current_day day_9)
    )
  )

  (:action assign_day_9_athens_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (assigned day_8)
      (at_on day_8 stockholm)
      (not (assigned day_9))
      (direct stockholm athens)
    )
    :effect (and
      (assigned day_9)
      (at_on day_9 athens)
      (not (current_day day_8))
      (current_day day_9)
    )
  )

  (:action assign_day_9_athens_from_athens
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (assigned day_8)
      (at_on day_8 athens)
      (not (assigned day_9))
    )
    :effect (and
      (assigned day_9)
      (at_on day_9 athens)
      (not (current_day day_8))
      (current_day day_9)
    )
  )

  (:action assign_day_9_stockholm_from_athens
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (assigned day_8)
      (at_on day_8 athens)
      (not (assigned day_9))
      (direct athens stockholm)
    )
    :effect (and
      (assigned day_9)
      (at_on day_9 stockholm)
      (not (current_day day_8))
      (current_day day_9)
    )
  )

  (:action assign_day_9_mykonos_from_athens
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (assigned day_8)
      (at_on day_8 athens)
      (not (assigned day_9))
      (direct athens mykonos)
    )
    :effect (and
      (assigned day_9)
      (at_on day_9 mykonos)
      (not (current_day day_8))
      (current_day day_9)
    )
  )

  (:action assign_day_9_mykonos_from_mykonos
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (assigned day_8)
      (at_on day_8 mykonos)
      (not (assigned day_9))
    )
    :effect (and
      (assigned day_9)
      (at_on day_9 mykonos)
      (not (current_day day_8))
      (current_day day_9)
    )
  )

  (:action assign_day_9_athens_from_mykonos
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (assigned day_8)
      (at_on day_8 mykonos)
      (not (assigned day_9))
      (direct mykonos athens)
    )
    :effect (and
      (assigned day_9)
      (at_on day_9 athens)
      (not (current_day day_8))
      (current_day day_9)
    )
  )

  (:action assign_day_10_stockholm_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (assigned day_9)
      (at_on day_9 stockholm)
      (not (assigned day_10))
    )
    :effect (and
      (assigned day_10)
      (at_on day_10 stockholm)
      (not (current_day day_9))
      (current_day day_10)
    )
  )

  (:action assign_day_10_athens_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (assigned day_9)
      (at_on day_9 stockholm)
      (not (assigned day_10))
      (direct stockholm athens)
    )
    :effect (and
      (assigned day_10)
      (at_on day_10 athens)
      (not (current_day day_9))
      (current_day day_10)
    )
  )

  (:action assign_day_10_athens_from_athens
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (assigned day_9)
      (at_on day_9 athens)
      (not (assigned day_10))
    )
    :effect (and
      (assigned day_10)
      (at_on day_10 athens)
      (not (current_day day_9))
      (current_day day_10)
    )
  )

  (:action assign_day_10_stockholm_from_athens
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (assigned day_9)
      (at_on day_9 athens)
      (not (assigned day_10))
      (direct athens stockholm)
    )
    :effect (and
      (assigned day_10)
      (at_on day_10 stockholm)
      (not (current_day day_9))
      (current_day day_10)
    )
  )

  (:action assign_day_10_mykonos_from_athens
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (assigned day_9)
      (at_on day_9 athens)
      (not (assigned day_10))
      (direct athens mykonos)
    )
    :effect (and
      (assigned day_10)
      (at_on day_10 mykonos)
      (not (current_day day_9))
      (current_day day_10)
    )
  )

  (:action assign_day_10_mykonos_from_mykonos
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (assigned day_9)
      (at_on day_9 mykonos)
      (not (assigned day_10))
    )
    :effect (and
      (assigned day_10)
      (at_on day_10 mykonos)
      (not (current_day day_9))
      (current_day day_10)
    )
  )

  (:action assign_day_10_athens_from_mykonos
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (assigned day_9)
      (at_on day_9 mykonos)
      (not (assigned day_10))
      (direct mykonos athens)
    )
    :effect (and
      (assigned day_10)
      (at_on day_10 athens)
      (not (current_day day_9))
      (current_day day_10)
    )
  )

  (:action assign_day_11_stockholm_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_10)
      (next_day day_10 day_11)
      (assigned day_10)
      (at_on day_10 stockholm)
      (not (assigned day_11))
    )
    :effect (and
      (assigned day_11)
      (at_on day_11 stockholm)
      (not (current_day day_10))
      (current_day day_11)
    )
  )

  (:action assign_day_11_athens_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_10)
      (next_day day_10 day_11)
      (assigned day_10)
      (at_on day_10 stockholm)
      (not (assigned day_11))
      (direct stockholm athens)
    )
    :effect (and
      (assigned day_11)
      (at_on day_11 athens)
      (not (current_day day_10))
      (current_day day_11)
    )
  )

  (:action assign_day_11_athens_from_athens
    :parameters ()
    :precondition (and
      (current_day day_10)
      (next_day day_10 day_11)
      (assigned day_10)
      (at_on day_10 athens)
      (not (assigned day_11))
    )
    :effect (and
      (assigned day_11)
      (at_on day_11 athens)
      (not (current_day day_10))
      (current_day day_11)
    )
  )

  (:action assign_day_11_stockholm_from_athens
    :parameters ()
    :precondition (and
      (current_day day_10)
      (next_day day_10 day_11)
      (assigned day_10)
      (at_on day_10 athens)
      (not (assigned day_11))
      (direct athens stockholm)
    )
    :effect (and
      (assigned day_11)
      (at_on day_11 stockholm)
      (not (current_day day_10))
      (current_day day_11)
    )
  )

  (:action assign_day_11_mykonos_from_athens
    :parameters ()
    :precondition (and
      (current_day day_10)
      (next_day day_10 day_11)
      (assigned day_10)
      (at_on day_10 athens)
      (not (assigned day_11))
      (direct athens mykonos)
    )
    :effect (and
      (assigned day_11)
      (at_on day_11 mykonos)
      (not (current_day day_10))
      (current_day day_11)
    )
  )

  (:action assign_day_11_mykonos_from_mykonos
    :parameters ()
    :precondition (and
      (current_day day_10)
      (next_day day_10 day_11)
      (assigned day_10)
      (at_on day_10 mykonos)
      (not (assigned day_11))
    )
    :effect (and
      (assigned day_11)
      (at_on day_11 mykonos)
      (not (current_day day_10))
      (current_day day_11)
    )
  )

  (:action assign_day_11_athens_from_mykonos
    :parameters ()
    :precondition (and
      (current_day day_10)
      (next_day day_10 day_11)
      (assigned day_10)
      (at_on day_10 mykonos)
      (not (assigned day_11))
      (direct mykonos athens)
    )
    :effect (and
      (assigned day_11)
      (at_on day_11 athens)
      (not (current_day day_10))
      (current_day day_11)
    )
  )

  (:action assign_day_12_stockholm_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_11)
      (next_day day_11 day_12)
      (assigned day_11)
      (at_on day_11 stockholm)
      (not (assigned day_12))
    )
    :effect (and
      (assigned day_12)
      (at_on day_12 stockholm)
      (not (current_day day_11))
      (current_day day_12)
    )
  )

  (:action assign_day_12_athens_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_11)
      (next_day day_11 day_12)
      (assigned day_11)
      (at_on day_11 stockholm)
      (not (assigned day_12))
      (direct stockholm athens)
    )
    :effect (and
      (assigned day_12)
      (at_on day_12 athens)
      (not (current_day day_11))
      (current_day day_12)
    )
  )

  (:action assign_day_12_athens_from_athens
    :parameters ()
    :precondition (and
      (current_day day_11)
      (next_day day_11 day_12)
      (assigned day_11)
      (at_on day_11 athens)
      (not (assigned day_12))
    )
    :effect (and
      (assigned day_12)
      (at_on day_12 athens)
      (not (current_day day_11))
      (current_day day_12)
    )
  )

  (:action assign_day_12_stockholm_from_athens
    :parameters ()
    :precondition (and
      (current_day day_11)
      (next_day day_11 day_12)
      (assigned day_11)
      (at_on day_11 athens)
      (not (assigned day_12))
      (direct athens stockholm)
    )
    :effect (and
      (assigned day_12)
      (at_on day_12 stockholm)
      (not (current_day day_11))
      (current_day day_12)
    )
  )

  (:action assign_day_12_mykonos_from_athens
    :parameters ()
    :precondition (and
      (current_day day_11)
      (next_day day_11 day_12)
      (assigned day_11)
      (at_on day_11 athens)
      (not (assigned day_12))
      (direct athens mykonos)
    )
    :effect (and
      (assigned day_12)
      (at_on day_12 mykonos)
      (not (current_day day_11))
      (current_day day_12)
    )
  )

  (:action assign_day_12_mykonos_from_mykonos
    :parameters ()
    :precondition (and
      (current_day day_11)
      (next_day day_11 day_12)
      (assigned day_11)
      (at_on day_11 mykonos)
      (not (assigned day_12))
    )
    :effect (and
      (assigned day_12)
      (at_on day_12 mykonos)
      (not (current_day day_11))
      (current_day day_12)
    )
  )

  (:action assign_day_12_athens_from_mykonos
    :parameters ()
    :precondition (and
      (current_day day_11)
      (next_day day_11 day_12)
      (assigned day_11)
      (at_on day_11 mykonos)
      (not (assigned day_12))
      (direct mykonos athens)
    )
    :effect (and
      (assigned day_12)
      (at_on day_12 athens)
      (not (current_day day_11))
      (current_day day_12)
    )
  )

  (:action assign_day_13_stockholm_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_12)
      (next_day day_12 day_13)
      (assigned day_12)
      (at_on day_12 stockholm)
      (not (assigned day_13))
    )
    :effect (and
      (assigned day_13)
      (at_on day_13 stockholm)
      (not (current_day day_12))
    )
  )

  (:action assign_day_13_athens_from_stockholm
    :parameters ()
    :precondition (and
      (current_day day_12)
      (next_day day_12 day_13)
      (assigned day_12)
      (at_on day_12 stockholm)
      (not (assigned day_13))
      (direct stockholm athens)
    )
    :effect (and
      (assigned day_13)
      (at_on day_13 athens)
      (not (current_day day_12))
    )
  )

  (:action assign_day_13_athens_from_athens
    :parameters ()
    :precondition (and
      (current_day day_12)
      (next_day day_12 day_13)
      (assigned day_12)
      (at_on day_12 athens)
      (not (assigned day_13))
    )
    :effect (and
      (assigned day_13)
      (at_on day_13 athens)
      (not (current_day day_12))
    )
  )

  (:action assign_day_13_stockholm_from_athens
    :parameters ()
    :precondition (and
      (current_day day_12)
      (next_day day_12 day_13)
      (assigned day_12)
      (at_on day_12 athens)
      (not (assigned day_13))
      (direct athens stockholm)
    )
    :effect (and
      (assigned day_13)
      (at_on day_13 stockholm)
      (not (current_day day_12))
    )
  )

  (:action assign_day_13_mykonos_from_athens
    :parameters ()
    :precondition (and
      (current_day day_12)
      (next_day day_12 day_13)
      (assigned day_12)
      (at_on day_12 athens)
      (not (assigned day_13))
      (direct athens mykonos)
    )
    :effect (and
      (assigned day_13)
      (at_on day_13 mykonos)
      (not (current_day day_12))
    )
  )

  (:action assign_day_13_mykonos_from_mykonos
    :parameters ()
    :precondition (and
      (current_day day_12)
      (next_day day_12 day_13)
      (assigned day_12)
      (at_on day_12 mykonos)
      (not (assigned day_13))
    )
    :effect (and
      (assigned day_13)
      (at_on day_13 mykonos)
      (not (current_day day_12))
    )
  )

  (:action assign_day_13_athens_from_mykonos
    :parameters ()
    :precondition (and
      (current_day day_12)
      (next_day day_12 day_13)
      (assigned day_12)
      (at_on day_12 mykonos)
      (not (assigned day_13))
      (direct mykonos athens)
    )
    :effect (and
      (assigned day_13)
      (at_on day_13 athens)
      (not (current_day day_12))
    )
  )
)