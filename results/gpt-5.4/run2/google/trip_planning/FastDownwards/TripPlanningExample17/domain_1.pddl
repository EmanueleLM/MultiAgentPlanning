(define (domain european_trip_11_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (at ?d - day ?c - city)
    (unassigned ?d - day)
    (cursor ?d - day)
    (cp_count_0)
    (cp_count_1)
    (cp_count_2)
    (cp_count_3)
    (cp_count_4)
    (cp_count_5)
    (vi_count_0)
    (vi_count_1)
    (vi_count_2)
    (vi_count_3)
    (vi_count_4)
    (ly_count_0)
    (ly_count_1)
    (ly_count_2)
    (ly_count_3)
    (ly_count_4)
  )

  (:action assign_day_1_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_1)
      (unassigned day_1)
      (cp_count_0)
    )
    :effect (and
      (not (cursor day_1))
      (cursor day_2)
      (not (unassigned day_1))
      (at day_1 copenhagen)
      (not (cp_count_0))
      (cp_count_1)
    )
  )

  (:action assign_day_2_copenhagen_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_2)
      (unassigned day_2)
      (at day_1 copenhagen)
      (cp_count_1)
    )
    :effect (and
      (not (cursor day_2))
      (cursor day_3)
      (not (unassigned day_2))
      (at day_2 copenhagen)
      (not (cp_count_1))
      (cp_count_2)
    )
  )

  (:action assign_day_2_vienna_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_2)
      (unassigned day_2)
      (at day_1 copenhagen)
      (direct copenhagen vienna)
      (vi_count_0)
    )
    :effect (and
      (not (cursor day_2))
      (cursor day_3)
      (not (unassigned day_2))
      (at day_2 vienna)
      (not (vi_count_0))
      (vi_count_1)
    )
  )

  (:action assign_day_3_copenhagen_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_3)
      (unassigned day_3)
      (at day_2 copenhagen)
      (cp_count_2)
    )
    :effect (and
      (not (cursor day_3))
      (cursor day_4)
      (not (unassigned day_3))
      (at day_3 copenhagen)
      (not (cp_count_2))
      (cp_count_3)
    )
  )

  (:action assign_day_3_vienna_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_3)
      (unassigned day_3)
      (at day_2 copenhagen)
      (direct copenhagen vienna)
      (vi_count_1)
    )
    :effect (and
      (not (cursor day_3))
      (cursor day_4)
      (not (unassigned day_3))
      (at day_3 vienna)
      (not (vi_count_1))
      (vi_count_2)
    )
  )

  (:action assign_day_3_vienna_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_3)
      (unassigned day_3)
      (at day_2 vienna)
      (vi_count_1)
    )
    :effect (and
      (not (cursor day_3))
      (cursor day_4)
      (not (unassigned day_3))
      (at day_3 vienna)
      (not (vi_count_1))
      (vi_count_2)
    )
  )

  (:action assign_day_3_copenhagen_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_3)
      (unassigned day_3)
      (at day_2 vienna)
      (direct vienna copenhagen)
      (cp_count_1)
    )
    :effect (and
      (not (cursor day_3))
      (cursor day_4)
      (not (unassigned day_3))
      (at day_3 copenhagen)
      (not (cp_count_1))
      (cp_count_2)
    )
  )

  (:action assign_day_3_lyon_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_3)
      (unassigned day_3)
      (at day_2 vienna)
      (direct vienna lyon)
      (ly_count_0)
    )
    :effect (and
      (not (cursor day_3))
      (cursor day_4)
      (not (unassigned day_3))
      (at day_3 lyon)
      (not (ly_count_0))
      (ly_count_1)
    )
  )

  (:action assign_day_4_copenhagen_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_4)
      (unassigned day_4)
      (at day_3 copenhagen)
      (cp_count_3)
    )
    :effect (and
      (not (cursor day_4))
      (cursor day_5)
      (not (unassigned day_4))
      (at day_4 copenhagen)
      (not (cp_count_3))
      (cp_count_4)
    )
  )

  (:action assign_day_4_vienna_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_4)
      (unassigned day_4)
      (at day_3 copenhagen)
      (direct copenhagen vienna)
      (vi_count_0)
    )
    :effect (and
      (not (cursor day_4))
      (cursor day_5)
      (not (unassigned day_4))
      (at day_4 vienna)
      (not (vi_count_0))
      (vi_count_1)
    )
  )

  (:action assign_day_4_vienna_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_4)
      (unassigned day_4)
      (at day_3 vienna)
      (vi_count_2)
    )
    :effect (and
      (not (cursor day_4))
      (cursor day_5)
      (not (unassigned day_4))
      (at day_4 vienna)
      (not (vi_count_2))
      (vi_count_3)
    )
  )

  (:action assign_day_4_copenhagen_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_4)
      (unassigned day_4)
      (at day_3 vienna)
      (direct vienna copenhagen)
      (cp_count_2)
    )
    :effect (and
      (not (cursor day_4))
      (cursor day_5)
      (not (unassigned day_4))
      (at day_4 copenhagen)
      (not (cp_count_2))
      (cp_count_3)
    )
  )

  (:action assign_day_4_lyon_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_4)
      (unassigned day_4)
      (at day_3 vienna)
      (direct vienna lyon)
      (ly_count_0)
    )
    :effect (and
      (not (cursor day_4))
      (cursor day_5)
      (not (unassigned day_4))
      (at day_4 lyon)
      (not (ly_count_0))
      (ly_count_1)
    )
  )

  (:action assign_day_4_lyon_from_lyon
    :parameters ()
    :precondition (and
      (cursor day_4)
      (unassigned day_4)
      (at day_3 lyon)
      (ly_count_1)
    )
    :effect (and
      (not (cursor day_4))
      (cursor day_5)
      (not (unassigned day_4))
      (at day_4 lyon)
      (not (ly_count_1))
      (ly_count_2)
    )
  )

  (:action assign_day_4_vienna_from_lyon
    :parameters ()
    :precondition (and
      (cursor day_4)
      (unassigned day_4)
      (at day_3 lyon)
      (direct lyon vienna)
      (vi_count_1)
    )
    :effect (and
      (not (cursor day_4))
      (cursor day_5)
      (not (unassigned day_4))
      (at day_4 vienna)
      (not (vi_count_1))
      (vi_count_2)
    )
  )

  (:action assign_day_5_copenhagen_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_5)
      (unassigned day_5)
      (at day_4 copenhagen)
      (cp_count_4)
    )
    :effect (and
      (not (cursor day_5))
      (cursor day_6)
      (not (unassigned day_5))
      (at day_5 copenhagen)
      (not (cp_count_4))
      (cp_count_5)
    )
  )

  (:action assign_day_5_copenhagen_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_5)
      (unassigned day_5)
      (at day_4 vienna)
      (direct vienna copenhagen)
      (cp_count_3)
    )
    :effect (and
      (not (cursor day_5))
      (cursor day_6)
      (not (unassigned day_5))
      (at day_5 copenhagen)
      (not (cp_count_3))
      (cp_count_4)
    )
  )

  (:action assign_day_5_vienna_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_5)
      (unassigned day_5)
      (at day_4 vienna)
      (vi_count_3)
    )
    :effect (and
      (not (cursor day_5))
      (cursor day_6)
      (not (unassigned day_5))
      (at day_5 vienna)
      (not (vi_count_3))
      (vi_count_4)
    )
  )

  (:action assign_day_5_lyon_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_5)
      (unassigned day_5)
      (at day_4 vienna)
      (direct vienna lyon)
      (ly_count_1)
    )
    :effect (and
      (not (cursor day_5))
      (cursor day_6)
      (not (unassigned day_5))
      (at day_5 lyon)
      (not (ly_count_1))
      (ly_count_2)
    )
  )

  (:action assign_day_5_lyon_from_lyon
    :parameters ()
    :precondition (and
      (cursor day_5)
      (unassigned day_5)
      (at day_4 lyon)
      (ly_count_2)
    )
    :effect (and
      (not (cursor day_5))
      (cursor day_6)
      (not (unassigned day_5))
      (at day_5 lyon)
      (not (ly_count_2))
      (ly_count_3)
    )
  )

  (:action assign_day_5_vienna_from_lyon
    :parameters ()
    :precondition (and
      (cursor day_5)
      (unassigned day_5)
      (at day_4 lyon)
      (direct lyon vienna)
      (vi_count_2)
    )
    :effect (and
      (not (cursor day_5))
      (cursor day_6)
      (not (unassigned day_5))
      (at day_5 vienna)
      (not (vi_count_2))
      (vi_count_3)
    )
  )

  (:action assign_day_6_copenhagen_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_6)
      (unassigned day_6)
      (at day_5 copenhagen)
      (cp_count_5)
    )
    :effect (and
      (not (cursor day_6))
      (cursor day_7)
      (not (unassigned day_6))
      (at day_6 copenhagen)
      (cp_count_5)
    )
  )

  (:action assign_day_6_vienna_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_6)
      (unassigned day_6)
      (at day_5 copenhagen)
      (direct copenhagen vienna)
      (vi_count_3)
    )
    :effect (and
      (not (cursor day_6))
      (cursor day_7)
      (not (unassigned day_6))
      (at day_6 vienna)
      (not (vi_count_3))
      (vi_count_4)
    )
  )

  (:action assign_day_6_vienna_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_6)
      (unassigned day_6)
      (at day_5 vienna)
      (vi_count_4)
    )
    :effect (and
      (not (cursor day_6))
      (cursor day_7)
      (not (unassigned day_6))
      (at day_6 vienna)
      (vi_count_4)
    )
  )

  (:action assign_day_6_lyon_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_6)
      (unassigned day_6)
      (at day_5 vienna)
      (direct vienna lyon)
      (ly_count_2)
    )
    :effect (and
      (not (cursor day_6))
      (cursor day_7)
      (not (unassigned day_6))
      (at day_6 lyon)
      (not (ly_count_2))
      (ly_count_3)
    )
  )

  (:action assign_day_6_lyon_from_lyon
    :parameters ()
    :precondition (and
      (cursor day_6)
      (unassigned day_6)
      (at day_5 lyon)
      (ly_count_3)
    )
    :effect (and
      (not (cursor day_6))
      (cursor day_7)
      (not (unassigned day_6))
      (at day_6 lyon)
      (not (ly_count_3))
      (ly_count_4)
    )
  )

  (:action assign_day_6_vienna_from_lyon
    :parameters ()
    :precondition (and
      (cursor day_6)
      (unassigned day_6)
      (at day_5 lyon)
      (direct lyon vienna)
      (vi_count_3)
    )
    :effect (and
      (not (cursor day_6))
      (cursor day_7)
      (not (unassigned day_6))
      (at day_6 vienna)
      (not (vi_count_3))
      (vi_count_4)
    )
  )

  (:action assign_day_7_copenhagen_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_7)
      (unassigned day_7)
      (at day_6 copenhagen)
      (cp_count_5)
    )
    :effect (and
      (not (cursor day_7))
      (cursor day_8)
      (not (unassigned day_7))
      (at day_7 copenhagen)
      (cp_count_5)
    )
  )

  (:action assign_day_7_vienna_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_7)
      (unassigned day_7)
      (at day_6 copenhagen)
      (direct copenhagen vienna)
      (vi_count_4)
    )
    :effect (and
      (not (cursor day_7))
      (cursor day_8)
      (not (unassigned day_7))
      (at day_7 vienna)
      (vi_count_4)
    )
  )

  (:action assign_day_7_vienna_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_7)
      (unassigned day_7)
      (at day_6 vienna)
      (vi_count_4)
    )
    :effect (and
      (not (cursor day_7))
      (cursor day_8)
      (not (unassigned day_7))
      (at day_7 vienna)
      (vi_count_4)
    )
  )

  (:action assign_day_7_lyon_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_7)
      (unassigned day_7)
      (at day_6 vienna)
      (direct vienna lyon)
      (ly_count_3)
    )
    :effect (and
      (not (cursor day_7))
      (cursor day_8)
      (not (unassigned day_7))
      (at day_7 lyon)
      (not (ly_count_3))
      (ly_count_4)
    )
  )

  (:action assign_day_7_lyon_from_lyon
    :parameters ()
    :precondition (and
      (cursor day_7)
      (unassigned day_7)
      (at day_6 lyon)
      (ly_count_4)
    )
    :effect (and
      (not (cursor day_7))
      (cursor day_8)
      (not (unassigned day_7))
      (at day_7 lyon)
      (ly_count_4)
    )
  )

  (:action assign_day_7_vienna_from_lyon
    :parameters ()
    :precondition (and
      (cursor day_7)
      (unassigned day_7)
      (at day_6 lyon)
      (direct lyon vienna)
      (vi_count_4)
    )
    :effect (and
      (not (cursor day_7))
      (cursor day_8)
      (not (unassigned day_7))
      (at day_7 vienna)
      (vi_count_4)
    )
  )

  (:action assign_day_8_copenhagen_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_8)
      (unassigned day_8)
      (at day_7 copenhagen)
      (cp_count_5)
    )
    :effect (and
      (not (cursor day_8))
      (cursor day_9)
      (not (unassigned day_8))
      (at day_8 copenhagen)
      (cp_count_5)
    )
  )

  (:action assign_day_8_vienna_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_8)
      (unassigned day_8)
      (at day_7 copenhagen)
      (direct copenhagen vienna)
      (vi_count_4)
    )
    :effect (and
      (not (cursor day_8))
      (cursor day_9)
      (not (unassigned day_8))
      (at day_8 vienna)
      (vi_count_4)
    )
  )

  (:action assign_day_8_vienna_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_8)
      (unassigned day_8)
      (at day_7 vienna)
      (vi_count_4)
    )
    :effect (and
      (not (cursor day_8))
      (cursor day_9)
      (not (unassigned day_8))
      (at day_8 vienna)
      (vi_count_4)
    )
  )

  (:action assign_day_8_lyon_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_8)
      (unassigned day_8)
      (at day_7 vienna)
      (direct vienna lyon)
      (ly_count_4)
    )
    :effect (and
      (not (cursor day_8))
      (cursor day_9)
      (not (unassigned day_8))
      (at day_8 lyon)
      (ly_count_4)
    )
  )

  (:action assign_day_8_lyon_from_lyon
    :parameters ()
    :precondition (and
      (cursor day_8)
      (unassigned day_8)
      (at day_7 lyon)
      (ly_count_4)
    )
    :effect (and
      (not (cursor day_8))
      (cursor day_9)
      (not (unassigned day_8))
      (at day_8 lyon)
      (ly_count_4)
    )
  )

  (:action assign_day_8_vienna_from_lyon
    :parameters ()
    :precondition (and
      (cursor day_8)
      (unassigned day_8)
      (at day_7 lyon)
      (direct lyon vienna)
      (vi_count_4)
    )
    :effect (and
      (not (cursor day_8))
      (cursor day_9)
      (not (unassigned day_8))
      (at day_8 vienna)
      (vi_count_4)
    )
  )

  (:action assign_day_9_copenhagen_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_9)
      (unassigned day_9)
      (at day_8 copenhagen)
      (cp_count_5)
    )
    :effect (and
      (not (cursor day_9))
      (cursor day_10)
      (not (unassigned day_9))
      (at day_9 copenhagen)
      (cp_count_5)
    )
  )

  (:action assign_day_9_vienna_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_9)
      (unassigned day_9)
      (at day_8 copenhagen)
      (direct copenhagen vienna)
      (vi_count_4)
    )
    :effect (and
      (not (cursor day_9))
      (cursor day_10)
      (not (unassigned day_9))
      (at day_9 vienna)
      (vi_count_4)
    )
  )

  (:action assign_day_9_vienna_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_9)
      (unassigned day_9)
      (at day_8 vienna)
      (vi_count_4)
    )
    :effect (and
      (not (cursor day_9))
      (cursor day_10)
      (not (unassigned day_9))
      (at day_9 vienna)
      (vi_count_4)
    )
  )

  (:action assign_day_9_lyon_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_9)
      (unassigned day_9)
      (at day_8 vienna)
      (direct vienna lyon)
      (ly_count_4)
    )
    :effect (and
      (not (cursor day_9))
      (cursor day_10)
      (not (unassigned day_9))
      (at day_9 lyon)
      (ly_count_4)
    )
  )

  (:action assign_day_9_lyon_from_lyon
    :parameters ()
    :precondition (and
      (cursor day_9)
      (unassigned day_9)
      (at day_8 lyon)
      (ly_count_4)
    )
    :effect (and
      (not (cursor day_9))
      (cursor day_10)
      (not (unassigned day_9))
      (at day_9 lyon)
      (ly_count_4)
    )
  )

  (:action assign_day_9_vienna_from_lyon
    :parameters ()
    :precondition (and
      (cursor day_9)
      (unassigned day_9)
      (at day_8 lyon)
      (direct lyon vienna)
      (vi_count_4)
    )
    :effect (and
      (not (cursor day_9))
      (cursor day_10)
      (not (unassigned day_9))
      (at day_9 vienna)
      (vi_count_4)
    )
  )

  (:action assign_day_10_copenhagen_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_10)
      (unassigned day_10)
      (at day_9 copenhagen)
      (cp_count_5)
    )
    :effect (and
      (not (cursor day_10))
      (cursor day_11)
      (not (unassigned day_10))
      (at day_10 copenhagen)
      (cp_count_5)
    )
  )

  (:action assign_day_10_vienna_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_10)
      (unassigned day_10)
      (at day_9 copenhagen)
      (direct copenhagen vienna)
      (vi_count_4)
    )
    :effect (and
      (not (cursor day_10))
      (cursor day_11)
      (not (unassigned day_10))
      (at day_10 vienna)
      (vi_count_4)
    )
  )

  (:action assign_day_10_vienna_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_10)
      (unassigned day_10)
      (at day_9 vienna)
      (vi_count_4)
    )
    :effect (and
      (not (cursor day_10))
      (cursor day_11)
      (not (unassigned day_10))
      (at day_10 vienna)
      (vi_count_4)
    )
  )

  (:action assign_day_10_lyon_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_10)
      (unassigned day_10)
      (at day_9 vienna)
      (direct vienna lyon)
      (ly_count_4)
    )
    :effect (and
      (not (cursor day_10))
      (cursor day_11)
      (not (unassigned day_10))
      (at day_10 lyon)
      (ly_count_4)
    )
  )

  (:action assign_day_10_lyon_from_lyon
    :parameters ()
    :precondition (and
      (cursor day_10)
      (unassigned day_10)
      (at day_9 lyon)
      (ly_count_4)
    )
    :effect (and
      (not (cursor day_10))
      (cursor day_11)
      (not (unassigned day_10))
      (at day_10 lyon)
      (ly_count_4)
    )
  )

  (:action assign_day_10_vienna_from_lyon
    :parameters ()
    :precondition (and
      (cursor day_10)
      (unassigned day_10)
      (at day_9 lyon)
      (direct lyon vienna)
      (vi_count_4)
    )
    :effect (and
      (not (cursor day_10))
      (cursor day_11)
      (not (unassigned day_10))
      (at day_10 vienna)
      (vi_count_4)
    )
  )

  (:action assign_day_11_copenhagen_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_11)
      (unassigned day_11)
      (at day_10 copenhagen)
      (cp_count_5)
    )
    :effect (and
      (not (cursor day_11))
      (not (unassigned day_11))
      (at day_11 copenhagen)
      (cp_count_5)
    )
  )

  (:action assign_day_11_vienna_from_copenhagen
    :parameters ()
    :precondition (and
      (cursor day_11)
      (unassigned day_11)
      (at day_10 copenhagen)
      (direct copenhagen vienna)
      (vi_count_4)
    )
    :effect (and
      (not (cursor day_11))
      (not (unassigned day_11))
      (at day_11 vienna)
      (vi_count_4)
    )
  )

  (:action assign_day_11_vienna_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_11)
      (unassigned day_11)
      (at day_10 vienna)
      (vi_count_4)
    )
    :effect (and
      (not (cursor day_11))
      (not (unassigned day_11))
      (at day_11 vienna)
      (vi_count_4)
    )
  )

  (:action assign_day_11_lyon_from_vienna
    :parameters ()
    :precondition (and
      (cursor day_11)
      (unassigned day_11)
      (at day_10 vienna)
      (direct vienna lyon)
      (ly_count_4)
    )
    :effect (and
      (not (cursor day_11))
      (not (unassigned day_11))
      (at day_11 lyon)
      (ly_count_4)
    )
  )

  (:action assign_day_11_lyon_from_lyon
    :parameters ()
    :precondition (and
      (cursor day_11)
      (unassigned day_11)
      (at day_10 lyon)
      (ly_count_4)
    )
    :effect (and
      (not (cursor day_11))
      (not (unassigned day_11))
      (at day_11 lyon)
      (ly_count_4)
    )
  )

  (:action assign_day_11_vienna_from_lyon
    :parameters ()
    :precondition (and
      (cursor day_11)
      (unassigned day_11)
      (at day_10 lyon)
      (direct lyon vienna)
      (vi_count_4)
    )
    :effect (and
      (not (cursor day_11))
      (not (unassigned day_11))
      (at day_11 vienna)
      (vi_count_4)
    )
  )
)