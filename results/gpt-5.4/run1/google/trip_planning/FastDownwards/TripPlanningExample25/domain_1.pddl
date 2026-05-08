(define (domain european_trip_16_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)

    (current_day ?d - day)
    (in_city ?c - city ?d - day)

    (visited_valencia)
    (visited_lyon)
    (visited_split)
  )

  (:action start_in_valencia
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (visited_valencia))
      (not (visited_lyon))
      (not (visited_split))
    )
    :effect (and
      (in_city valencia day_1)
      (visited_valencia)
    )
  )

  (:action start_in_lyon
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (visited_valencia))
      (not (visited_lyon))
      (not (visited_split))
    )
    :effect (and
      (in_city lyon day_1)
      (visited_lyon)
    )
  )

  (:action start_in_split
    :parameters ()
    :precondition (and
      (current_day day_1)
      (not (visited_valencia))
      (not (visited_lyon))
      (not (visited_split))
    )
    :effect (and
      (in_city split day_1)
      (visited_split)
    )
  )

  (:action stay_valencia_d1_d2
    :parameters ()
    :precondition (and
      (current_day day_1)
      (next_day day_1 day_2)
      (in_city valencia day_1)
    )
    :effect (and
      (not (current_day day_1))
      (current_day day_2)
      (in_city valencia day_2)
    )
  )

  (:action stay_valencia_d2_d3
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (in_city valencia day_2)
    )
    :effect (and
      (not (current_day day_2))
      (current_day day_3)
      (in_city valencia day_3)
    )
  )

  (:action stay_valencia_d3_d4
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (in_city valencia day_3)
    )
    :effect (and
      (not (current_day day_3))
      (current_day day_4)
      (in_city valencia day_4)
    )
  )

  (:action stay_valencia_d4_d5
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (in_city valencia day_4)
    )
    :effect (and
      (not (current_day day_4))
      (current_day day_5)
      (in_city valencia day_5)
    )
  )

  (:action stay_valencia_d5_d6
    :parameters ()
    :precondition (and
      (current_day day_5)
      (next_day day_5 day_6)
      (in_city valencia day_5)
    )
    :effect (and
      (not (current_day day_5))
      (current_day day_6)
      (in_city valencia day_6)
    )
  )

  (:action stay_valencia_d6_d7
    :parameters ()
    :precondition (and
      (current_day day_6)
      (next_day day_6 day_7)
      (in_city valencia day_6)
    )
    :effect (and
      (not (current_day day_6))
      (current_day day_7)
      (in_city valencia day_7)
    )
  )

  (:action stay_valencia_d7_d8
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (in_city valencia day_7)
    )
    :effect (and
      (not (current_day day_7))
      (current_day day_8)
      (in_city valencia day_8)
    )
  )

  (:action stay_valencia_d8_d9
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (in_city valencia day_8)
    )
    :effect (and
      (not (current_day day_8))
      (current_day day_9)
      (in_city valencia day_9)
    )
  )

  (:action stay_valencia_d9_d10
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (in_city valencia day_9)
    )
    :effect (and
      (not (current_day day_9))
      (current_day day_10)
      (in_city valencia day_10)
    )
  )

  (:action stay_valencia_d10_d11
    :parameters ()
    :precondition (and
      (current_day day_10)
      (next_day day_10 day_11)
      (in_city valencia day_10)
    )
    :effect (and
      (not (current_day day_10))
      (current_day day_11)
      (in_city valencia day_11)
    )
  )

  (:action stay_valencia_d11_d12
    :parameters ()
    :precondition (and
      (current_day day_11)
      (next_day day_11 day_12)
      (in_city valencia day_11)
    )
    :effect (and
      (not (current_day day_11))
      (current_day day_12)
      (in_city valencia day_12)
    )
  )

  (:action stay_valencia_d12_d13
    :parameters ()
    :precondition (and
      (current_day day_12)
      (next_day day_12 day_13)
      (in_city valencia day_12)
    )
    :effect (and
      (not (current_day day_12))
      (current_day day_13)
      (in_city valencia day_13)
    )
  )

  (:action stay_valencia_d13_d14
    :parameters ()
    :precondition (and
      (current_day day_13)
      (next_day day_13 day_14)
      (in_city valencia day_13)
    )
    :effect (and
      (not (current_day day_13))
      (current_day day_14)
      (in_city valencia day_14)
    )
  )

  (:action stay_valencia_d14_d15
    :parameters ()
    :precondition (and
      (current_day day_14)
      (next_day day_14 day_15)
      (in_city valencia day_14)
    )
    :effect (and
      (not (current_day day_14))
      (current_day day_15)
      (in_city valencia day_15)
    )
  )

  (:action stay_valencia_d15_d16
    :parameters ()
    :precondition (and
      (current_day day_15)
      (next_day day_15 day_16)
      (in_city valencia day_15)
    )
    :effect (and
      (not (current_day day_15))
      (current_day day_16)
      (in_city valencia day_16)
    )
  )

  (:action stay_lyon_d1_d2
    :parameters ()
    :precondition (and
      (current_day day_1)
      (next_day day_1 day_2)
      (in_city lyon day_1)
    )
    :effect (and
      (not (current_day day_1))
      (current_day day_2)
      (in_city lyon day_2)
    )
  )

  (:action stay_lyon_d2_d3
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (in_city lyon day_2)
    )
    :effect (and
      (not (current_day day_2))
      (current_day day_3)
      (in_city lyon day_3)
    )
  )

  (:action stay_lyon_d3_d4
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (in_city lyon day_3)
    )
    :effect (and
      (not (current_day day_3))
      (current_day day_4)
      (in_city lyon day_4)
    )
  )

  (:action stay_lyon_d4_d5
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (in_city lyon day_4)
    )
    :effect (and
      (not (current_day day_4))
      (current_day day_5)
      (in_city lyon day_5)
    )
  )

  (:action stay_lyon_d5_d6
    :parameters ()
    :precondition (and
      (current_day day_5)
      (next_day day_5 day_6)
      (in_city lyon day_5)
    )
    :effect (and
      (not (current_day day_5))
      (current_day day_6)
      (in_city lyon day_6)
    )
  )

  (:action stay_lyon_d6_d7
    :parameters ()
    :precondition (and
      (current_day day_6)
      (next_day day_6 day_7)
      (in_city lyon day_6)
    )
    :effect (and
      (not (current_day day_6))
      (current_day day_7)
      (in_city lyon day_7)
    )
  )

  (:action stay_lyon_d7_d8
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (in_city lyon day_7)
    )
    :effect (and
      (not (current_day day_7))
      (current_day day_8)
      (in_city lyon day_8)
    )
  )

  (:action stay_lyon_d8_d9
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (in_city lyon day_8)
    )
    :effect (and
      (not (current_day day_8))
      (current_day day_9)
      (in_city lyon day_9)
    )
  )

  (:action stay_lyon_d9_d10
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (in_city lyon day_9)
    )
    :effect (and
      (not (current_day day_9))
      (current_day day_10)
      (in_city lyon day_10)
    )
  )

  (:action stay_lyon_d10_d11
    :parameters ()
    :precondition (and
      (current_day day_10)
      (next_day day_10 day_11)
      (in_city lyon day_10)
    )
    :effect (and
      (not (current_day day_10))
      (current_day day_11)
      (in_city lyon day_11)
    )
  )

  (:action stay_lyon_d11_d12
    :parameters ()
    :precondition (and
      (current_day day_11)
      (next_day day_11 day_12)
      (in_city lyon day_11)
    )
    :effect (and
      (not (current_day day_11))
      (current_day day_12)
      (in_city lyon day_12)
    )
  )

  (:action stay_lyon_d12_d13
    :parameters ()
    :precondition (and
      (current_day day_12)
      (next_day day_12 day_13)
      (in_city lyon day_12)
    )
    :effect (and
      (not (current_day day_12))
      (current_day day_13)
      (in_city lyon day_13)
    )
  )

  (:action stay_lyon_d13_d14
    :parameters ()
    :precondition (and
      (current_day day_13)
      (next_day day_13 day_14)
      (in_city lyon day_13)
    )
    :effect (and
      (not (current_day day_13))
      (current_day day_14)
      (in_city lyon day_14)
    )
  )

  (:action stay_lyon_d14_d15
    :parameters ()
    :precondition (and
      (current_day day_14)
      (next_day day_14 day_15)
      (in_city lyon day_14)
    )
    :effect (and
      (not (current_day day_14))
      (current_day day_15)
      (in_city lyon day_15)
    )
  )

  (:action stay_lyon_d15_d16
    :parameters ()
    :precondition (and
      (current_day day_15)
      (next_day day_15 day_16)
      (in_city lyon day_15)
    )
    :effect (and
      (not (current_day day_15))
      (current_day day_16)
      (in_city lyon day_16)
    )
  )

  (:action stay_split_d1_d2
    :parameters ()
    :precondition (and
      (current_day day_1)
      (next_day day_1 day_2)
      (in_city split day_1)
    )
    :effect (and
      (not (current_day day_1))
      (current_day day_2)
      (in_city split day_2)
    )
  )

  (:action stay_split_d2_d3
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (in_city split day_2)
    )
    :effect (and
      (not (current_day day_2))
      (current_day day_3)
      (in_city split day_3)
    )
  )

  (:action stay_split_d3_d4
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (in_city split day_3)
    )
    :effect (and
      (not (current_day day_3))
      (current_day day_4)
      (in_city split day_4)
    )
  )

  (:action stay_split_d4_d5
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (in_city split day_4)
    )
    :effect (and
      (not (current_day day_4))
      (current_day day_5)
      (in_city split day_5)
    )
  )

  (:action stay_split_d5_d6
    :parameters ()
    :precondition (and
      (current_day day_5)
      (next_day day_5 day_6)
      (in_city split day_5)
    )
    :effect (and
      (not (current_day day_5))
      (current_day day_6)
      (in_city split day_6)
    )
  )

  (:action stay_split_d6_d7
    :parameters ()
    :precondition (and
      (current_day day_6)
      (next_day day_6 day_7)
      (in_city split day_6)
    )
    :effect (and
      (not (current_day day_6))
      (current_day day_7)
      (in_city split day_7)
    )
  )

  (:action stay_split_d7_d8
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (in_city split day_7)
    )
    :effect (and
      (not (current_day day_7))
      (current_day day_8)
      (in_city split day_8)
    )
  )

  (:action stay_split_d8_d9
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (in_city split day_8)
    )
    :effect (and
      (not (current_day day_8))
      (current_day day_9)
      (in_city split day_9)
    )
  )

  (:action stay_split_d9_d10
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (in_city split day_9)
    )
    :effect (and
      (not (current_day day_9))
      (current_day day_10)
      (in_city split day_10)
    )
  )

  (:action stay_split_d10_d11
    :parameters ()
    :precondition (and
      (current_day day_10)
      (next_day day_10 day_11)
      (in_city split day_10)
    )
    :effect (and
      (not (current_day day_10))
      (current_day day_11)
      (in_city split day_11)
    )
  )

  (:action stay_split_d11_d12
    :parameters ()
    :precondition (and
      (current_day day_11)
      (next_day day_11 day_12)
      (in_city split day_11)
    )
    :effect (and
      (not (current_day day_11))
      (current_day day_12)
      (in_city split day_12)
    )
  )

  (:action stay_split_d12_d13
    :parameters ()
    :precondition (and
      (current_day day_12)
      (next_day day_12 day_13)
      (in_city split day_12)
    )
    :effect (and
      (not (current_day day_12))
      (current_day day_13)
      (in_city split day_13)
    )
  )

  (:action stay_split_d13_d14
    :parameters ()
    :precondition (and
      (current_day day_13)
      (next_day day_13 day_14)
      (in_city split day_13)
    )
    :effect (and
      (not (current_day day_13))
      (current_day day_14)
      (in_city split day_14)
    )
  )

  (:action stay_split_d14_d15
    :parameters ()
    :precondition (and
      (current_day day_14)
      (next_day day_14 day_15)
      (in_city split day_14)
    )
    :effect (and
      (not (current_day day_14))
      (current_day day_15)
      (in_city split day_15)
    )
  )

  (:action stay_split_d15_d16
    :parameters ()
    :precondition (and
      (current_day day_15)
      (next_day day_15 day_16)
      (in_city split day_15)
    )
    :effect (and
      (not (current_day day_15))
      (current_day day_16)
      (in_city split day_16)
    )
  )

  (:action fly_valencia_to_lyon_d1_d2
    :parameters ()
    :precondition (and
      (current_day day_1)
      (next_day day_1 day_2)
      (in_city valencia day_1)
      (direct valencia lyon)
      (not (in_city lyon day_2))
    )
    :effect (and
      (not (current_day day_1))
      (current_day day_2)
      (in_city lyon day_2)
      (visited_lyon)
    )
  )

  (:action fly_valencia_to_lyon_d2_d3
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (in_city valencia day_2)
      (direct valencia lyon)
      (not (in_city lyon day_3))
    )
    :effect (and
      (not (current_day day_2))
      (current_day day_3)
      (in_city lyon day_3)
      (visited_lyon)
    )
  )

  (:action fly_valencia_to_lyon_d3_d4
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (in_city valencia day_3)
      (direct valencia lyon)
      (not (in_city lyon day_4))
    )
    :effect (and
      (not (current_day day_3))
      (current_day day_4)
      (in_city lyon day_4)
      (visited_lyon)
    )
  )

  (:action fly_valencia_to_lyon_d4_d5
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (in_city valencia day_4)
      (direct valencia lyon)
      (not (in_city lyon day_5))
    )
    :effect (and
      (not (current_day day_4))
      (current_day day_5)
      (in_city lyon day_5)
      (visited_lyon)
    )
  )

  (:action fly_valencia_to_lyon_d5_d6
    :parameters ()
    :precondition (and
      (current_day day_5)
      (next_day day_5 day_6)
      (in_city valencia day_5)
      (direct valencia lyon)
      (not (in_city lyon day_6))
    )
    :effect (and
      (not (current_day day_5))
      (current_day day_6)
      (in_city lyon day_6)
      (visited_lyon)
    )
  )

  (:action fly_valencia_to_lyon_d6_d7
    :parameters ()
    :precondition (and
      (current_day day_6)
      (next_day day_6 day_7)
      (in_city valencia day_6)
      (direct valencia lyon)
      (not (in_city lyon day_7))
    )
    :effect (and
      (not (current_day day_6))
      (current_day day_7)
      (in_city lyon day_7)
      (visited_lyon)
    )
  )

  (:action fly_valencia_to_lyon_d7_d8
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (in_city valencia day_7)
      (direct valencia lyon)
      (not (in_city lyon day_8))
    )
    :effect (and
      (not (current_day day_7))
      (current_day day_8)
      (in_city lyon day_8)
      (visited_lyon)
    )
  )

  (:action fly_valencia_to_lyon_d8_d9
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (in_city valencia day_8)
      (direct valencia lyon)
      (not (in_city lyon day_9))
    )
    :effect (and
      (not (current_day day_8))
      (current_day day_9)
      (in_city lyon day_9)
      (visited_lyon)
    )
  )

  (:action fly_valencia_to_lyon_d9_d10
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (in_city valencia day_9)
      (direct valencia lyon)
      (not (in_city lyon day_10))
    )
    :effect (and
      (not (current_day day_9))
      (current_day day_10)
      (in_city lyon day_10)
      (visited_lyon)
    )
  )

  (:action fly_lyon_to_valencia_d1_d2
    :parameters ()
    :precondition (and
      (current_day day_1)
      (next_day day_1 day_2)
      (in_city lyon day_1)
      (direct lyon valencia)
      (not (in_city valencia day_2))
    )
    :effect (and
      (not (current_day day_1))
      (current_day day_2)
      (in_city valencia day_2)
      (visited_valencia)
    )
  )

  (:action fly_lyon_to_valencia_d2_d3
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (in_city lyon day_2)
      (direct lyon valencia)
      (not (in_city valencia day_3))
    )
    :effect (and
      (not (current_day day_2))
      (current_day day_3)
      (in_city valencia day_3)
      (visited_valencia)
    )
  )

  (:action fly_lyon_to_valencia_d3_d4
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (in_city lyon day_3)
      (direct lyon valencia)
      (not (in_city valencia day_4))
    )
    :effect (and
      (not (current_day day_3))
      (current_day day_4)
      (in_city valencia day_4)
      (visited_valencia)
    )
  )

  (:action fly_lyon_to_valencia_d4_d5
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (in_city lyon day_4)
      (direct lyon valencia)
      (not (in_city valencia day_5))
    )
    :effect (and
      (not (current_day day_4))
      (current_day day_5)
      (in_city valencia day_5)
      (visited_valencia)
    )
  )

  (:action fly_lyon_to_valencia_d5_d6
    :parameters ()
    :precondition (and
      (current_day day_5)
      (next_day day_5 day_6)
      (in_city lyon day_5)
      (direct lyon valencia)
      (not (in_city valencia day_6))
    )
    :effect (and
      (not (current_day day_5))
      (current_day day_6)
      (in_city valencia day_6)
      (visited_valencia)
    )
  )

  (:action fly_lyon_to_valencia_d6_d7
    :parameters ()
    :precondition (and
      (current_day day_6)
      (next_day day_6 day_7)
      (in_city lyon day_6)
      (direct lyon valencia)
      (not (in_city valencia day_7))
    )
    :effect (and
      (not (current_day day_6))
      (current_day day_7)
      (in_city valencia day_7)
      (visited_valencia)
    )
  )

  (:action fly_lyon_to_valencia_d7_d8
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (in_city lyon day_7)
      (direct lyon valencia)
      (not (in_city valencia day_8))
    )
    :effect (and
      (not (current_day day_7))
      (current_day day_8)
      (in_city valencia day_8)
      (visited_valencia)
    )
  )

  (:action fly_lyon_to_valencia_d8_d9
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (in_city lyon day_8)
      (direct lyon valencia)
      (not (in_city valencia day_9))
    )
    :effect (and
      (not (current_day day_8))
      (current_day day_9)
      (in_city valencia day_9)
      (visited_valencia)
    )
  )

  (:action fly_lyon_to_valencia_d9_d10
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (in_city lyon day_9)
      (direct lyon valencia)
      (not (in_city valencia day_10))
    )
    :effect (and
      (not (current_day day_9))
      (current_day day_10)
      (in_city valencia day_10)
      (visited_valencia)
    )
  )

  (:action fly_lyon_to_split_d1_d2
    :parameters ()
    :precondition (and
      (current_day day_1)
      (next_day day_1 day_2)
      (in_city lyon day_1)
      (direct lyon split)
      (not (in_city split day_2))
    )
    :effect (and
      (not (current_day day_1))
      (current_day day_2)
      (in_city split day_2)
      (visited_split)
    )
  )

  (:action fly_lyon_to_split_d2_d3
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (in_city lyon day_2)
      (direct lyon split)
      (not (in_city split day_3))
    )
    :effect (and
      (not (current_day day_2))
      (current_day day_3)
      (in_city split day_3)
      (visited_split)
    )
  )

  (:action fly_lyon_to_split_d3_d4
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (in_city lyon day_3)
      (direct lyon split)
      (not (in_city split day_4))
    )
    :effect (and
      (not (current_day day_3))
      (current_day day_4)
      (in_city split day_4)
      (visited_split)
    )
  )

  (:action fly_lyon_to_split_d4_d5
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (in_city lyon day_4)
      (direct lyon split)
      (not (in_city split day_5))
    )
    :effect (and
      (not (current_day day_4))
      (current_day day_5)
      (in_city split day_5)
      (visited_split)
    )
  )

  (:action fly_lyon_to_split_d5_d6
    :parameters ()
    :precondition (and
      (current_day day_5)
      (next_day day_5 day_6)
      (in_city lyon day_5)
      (direct lyon split)
      (not (in_city split day_6))
    )
    :effect (and
      (not (current_day day_5))
      (current_day day_6)
      (in_city split day_6)
      (visited_split)
    )
  )

  (:action fly_lyon_to_split_d6_d7
    :parameters ()
    :precondition (and
      (current_day day_6)
      (next_day day_6 day_7)
      (in_city lyon day_6)
      (direct lyon split)
      (not (in_city split day_7))
    )
    :effect (and
      (not (current_day day_6))
      (current_day day_7)
      (in_city split day_7)
      (visited_split)
    )
  )

  (:action fly_lyon_to_split_d7_d8
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (in_city lyon day_7)
      (direct lyon split)
      (not (in_city split day_8))
    )
    :effect (and
      (not (current_day day_7))
      (current_day day_8)
      (in_city split day_8)
      (visited_split)
    )
  )

  (:action fly_lyon_to_split_d8_d9
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (in_city lyon day_8)
      (direct lyon split)
      (not (in_city split day_9))
    )
    :effect (and
      (not (current_day day_8))
      (current_day day_9)
      (in_city split day_9)
      (visited_split)
    )
  )

  (:action fly_lyon_to_split_d9_d10
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (in_city lyon day_9)
      (direct lyon split)
      (not (in_city split day_10))
    )
    :effect (and
      (not (current_day day_9))
      (current_day day_10)
      (in_city split day_10)
      (visited_split)
    )
  )

  (:action fly_split_to_lyon_d1_d2
    :parameters ()
    :precondition (and
      (current_day day_1)
      (next_day day_1 day_2)
      (in_city split day_1)
      (direct split lyon)
      (not (in_city lyon day_2))
    )
    :effect (and
      (not (current_day day_1))
      (current_day day_2)
      (in_city lyon day_2)
      (visited_lyon)
    )
  )

  (:action fly_split_to_lyon_d2_d3
    :parameters ()
    :precondition (and
      (current_day day_2)
      (next_day day_2 day_3)
      (in_city split day_2)
      (direct split lyon)
      (not (in_city lyon day_3))
    )
    :effect (and
      (not (current_day day_2))
      (current_day day_3)
      (in_city lyon day_3)
      (visited_lyon)
    )
  )

  (:action fly_split_to_lyon_d3_d4
    :parameters ()
    :precondition (and
      (current_day day_3)
      (next_day day_3 day_4)
      (in_city split day_3)
      (direct split lyon)
      (not (in_city lyon day_4))
    )
    :effect (and
      (not (current_day day_3))
      (current_day day_4)
      (in_city lyon day_4)
      (visited_lyon)
    )
  )

  (:action fly_split_to_lyon_d4_d5
    :parameters ()
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (in_city split day_4)
      (direct split lyon)
      (not (in_city lyon day_5))
    )
    :effect (and
      (not (current_day day_4))
      (current_day day_5)
      (in_city lyon day_5)
      (visited_lyon)
    )
  )

  (:action fly_split_to_lyon_d5_d6
    :parameters ()
    :precondition (and
      (current_day day_5)
      (next_day day_5 day_6)
      (in_city split day_5)
      (direct split lyon)
      (not (in_city lyon day_6))
    )
    :effect (and
      (not (current_day day_5))
      (current_day day_6)
      (in_city lyon day_6)
      (visited_lyon)
    )
  )

  (:action fly_split_to_lyon_d6_d7
    :parameters ()
    :precondition (and
      (current_day day_6)
      (next_day day_6 day_7)
      (in_city split day_6)
      (direct split lyon)
      (not (in_city lyon day_7))
    )
    :effect (and
      (not (current_day day_6))
      (current_day day_7)
      (in_city lyon day_7)
      (visited_lyon)
    )
  )

  (:action fly_split_to_lyon_d7_d8
    :parameters ()
    :precondition (and
      (current_day day_7)
      (next_day day_7 day_8)
      (in_city split day_7)
      (direct split lyon)
      (not (in_city lyon day_8))
    )
    :effect (and
      (not (current_day day_7))
      (current_day day_8)
      (in_city lyon day_8)
      (visited_lyon)
    )
  )

  (:action fly_split_to_lyon_d8_d9
    :parameters ()
    :precondition (and
      (current_day day_8)
      (next_day day_8 day_9)
      (in_city split day_8)
      (direct split lyon)
      (not (in_city lyon day_9))
    )
    :effect (and
      (not (current_day day_8))
      (current_day day_9)
      (in_city lyon day_9)
      (visited_lyon)
    )
  )

  (:action fly_split_to_lyon_d9_d10
    :parameters ()
    :precondition (and
      (current_day day_9)
      (next_day day_9 day_10)
      (in_city split day_9)
      (direct split lyon)
      (not (in_city lyon day_10))
    )
    :effect (and
      (not (current_day day_9))
      (current_day day_10)
      (in_city lyon day_10)
      (visited_lyon)
    )
  )
)