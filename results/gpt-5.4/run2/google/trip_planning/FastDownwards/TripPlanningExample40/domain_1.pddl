(define (domain trip_europe_8_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler city day
  )

  (:predicates
    (at ?t - traveler ?c - city)
    (flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (visited ?d - day)
    (in_oslo ?d - day)
    (in_reykjavik ?d - day)
    (in_manchester ?d - day)
    (wedding_day ?d - day)
  )

  (:action choose_start_oslo
    :parameters (?t - traveler)
    :precondition (and
      (current day_1)
      (not (visited day_1))
    )
    :effect (and
      (at ?t oslo)
      (visited day_1)
      (in_oslo day_1)
    )
  )

  (:action choose_start_reykjavik
    :parameters (?t - traveler)
    :precondition (and
      (current day_1)
      (not (visited day_1))
    )
    :effect (and
      (at ?t reykjavik)
      (visited day_1)
      (in_reykjavik day_1)
    )
  )

  (:action choose_start_manchester
    :parameters (?t - traveler)
    :precondition (and
      (current day_1)
      (not (visited day_1))
    )
    :effect (and
      (at ?t manchester)
      (visited day_1)
      (in_manchester day_1)
    )
  )

  (:action stay_oslo_1_2
    :parameters (?t - traveler)
    :precondition (and
      (current day_1)
      (visited day_1)
      (not (visited day_2))
      (next day_1 day_2)
      (at ?t oslo)
    )
    :effect (and
      (visited day_2)
      (in_oslo day_2)
      (current day_2)
      (not (current day_1))
    )
  )

  (:action fly_oslo_reykjavik_1_2
    :parameters (?t - traveler)
    :precondition (and
      (current day_1)
      (visited day_1)
      (not (visited day_2))
      (next day_1 day_2)
      (at ?t oslo)
      (flight oslo reykjavik)
    )
    :effect (and
      (not (at ?t oslo))
      (at ?t reykjavik)
      (visited day_2)
      (in_reykjavik day_2)
      (current day_2)
      (not (current day_1))
    )
  )

  (:action fly_oslo_manchester_1_2
    :parameters (?t - traveler)
    :precondition (and
      (current day_1)
      (visited day_1)
      (not (visited day_2))
      (next day_1 day_2)
      (at ?t oslo)
      (flight oslo manchester)
    )
    :effect (and
      (not (at ?t oslo))
      (at ?t manchester)
      (visited day_2)
      (in_manchester day_2)
      (current day_2)
      (not (current day_1))
    )
  )

  (:action stay_reykjavik_1_2
    :parameters (?t - traveler)
    :precondition (and
      (current day_1)
      (visited day_1)
      (not (visited day_2))
      (next day_1 day_2)
      (at ?t reykjavik)
    )
    :effect (and
      (visited day_2)
      (in_reykjavik day_2)
      (current day_2)
      (not (current day_1))
    )
  )

  (:action fly_reykjavik_oslo_1_2
    :parameters (?t - traveler)
    :precondition (and
      (current day_1)
      (visited day_1)
      (not (visited day_2))
      (next day_1 day_2)
      (at ?t reykjavik)
      (flight reykjavik oslo)
    )
    :effect (and
      (not (at ?t reykjavik))
      (at ?t oslo)
      (visited day_2)
      (in_oslo day_2)
      (current day_2)
      (not (current day_1))
    )
  )

  (:action stay_manchester_1_2
    :parameters (?t - traveler)
    :precondition (and
      (current day_1)
      (visited day_1)
      (not (visited day_2))
      (next day_1 day_2)
      (at ?t manchester)
    )
    :effect (and
      (visited day_2)
      (in_manchester day_2)
      (current day_2)
      (not (current day_1))
    )
  )

  (:action fly_manchester_oslo_1_2
    :parameters (?t - traveler)
    :precondition (and
      (current day_1)
      (visited day_1)
      (not (visited day_2))
      (next day_1 day_2)
      (at ?t manchester)
      (flight manchester oslo)
    )
    :effect (and
      (not (at ?t manchester))
      (at ?t oslo)
      (visited day_2)
      (in_oslo day_2)
      (current day_2)
      (not (current day_1))
    )
  )

  (:action stay_oslo_2_3
    :parameters (?t - traveler)
    :precondition (and (current day_2) (visited day_2) (not (visited day_3)) (next day_2 day_3) (at ?t oslo))
    :effect (and (visited day_3) (in_oslo day_3) (current day_3) (not (current day_2)))
  )

  (:action fly_oslo_reykjavik_2_3
    :parameters (?t - traveler)
    :precondition (and (current day_2) (visited day_2) (not (visited day_3)) (next day_2 day_3) (at ?t oslo) (flight oslo reykjavik))
    :effect (and (not (at ?t oslo)) (at ?t reykjavik) (visited day_3) (in_reykjavik day_3) (current day_3) (not (current day_2)))
  )

  (:action fly_oslo_manchester_2_3
    :parameters (?t - traveler)
    :precondition (and (current day_2) (visited day_2) (not (visited day_3)) (next day_2 day_3) (at ?t oslo) (flight oslo manchester))
    :effect (and (not (at ?t oslo)) (at ?t manchester) (visited day_3) (in_manchester day_3) (current day_3) (not (current day_2)))
  )

  (:action stay_reykjavik_2_3
    :parameters (?t - traveler)
    :precondition (and (current day_2) (visited day_2) (not (visited day_3)) (next day_2 day_3) (at ?t reykjavik))
    :effect (and (visited day_3) (in_reykjavik day_3) (current day_3) (not (current day_2)))
  )

  (:action fly_reykjavik_oslo_2_3
    :parameters (?t - traveler)
    :precondition (and (current day_2) (visited day_2) (not (visited day_3)) (next day_2 day_3) (at ?t reykjavik) (flight reykjavik oslo))
    :effect (and (not (at ?t reykjavik)) (at ?t oslo) (visited day_3) (in_oslo day_3) (current day_3) (not (current day_2)))
  )

  (:action stay_manchester_2_3
    :parameters (?t - traveler)
    :precondition (and (current day_2) (visited day_2) (not (visited day_3)) (next day_2 day_3) (at ?t manchester))
    :effect (and (visited day_3) (in_manchester day_3) (current day_3) (not (current day_2)))
  )

  (:action fly_manchester_oslo_2_3
    :parameters (?t - traveler)
    :precondition (and (current day_2) (visited day_2) (not (visited day_3)) (next day_2 day_3) (at ?t manchester) (flight manchester oslo))
    :effect (and (not (at ?t manchester)) (at ?t oslo) (visited day_3) (in_oslo day_3) (current day_3) (not (current day_2)))
  )

  (:action stay_oslo_3_4
    :parameters (?t - traveler)
    :precondition (and (current day_3) (visited day_3) (not (visited day_4)) (next day_3 day_4) (at ?t oslo))
    :effect (and (visited day_4) (in_oslo day_4) (current day_4) (not (current day_3)))
  )

  (:action fly_oslo_reykjavik_3_4
    :parameters (?t - traveler)
    :precondition (and (current day_3) (visited day_3) (not (visited day_4)) (next day_3 day_4) (at ?t oslo) (flight oslo reykjavik))
    :effect (and (not (at ?t oslo)) (at ?t reykjavik) (visited day_4) (in_reykjavik day_4) (current day_4) (not (current day_3)))
  )

  (:action fly_oslo_manchester_3_4
    :parameters (?t - traveler)
    :precondition (and (current day_3) (visited day_3) (not (visited day_4)) (next day_3 day_4) (at ?t oslo) (flight oslo manchester))
    :effect (and (not (at ?t oslo)) (at ?t manchester) (visited day_4) (in_manchester day_4) (current day_4) (not (current day_3)))
  )

  (:action stay_reykjavik_3_4
    :parameters (?t - traveler)
    :precondition (and (current day_3) (visited day_3) (not (visited day_4)) (next day_3 day_4) (at ?t reykjavik))
    :effect (and (visited day_4) (in_reykjavik day_4) (current day_4) (not (current day_3)))
  )

  (:action fly_reykjavik_oslo_3_4
    :parameters (?t - traveler)
    :precondition (and (current day_3) (visited day_3) (not (visited day_4)) (next day_3 day_4) (at ?t reykjavik) (flight reykjavik oslo))
    :effect (and (not (at ?t reykjavik)) (at ?t oslo) (visited day_4) (in_oslo day_4) (current day_4) (not (current day_3)))
  )

  (:action stay_manchester_3_4
    :parameters (?t - traveler)
    :precondition (and (current day_3) (visited day_3) (not (visited day_4)) (next day_3 day_4) (at ?t manchester))
    :effect (and (visited day_4) (in_manchester day_4) (current day_4) (not (current day_3)))
  )

  (:action fly_manchester_oslo_3_4
    :parameters (?t - traveler)
    :precondition (and (current day_3) (visited day_3) (not (visited day_4)) (next day_3 day_4) (at ?t manchester) (flight manchester oslo))
    :effect (and (not (at ?t manchester)) (at ?t oslo) (visited day_4) (in_oslo day_4) (current day_4) (not (current day_3)))
  )

  (:action stay_oslo_4_5
    :parameters (?t - traveler)
    :precondition (and (current day_4) (visited day_4) (not (visited day_5)) (next day_4 day_5) (at ?t oslo))
    :effect (and (visited day_5) (in_oslo day_5) (current day_5) (not (current day_4)))
  )

  (:action fly_oslo_reykjavik_4_5
    :parameters (?t - traveler)
    :precondition (and (current day_4) (visited day_4) (not (visited day_5)) (next day_4 day_5) (at ?t oslo) (flight oslo reykjavik))
    :effect (and (not (at ?t oslo)) (at ?t reykjavik) (visited day_5) (in_reykjavik day_5) (current day_5) (not (current day_4)))
  )

  (:action fly_oslo_manchester_4_5
    :parameters (?t - traveler)
    :precondition (and (current day_4) (visited day_4) (not (visited day_5)) (next day_4 day_5) (at ?t oslo) (flight oslo manchester))
    :effect (and (not (at ?t oslo)) (at ?t manchester) (visited day_5) (in_manchester day_5) (current day_5) (not (current day_4)))
  )

  (:action stay_reykjavik_4_5
    :parameters (?t - traveler)
    :precondition (and (current day_4) (visited day_4) (not (visited day_5)) (next day_4 day_5) (at ?t reykjavik))
    :effect (and (visited day_5) (in_reykjavik day_5) (current day_5) (not (current day_4)))
  )

  (:action fly_reykjavik_oslo_4_5
    :parameters (?t - traveler)
    :precondition (and (current day_4) (visited day_4) (not (visited day_5)) (next day_4 day_5) (at ?t reykjavik) (flight reykjavik oslo))
    :effect (and (not (at ?t reykjavik)) (at ?t oslo) (visited day_5) (in_oslo day_5) (current day_5) (not (current day_4)))
  )

  (:action stay_manchester_4_5
    :parameters (?t - traveler)
    :precondition (and (current day_4) (visited day_4) (not (visited day_5)) (next day_4 day_5) (at ?t manchester))
    :effect (and (visited day_5) (in_manchester day_5) (current day_5) (not (current day_4)))
  )

  (:action fly_manchester_oslo_4_5
    :parameters (?t - traveler)
    :precondition (and (current day_4) (visited day_4) (not (visited day_5)) (next day_4 day_5) (at ?t manchester) (flight manchester oslo))
    :effect (and (not (at ?t manchester)) (at ?t oslo) (visited day_5) (in_oslo day_5) (current day_5) (not (current day_4)))
  )

  (:action stay_oslo_5_6
    :parameters (?t - traveler)
    :precondition (and (current day_5) (visited day_5) (not (visited day_6)) (next day_5 day_6) (at ?t oslo))
    :effect (and (visited day_6) (in_oslo day_6) (current day_6) (not (current day_5)))
  )

  (:action fly_oslo_reykjavik_5_6
    :parameters (?t - traveler)
    :precondition (and (current day_5) (visited day_5) (not (visited day_6)) (next day_5 day_6) (at ?t oslo) (flight oslo reykjavik))
    :effect (and (not (at ?t oslo)) (at ?t reykjavik) (visited day_6) (in_reykjavik day_6) (current day_6) (not (current day_5)))
  )

  (:action fly_oslo_manchester_5_6
    :parameters (?t - traveler)
    :precondition (and (current day_5) (visited day_5) (not (visited day_6)) (next day_5 day_6) (at ?t oslo) (flight oslo manchester))
    :effect (and (not (at ?t oslo)) (at ?t manchester) (visited day_6) (in_manchester day_6) (current day_6) (not (current day_5)))
  )

  (:action stay_reykjavik_5_6
    :parameters (?t - traveler)
    :precondition (and (current day_5) (visited day_5) (not (visited day_6)) (next day_5 day_6) (at ?t reykjavik))
    :effect (and (visited day_6) (in_reykjavik day_6) (current day_6) (not (current day_5)))
  )

  (:action fly_reykjavik_oslo_5_6
    :parameters (?t - traveler)
    :precondition (and (current day_5) (visited day_5) (not (visited day_6)) (next day_5 day_6) (at ?t reykjavik) (flight reykjavik oslo))
    :effect (and (not (at ?t reykjavik)) (at ?t oslo) (visited day_6) (in_oslo day_6) (current day_6) (not (current day_5)))
  )

  (:action stay_manchester_5_6
    :parameters (?t - traveler)
    :precondition (and (current day_5) (visited day_5) (not (visited day_6)) (next day_5 day_6) (at ?t manchester))
    :effect (and (visited day_6) (in_manchester day_6) (current day_6) (not (current day_5)))
  )

  (:action fly_manchester_oslo_5_6
    :parameters (?t - traveler)
    :precondition (and (current day_5) (visited day_5) (not (visited day_6)) (next day_5 day_6) (at ?t manchester) (flight manchester oslo))
    :effect (and (not (at ?t manchester)) (at ?t oslo) (visited day_6) (in_oslo day_6) (current day_6) (not (current day_5)))
  )

  (:action stay_oslo_6_7
    :parameters (?t - traveler)
    :precondition (and (current day_6) (visited day_6) (not (visited day_7)) (next day_6 day_7) (at ?t oslo))
    :effect (and (visited day_7) (in_oslo day_7) (current day_7) (not (current day_6)))
  )

  (:action fly_oslo_reykjavik_6_7
    :parameters (?t - traveler)
    :precondition (and (current day_6) (visited day_6) (not (visited day_7)) (next day_6 day_7) (at ?t oslo) (flight oslo reykjavik))
    :effect (and (not (at ?t oslo)) (at ?t reykjavik) (visited day_7) (in_reykjavik day_7) (current day_7) (not (current day_6)))
  )

  (:action fly_oslo_manchester_6_7
    :parameters (?t - traveler)
    :precondition (and (current day_6) (visited day_6) (not (visited day_7)) (next day_6 day_7) (at ?t oslo) (flight oslo manchester))
    :effect (and (not (at ?t oslo)) (at ?t manchester) (visited day_7) (in_manchester day_7) (current day_7) (not (current day_6)))
  )

  (:action stay_reykjavik_6_7
    :parameters (?t - traveler)
    :precondition (and (current day_6) (visited day_6) (not (visited day_7)) (next day_6 day_7) (at ?t reykjavik))
    :effect (and (visited day_7) (in_reykjavik day_7) (current day_7) (not (current day_6)))
  )

  (:action fly_reykjavik_oslo_6_7
    :parameters (?t - traveler)
    :precondition (and (current day_6) (visited day_6) (not (visited day_7)) (next day_6 day_7) (at ?t reykjavik) (flight reykjavik oslo))
    :effect (and (not (at ?t reykjavik)) (at ?t oslo) (visited day_7) (in_oslo day_7) (current day_7) (not (current day_6)))
  )

  (:action stay_manchester_6_7
    :parameters (?t - traveler)
    :precondition (and (current day_6) (visited day_6) (not (visited day_7)) (next day_6 day_7) (at ?t manchester))
    :effect (and (visited day_7) (in_manchester day_7) (current day_7) (not (current day_6)))
  )

  (:action fly_manchester_oslo_6_7
    :parameters (?t - traveler)
    :precondition (and (current day_6) (visited day_6) (not (visited day_7)) (next day_6 day_7) (at ?t manchester) (flight manchester oslo))
    :effect (and (not (at ?t manchester)) (at ?t oslo) (visited day_7) (in_oslo day_7) (current day_7) (not (current day_6)))
  )

  (:action stay_oslo_7_8
    :parameters (?t - traveler)
    :precondition (and (current day_7) (visited day_7) (not (visited day_8)) (next day_7 day_8) (at ?t oslo))
    :effect (and (visited day_8) (in_oslo day_8) (current day_8) (not (current day_7)))
  )

  (:action fly_oslo_reykjavik_7_8
    :parameters (?t - traveler)
    :precondition (and (current day_7) (visited day_7) (not (visited day_8)) (next day_7 day_8) (at ?t oslo) (flight oslo reykjavik))
    :effect (and (not (at ?t oslo)) (at ?t reykjavik) (visited day_8) (in_reykjavik day_8) (current day_8) (not (current day_7)))
  )

  (:action fly_oslo_manchester_7_8
    :parameters (?t - traveler)
    :precondition (and (current day_7) (visited day_7) (not (visited day_8)) (next day_7 day_8) (at ?t oslo) (flight oslo manchester))
    :effect (and (not (at ?t oslo)) (at ?t manchester) (visited day_8) (in_manchester day_8) (current day_8) (not (current day_7)))
  )

  (:action stay_reykjavik_7_8
    :parameters (?t - traveler)
    :precondition (and (current day_7) (visited day_7) (not (visited day_8)) (next day_7 day_8) (at ?t reykjavik))
    :effect (and (visited day_8) (in_reykjavik day_8) (current day_8) (not (current day_7)))
  )

  (:action fly_reykjavik_oslo_7_8
    :parameters (?t - traveler)
    :precondition (and (current day_7) (visited day_7) (not (visited day_8)) (next day_7 day_8) (at ?t reykjavik) (flight reykjavik oslo))
    :effect (and (not (at ?t reykjavik)) (at ?t oslo) (visited day_8) (in_oslo day_8) (current day_8) (not (current day_7)))
  )

  (:action stay_manchester_7_8
    :parameters (?t - traveler)
    :precondition (and (current day_7) (visited day_7) (not (visited day_8)) (next day_7 day_8) (at ?t manchester))
    :effect (and (visited day_8) (in_manchester day_8) (current day_8) (not (current day_7)))
  )

  (:action fly_manchester_oslo_7_8
    :parameters (?t - traveler)
    :precondition (and (current day_7) (visited day_7) (not (visited day_8)) (next day_7 day_8) (at ?t manchester) (flight manchester oslo))
    :effect (and (not (at ?t manchester)) (at ?t oslo) (visited day_8) (in_oslo day_8) (current day_8) (not (current day_7)))
  )
)