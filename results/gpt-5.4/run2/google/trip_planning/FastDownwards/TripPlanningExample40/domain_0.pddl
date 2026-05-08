(define (domain trip_europe_8_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler city day
  )

  (:predicates
    (at_day ?t - traveler ?c - city ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (current_day ?d - day)
    (assigned ?d - day)
    (wedding_satisfied)
    (oslo_count_0)
    (oslo_count_1)
    (oslo_count_2)
    (oslo_count_3)
    (oslo_count_4)
    (oslo_count_5)
    (oslo_count_6)
    (oslo_count_7)
    (oslo_count_8)
    (reykjavik_count_0)
    (reykjavik_count_1)
    (reykjavik_count_2)
    (reykjavik_count_3)
    (reykjavik_count_4)
    (reykjavik_count_5)
    (reykjavik_count_6)
    (reykjavik_count_7)
    (reykjavik_count_8)
    (manchester_count_0)
    (manchester_count_1)
    (manchester_count_2)
    (manchester_count_3)
    (manchester_count_4)
    (manchester_count_5)
    (manchester_count_6)
    (manchester_count_7)
    (manchester_count_8)
  )

  (:action choose_start_oslo
    :parameters (?t - traveler)
    :precondition (and
      (current_day day_1)
      (not (assigned day_1))
      (oslo_count_0)
      (reykjavik_count_0)
      (manchester_count_0)
    )
    :effect (and
      (at_day ?t oslo day_1)
      (assigned day_1)
      (oslo_count_1)
      (not (oslo_count_0))
    )
  )

  (:action choose_start_reykjavik
    :parameters (?t - traveler)
    :precondition (and
      (current_day day_1)
      (not (assigned day_1))
      (oslo_count_0)
      (reykjavik_count_0)
      (manchester_count_0)
    )
    :effect (and
      (at_day ?t reykjavik day_1)
      (assigned day_1)
      (reykjavik_count_1)
      (not (reykjavik_count_0))
    )
  )

  (:action choose_start_manchester
    :parameters (?t - traveler)
    :precondition (and
      (current_day day_1)
      (not (assigned day_1))
      (oslo_count_0)
      (reykjavik_count_0)
      (manchester_count_0)
    )
    :effect (and
      (at_day ?t manchester day_1)
      (assigned day_1)
      (manchester_count_1)
      (not (manchester_count_0))
      (wedding_satisfied)
    )
  )

  (:action stay_oslo_day_1_day_2
    :parameters (?t - traveler)
    :precondition (and
      (current_day day_1)
      (assigned day_1)
      (not (assigned day_2))
      (next_day day_1 day_2)
      (at_day ?t oslo day_1)
      (oslo_count_1)
    )
    :effect (and
      (at_day ?t oslo day_2)
      (assigned day_2)
      (current_day day_2)
      (not (current_day day_1))
      (oslo_count_2)
      (not (oslo_count_1))
    )
  )

  (:action fly_oslo_to_reykjavik_day_1_day_2
    :parameters (?t - traveler)
    :precondition (and
      (current_day day_1)
      (assigned day_1)
      (not (assigned day_2))
      (next_day day_1 day_2)
      (at_day ?t oslo day_1)
      (direct_flight oslo reykjavik)
      (reykjavik_count_0)
    )
    :effect (and
      (at_day ?t reykjavik day_2)
      (assigned day_2)
      (current_day day_2)
      (not (current_day day_1))
      (reykjavik_count_1)
      (not (reykjavik_count_0))
    )
  )

  (:action fly_oslo_to_manchester_day_1_day_2
    :parameters (?t - traveler)
    :precondition (and
      (current_day day_1)
      (assigned day_1)
      (not (assigned day_2))
      (next_day day_1 day_2)
      (at_day ?t oslo day_1)
      (direct_flight oslo manchester)
      (manchester_count_0)
    )
    :effect (and
      (at_day ?t manchester day_2)
      (assigned day_2)
      (current_day day_2)
      (not (current_day day_1))
      (manchester_count_1)
      (not (manchester_count_0))
      (wedding_satisfied)
    )
  )

  (:action stay_reykjavik_day_1_day_2
    :parameters (?t - traveler)
    :precondition (and
      (current_day day_1)
      (assigned day_1)
      (not (assigned day_2))
      (next_day day_1 day_2)
      (at_day ?t reykjavik day_1)
      (reykjavik_count_1)
    )
    :effect (and
      (at_day ?t reykjavik day_2)
      (assigned day_2)
      (current_day day_2)
      (not (current_day day_1))
      (reykjavik_count_2)
      (not (reykjavik_count_1))
    )
  )

  (:action fly_reykjavik_to_oslo_day_1_day_2
    :parameters (?t - traveler)
    :precondition (and
      (current_day day_1)
      (assigned day_1)
      (not (assigned day_2))
      (next_day day_1 day_2)
      (at_day ?t reykjavik day_1)
      (direct_flight reykjavik oslo)
      (oslo_count_0)
    )
    :effect (and
      (at_day ?t oslo day_2)
      (assigned day_2)
      (current_day day_2)
      (not (current_day day_1))
      (oslo_count_1)
      (not (oslo_count_0))
    )
  )

  (:action stay_manchester_day_1_day_2
    :parameters (?t - traveler)
    :precondition (and
      (current_day day_1)
      (assigned day_1)
      (not (assigned day_2))
      (next_day day_1 day_2)
      (at_day ?t manchester day_1)
      (manchester_count_1)
    )
    :effect (and
      (at_day ?t manchester day_2)
      (assigned day_2)
      (current_day day_2)
      (not (current_day day_1))
      (manchester_count_2)
      (not (manchester_count_1))
      (wedding_satisfied)
    )
  )

  (:action fly_manchester_to_oslo_day_1_day_2
    :parameters (?t - traveler)
    :precondition (and
      (current_day day_1)
      (assigned day_1)
      (not (assigned day_2))
      (next_day day_1 day_2)
      (at_day ?t manchester day_1)
      (direct_flight manchester oslo)
      (oslo_count_0)
    )
    :effect (and
      (at_day ?t oslo day_2)
      (assigned day_2)
      (current_day day_2)
      (not (current_day day_1))
      (oslo_count_1)
      (not (oslo_count_0))
    )
  )

  (:action stay_oslo_day_2_day_3
    :parameters (?t - traveler)
    :precondition (and (current_day day_2) (assigned day_2) (not (assigned day_3)) (next_day day_2 day_3) (at_day ?t oslo day_2) (oslo_count_2))
    :effect (and (at_day ?t oslo day_3) (assigned day_3) (current_day day_3) (not (current_day day_2)) (oslo_count_3) (not (oslo_count_2)))
  )

  (:action fly_oslo_to_reykjavik_day_2_day_3
    :parameters (?t - traveler)
    :precondition (and (current_day day_2) (assigned day_2) (not (assigned day_3)) (next_day day_2 day_3) (at_day ?t oslo day_2) (direct_flight oslo reykjavik) (reykjavik_count_1))
    :effect (and (at_day ?t reykjavik day_3) (assigned day_3) (current_day day_3) (not (current_day day_2)) (reykjavik_count_2) (not (reykjavik_count_1)))
  )

  (:action fly_oslo_to_manchester_day_2_day_3
    :parameters (?t - traveler)
    :precondition (and (current_day day_2) (assigned day_2) (not (assigned day_3)) (next_day day_2 day_3) (at_day ?t oslo day_2) (direct_flight oslo manchester) (manchester_count_1))
    :effect (and (at_day ?t manchester day_3) (assigned day_3) (current_day day_3) (not (current_day day_2)) (manchester_count_2) (not (manchester_count_1)))
  )

  (:action stay_reykjavik_day_2_day_3
    :parameters (?t - traveler)
    :precondition (and (current_day day_2) (assigned day_2) (not (assigned day_3)) (next_day day_2 day_3) (at_day ?t reykjavik day_2) (reykjavik_count_2))
    :effect (and (at_day ?t reykjavik day_3) (assigned day_3) (current_day day_3) (not (current_day day_2)) (reykjavik_count_3) (not (reykjavik_count_2)))
  )

  (:action fly_reykjavik_to_oslo_day_2_day_3
    :parameters (?t - traveler)
    :precondition (and (current_day day_2) (assigned day_2) (not (assigned day_3)) (next_day day_2 day_3) (at_day ?t reykjavik day_2) (direct_flight reykjavik oslo) (oslo_count_1))
    :effect (and (at_day ?t oslo day_3) (assigned day_3) (current_day day_3) (not (current_day day_2)) (oslo_count_2) (not (oslo_count_1)))
  )

  (:action stay_manchester_day_2_day_3
    :parameters (?t - traveler)
    :precondition (and (current_day day_2) (assigned day_2) (not (assigned day_3)) (next_day day_2 day_3) (at_day ?t manchester day_2) (manchester_count_2))
    :effect (and (at_day ?t manchester day_3) (assigned day_3) (current_day day_3) (not (current_day day_2)) (manchester_count_3) (not (manchester_count_2)))
  )

  (:action fly_manchester_to_oslo_day_2_day_3
    :parameters (?t - traveler)
    :precondition (and (current_day day_2) (assigned day_2) (not (assigned day_3)) (next_day day_2 day_3) (at_day ?t manchester day_2) (direct_flight manchester oslo) (oslo_count_1))
    :effect (and (at_day ?t oslo day_3) (assigned day_3) (current_day day_3) (not (current_day day_2)) (oslo_count_2) (not (oslo_count_1)))
  )

  (:action stay_oslo_day_3_day_4
    :parameters (?t - traveler)
    :precondition (and (current_day day_3) (assigned day_3) (not (assigned day_4)) (next_day day_3 day_4) (at_day ?t oslo day_3) (oslo_count_3))
    :effect (and (at_day ?t oslo day_4) (assigned day_4) (current_day day_4) (not (current_day day_3)) (oslo_count_4) (not (oslo_count_3)))
  )

  (:action fly_oslo_to_reykjavik_day_3_day_4
    :parameters (?t - traveler)
    :precondition (and (current_day day_3) (assigned day_3) (not (assigned day_4)) (next_day day_3 day_4) (at_day ?t oslo day_3) (direct_flight oslo reykjavik) (reykjavik_count_2))
    :effect (and (at_day ?t reykjavik day_4) (assigned day_4) (current_day day_4) (not (current_day day_3)) (reykjavik_count_3) (not (reykjavik_count_2)))
  )

  (:action fly_oslo_to_manchester_day_3_day_4
    :parameters (?t - traveler)
    :precondition (and (current_day day_3) (assigned day_3) (not (assigned day_4)) (next_day day_3 day_4) (at_day ?t oslo day_3) (direct_flight oslo manchester) (manchester_count_2))
    :effect (and (at_day ?t manchester day_4) (assigned day_4) (current_day day_4) (not (current_day day_3)) (manchester_count_3) (not (manchester_count_2)))
  )

  (:action stay_reykjavik_day_3_day_4
    :parameters (?t - traveler)
    :precondition (and (current_day day_3) (assigned day_3) (not (assigned day_4)) (next_day day_3 day_4) (at_day ?t reykjavik day_3) (reykjavik_count_3))
    :effect (and (at_day ?t reykjavik day_4) (assigned day_4) (current_day day_4) (not (current_day day_3)) (reykjavik_count_4) (not (reykjavik_count_3)))
  )

  (:action fly_reykjavik_to_oslo_day_3_day_4
    :parameters (?t - traveler)
    :precondition (and (current_day day_3) (assigned day_3) (not (assigned day_4)) (next_day day_3 day_4) (at_day ?t reykjavik day_3) (direct_flight reykjavik oslo) (oslo_count_2))
    :effect (and (at_day ?t oslo day_4) (assigned day_4) (current_day day_4) (not (current_day day_3)) (oslo_count_3) (not (oslo_count_2)))
  )

  (:action stay_manchester_day_3_day_4
    :parameters (?t - traveler)
    :precondition (and (current_day day_3) (assigned day_3) (not (assigned day_4)) (next_day day_3 day_4) (at_day ?t manchester day_3) (manchester_count_3))
    :effect (and (at_day ?t manchester day_4) (assigned day_4) (current_day day_4) (not (current_day day_3)) (manchester_count_4) (not (manchester_count_3)))
  )

  (:action fly_manchester_to_oslo_day_3_day_4
    :parameters (?t - traveler)
    :precondition (and (current_day day_3) (assigned day_3) (not (assigned day_4)) (next_day day_3 day_4) (at_day ?t manchester day_3) (direct_flight manchester oslo) (oslo_count_2))
    :effect (and (at_day ?t oslo day_4) (assigned day_4) (current_day day_4) (not (current_day day_3)) (oslo_count_3) (not (oslo_count_2)))
  )

  (:action stay_oslo_day_4_day_5
    :parameters (?t - traveler)
    :precondition (and (current_day day_4) (assigned day_4) (not (assigned day_5)) (next_day day_4 day_5) (at_day ?t oslo day_4) (oslo_count_4))
    :effect (and (at_day ?t oslo day_5) (assigned day_5) (current_day day_5) (not (current_day day_4)) (oslo_count_5) (not (oslo_count_4)))
  )

  (:action fly_oslo_to_reykjavik_day_4_day_5
    :parameters (?t - traveler)
    :precondition (and (current_day day_4) (assigned day_4) (not (assigned day_5)) (next_day day_4 day_5) (at_day ?t oslo day_4) (direct_flight oslo reykjavik) (reykjavik_count_3))
    :effect (and (at_day ?t reykjavik day_5) (assigned day_5) (current_day day_5) (not (current_day day_4)) (reykjavik_count_4) (not (reykjavik_count_3)))
  )

  (:action fly_oslo_to_manchester_day_4_day_5
    :parameters (?t - traveler)
    :precondition (and (current_day day_4) (assigned day_4) (not (assigned day_5)) (next_day day_4 day_5) (at_day ?t oslo day_4) (direct_flight oslo manchester) (manchester_count_3))
    :effect (and (at_day ?t manchester day_5) (assigned day_5) (current_day day_5) (not (current_day day_4)) (manchester_count_4) (not (manchester_count_3)))
  )

  (:action stay_reykjavik_day_4_day_5
    :parameters (?t - traveler)
    :precondition (and (current_day day_4) (assigned day_4) (not (assigned day_5)) (next_day day_4 day_5) (at_day ?t reykjavik day_4) (reykjavik_count_4))
    :effect (and (at_day ?t reykjavik day_5) (assigned day_5) (current_day day_5) (not (current_day day_4)) (reykjavik_count_5) (not (reykjavik_count_4)))
  )

  (:action fly_reykjavik_to_oslo_day_4_day_5
    :parameters (?t - traveler)
    :precondition (and (current_day day_4) (assigned day_4) (not (assigned day_5)) (next_day day_4 day_5) (at_day ?t reykjavik day_4) (direct_flight reykjavik oslo) (oslo_count_3))
    :effect (and (at_day ?t oslo day_5) (assigned day_5) (current_day day_5) (not (current_day day_4)) (oslo_count_4) (not (oslo_count_3)))
  )

  (:action stay_manchester_day_4_day_5
    :parameters (?t - traveler)
    :precondition (and (current_day day_4) (assigned day_4) (not (assigned day_5)) (next_day day_4 day_5) (at_day ?t manchester day_4) (manchester_count_4))
    :effect (and (at_day ?t manchester day_5) (assigned day_5) (current_day day_5) (not (current_day day_4)) (manchester_count_5) (not (manchester_count_4)))
  )

  (:action fly_manchester_to_oslo_day_4_day_5
    :parameters (?t - traveler)
    :precondition (and (current_day day_4) (assigned day_4) (not (assigned day_5)) (next_day day_4 day_5) (at_day ?t manchester day_4) (direct_flight manchester oslo) (oslo_count_3))
    :effect (and (at_day ?t oslo day_5) (assigned day_5) (current_day day_5) (not (current_day day_4)) (oslo_count_4) (not (oslo_count_3)))
  )

  (:action stay_oslo_day_5_day_6
    :parameters (?t - traveler)
    :precondition (and (current_day day_5) (assigned day_5) (not (assigned day_6)) (next_day day_5 day_6) (at_day ?t oslo day_5) (oslo_count_5))
    :effect (and (at_day ?t oslo day_6) (assigned day_6) (current_day day_6) (not (current_day day_5)) (oslo_count_6) (not (oslo_count_5)))
  )

  (:action fly_oslo_to_reykjavik_day_5_day_6
    :parameters (?t - traveler)
    :precondition (and (current_day day_5) (assigned day_5) (not (assigned day_6)) (next_day day_5 day_6) (at_day ?t oslo day_5) (direct_flight oslo reykjavik) (reykjavik_count_4))
    :effect (and (at_day ?t reykjavik day_6) (assigned day_6) (current_day day_6) (not (current_day day_5)) (reykjavik_count_5) (not (reykjavik_count_4)))
  )

  (:action fly_oslo_to_manchester_day_5_day_6
    :parameters (?t - traveler)
    :precondition (and (current_day day_5) (assigned day_5) (not (assigned day_6)) (next_day day_5 day_6) (at_day ?t oslo day_5) (direct_flight oslo manchester) (manchester_count_4))
    :effect (and (at_day ?t manchester day_6) (assigned day_6) (current_day day_6) (not (current_day day_5)) (manchester_count_5) (not (manchester_count_4)))
  )

  (:action stay_reykjavik_day_5_day_6
    :parameters (?t - traveler)
    :precondition (and (current_day day_5) (assigned day_5) (not (assigned day_6)) (next_day day_5 day_6) (at_day ?t reykjavik day_5) (reykjavik_count_5))
    :effect (and (at_day ?t reykjavik day_6) (assigned day_6) (current_day day_6) (not (current_day day_5)) (reykjavik_count_6) (not (reykjavik_count_5)))
  )

  (:action fly_reykjavik_to_oslo_day_5_day_6
    :parameters (?t - traveler)
    :precondition (and (current_day day_5) (assigned day_5) (not (assigned day_6)) (next_day day_5 day_6) (at_day ?t reykjavik day_5) (direct_flight reykjavik oslo) (oslo_count_4))
    :effect (and (at_day ?t oslo day_6) (assigned day_6) (current_day day_6) (not (current_day day_5)) (oslo_count_5) (not (oslo_count_4)))
  )

  (:action stay_manchester_day_5_day_6
    :parameters (?t - traveler)
    :precondition (and (current_day day_5) (assigned day_5) (not (assigned day_6)) (next_day day_5 day_6) (at_day ?t manchester day_5) (manchester_count_5))
    :effect (and (at_day ?t manchester day_6) (assigned day_6) (current_day day_6) (not (current_day day_5)) (manchester_count_6) (not (manchester_count_5)))
  )

  (:action fly_manchester_to_oslo_day_5_day_6
    :parameters (?t - traveler)
    :precondition (and (current_day day_5) (assigned day_5) (not (assigned day_6)) (next_day day_5 day_6) (at_day ?t manchester day_5) (direct_flight manchester oslo) (oslo_count_4))
    :effect (and (at_day ?t oslo day_6) (assigned day_6) (current_day day_6) (not (current_day day_5)) (oslo_count_5) (not (oslo_count_4)))
  )

  (:action stay_oslo_day_6_day_7
    :parameters (?t - traveler)
    :precondition (and (current_day day_6) (assigned day_6) (not (assigned day_7)) (next_day day_6 day_7) (at_day ?t oslo day_6) (oslo_count_6))
    :effect (and (at_day ?t oslo day_7) (assigned day_7) (current_day day_7) (not (current_day day_6)) (oslo_count_7) (not (oslo_count_6)))
  )

  (:action fly_oslo_to_reykjavik_day_6_day_7
    :parameters (?t - traveler)
    :precondition (and (current_day day_6) (assigned day_6) (not (assigned day_7)) (next_day day_6 day_7) (at_day ?t oslo day_6) (direct_flight oslo reykjavik) (reykjavik_count_5))
    :effect (and (at_day ?t reykjavik day_7) (assigned day_7) (current_day day_7) (not (current_day day_6)) (reykjavik_count_6) (not (reykjavik_count_5)))
  )

  (:action fly_oslo_to_manchester_day_6_day_7
    :parameters (?t - traveler)
    :precondition (and (current_day day_6) (assigned day_6) (not (assigned day_7)) (next_day day_6 day_7) (at_day ?t oslo day_6) (direct_flight oslo manchester) (manchester_count_5))
    :effect (and (at_day ?t manchester day_7) (assigned day_7) (current_day day_7) (not (current_day day_6)) (manchester_count_6) (not (manchester_count_5)))
  )

  (:action stay_reykjavik_day_6_day_7
    :parameters (?t - traveler)
    :precondition (and (current_day day_6) (assigned day_6) (not (assigned day_7)) (next_day day_6 day_7) (at_day ?t reykjavik day_6) (reykjavik_count_6))
    :effect (and (at_day ?t reykjavik day_7) (assigned day_7) (current_day day_7) (not (current_day day_6)) (reykjavik_count_7) (not (reykjavik_count_6)))
  )

  (:action fly_reykjavik_to_oslo_day_6_day_7
    :parameters (?t - traveler)
    :precondition (and (current_day day_6) (assigned day_6) (not (assigned day_7)) (next_day day_6 day_7) (at_day ?t reykjavik day_6) (direct_flight reykjavik oslo) (oslo_count_5))
    :effect (and (at_day ?t oslo day_7) (assigned day_7) (current_day day_7) (not (current_day day_6)) (oslo_count_6) (not (oslo_count_5)))
  )

  (:action stay_manchester_day_6_day_7
    :parameters (?t - traveler)
    :precondition (and (current_day day_6) (assigned day_6) (not (assigned day_7)) (next_day day_6 day_7) (at_day ?t manchester day_6) (manchester_count_6))
    :effect (and (at_day ?t manchester day_7) (assigned day_7) (current_day day_7) (not (current_day day_6)) (manchester_count_7) (not (manchester_count_6)))
  )

  (:action fly_manchester_to_oslo_day_6_day_7
    :parameters (?t - traveler)
    :precondition (and (current_day day_6) (assigned day_6) (not (assigned day_7)) (next_day day_6 day_7) (at_day ?t manchester day_6) (direct_flight manchester oslo) (oslo_count_5))
    :effect (and (at_day ?t oslo day_7) (assigned day_7) (current_day day_7) (not (current_day day_6)) (oslo_count_6) (not (oslo_count_5)))
  )

  (:action stay_oslo_day_7_day_8
    :parameters (?t - traveler)
    :precondition (and (current_day day_7) (assigned day_7) (not (assigned day_8)) (next_day day_7 day_8) (at_day ?t oslo day_7) (oslo_count_7))
    :effect (and (at_day ?t oslo day_8) (assigned day_8) (current_day day_8) (not (current_day day_7)) (oslo_count_8) (not (oslo_count_7)))
  )

  (:action fly_oslo_to_reykjavik_day_7_day_8
    :parameters (?t - traveler)
    :precondition (and (current_day day_7) (assigned day_7) (not (assigned day_8)) (next_day day_7 day_8) (at_day ?t oslo day_7) (direct_flight oslo reykjavik) (reykjavik_count_6))
    :effect (and (at_day ?t reykjavik day_8) (assigned day_8) (current_day day_8) (not (current_day day_7)) (reykjavik_count_7) (not (reykjavik_count_6)))
  )

  (:action fly_oslo_to_manchester_day_7_day_8
    :parameters (?t - traveler)
    :precondition (and (current_day day_7) (assigned day_7) (not (assigned day_8)) (next_day day_7 day_8) (at_day ?t oslo day_7) (direct_flight oslo manchester) (manchester_count_6))
    :effect (and (at_day ?t manchester day_8) (assigned day_8) (current_day day_8) (not (current_day day_7)) (manchester_count_7) (not (manchester_count_6)))
  )

  (:action stay_reykjavik_day_7_day_8
    :parameters (?t - traveler)
    :precondition (and (current_day day_7) (assigned day_7) (not (assigned day_8)) (next_day day_7 day_8) (at_day ?t reykjavik day_7) (reykjavik_count_7))
    :effect (and (at_day ?t reykjavik day_8) (assigned day_8) (current_day day_8) (not (current_day day_7)) (reykjavik_count_8) (not (reykjavik_count_7)))
  )

  (:action fly_reykjavik_to_oslo_day_7_day_8
    :parameters (?t - traveler)
    :precondition (and (current_day day_7) (assigned day_7) (not (assigned day_8)) (next_day day_7 day_8) (at_day ?t reykjavik day_7) (direct_flight reykjavik oslo) (oslo_count_6))
    :effect (and (at_day ?t oslo day_8) (assigned day_8) (current_day day_8) (not (current_day day_7)) (oslo_count_7) (not (oslo_count_6)))
  )

  (:action stay_manchester_day_7_day_8
    :parameters (?t - traveler)
    :precondition (and (current_day day_7) (assigned day_7) (not (assigned day_8)) (next_day day_7 day_8) (at_day ?t manchester day_7) (manchester_count_7))
    :effect (and (at_day ?t manchester day_8) (assigned day_8) (current_day day_8) (not (current_day day_7)) (manchester_count_8) (not (manchester_count_7)))
  )

  (:action fly_manchester_to_oslo_day_7_day_8
    :parameters (?t - traveler)
    :precondition (and (current_day day_7) (assigned day_7) (not (assigned day_8)) (next_day day_7 day_8) (at_day ?t manchester day_7) (direct_flight manchester oslo) (oslo_count_6))
    :effect (and (at_day ?t oslo day_8) (assigned day_8) (current_day day_8) (not (current_day day_7)) (oslo_count_7) (not (oslo_count_6)))
  )
)