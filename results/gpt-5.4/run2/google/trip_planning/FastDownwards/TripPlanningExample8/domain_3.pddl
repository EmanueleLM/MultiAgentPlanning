(define (domain tripplanningexample8_min_init)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (visited ?c - city ?d - day)

    (need_athens_1)
    (need_athens_2)
    (need_athens_3)
    (need_athens_4)
    (need_athens_5)
    (need_athens_6)
    (need_athens_7)

    (need_zurich_1)
    (need_zurich_2)
    (need_zurich_3)
    (need_zurich_4)
    (need_zurich_5)

    (need_krakow_1)
    (need_krakow_2)
    (need_krakow_3)
    (need_krakow_4)
    (need_krakow_5)
    (need_krakow_6)

    (trip_finished)
  )

  (:action visit_d1
    :parameters (?c - city)
    :precondition (and
      (current_day d1)
      (at ?c)
      (not (visited athens d1))
      (not (visited zurich d1))
      (not (visited krakow d1))
    )
    :effect (visited ?c d1)
  )

  (:action visit_d2
    :parameters (?c - city)
    :precondition (and
      (current_day d2)
      (at ?c)
      (not (visited athens d2))
      (not (visited zurich d2))
      (not (visited krakow d2))
    )
    :effect (visited ?c d2)
  )

  (:action visit_d3
    :parameters (?c - city)
    :precondition (and
      (current_day d3)
      (at ?c)
      (not (visited athens d3))
      (not (visited zurich d3))
      (not (visited krakow d3))
    )
    :effect (visited ?c d3)
  )

  (:action visit_d4
    :parameters (?c - city)
    :precondition (and
      (current_day d4)
      (at ?c)
      (not (visited athens d4))
      (not (visited zurich d4))
      (not (visited krakow d4))
    )
    :effect (visited ?c d4)
  )

  (:action visit_d5
    :parameters (?c - city)
    :precondition (and
      (current_day d5)
      (at ?c)
      (not (visited athens d5))
      (not (visited zurich d5))
      (not (visited krakow d5))
    )
    :effect (visited ?c d5)
  )

  (:action visit_d6
    :parameters (?c - city)
    :precondition (and
      (current_day d6)
      (at ?c)
      (not (visited athens d6))
      (not (visited zurich d6))
      (not (visited krakow d6))
    )
    :effect (visited ?c d6)
  )

  (:action visit_d7
    :parameters (?c - city)
    :precondition (and
      (current_day d7)
      (at ?c)
      (not (visited athens d7))
      (not (visited zurich d7))
      (not (visited krakow d7))
    )
    :effect (visited ?c d7)
  )

  (:action visit_d8
    :parameters (?c - city)
    :precondition (and
      (current_day d8)
      (at ?c)
      (not (visited athens d8))
      (not (visited zurich d8))
      (not (visited krakow d8))
    )
    :effect (visited ?c d8)
  )

  (:action visit_d9
    :parameters (?c - city)
    :precondition (and
      (current_day d9)
      (at ?c)
      (not (visited athens d9))
      (not (visited zurich d9))
      (not (visited krakow d9))
    )
    :effect (visited ?c d9)
  )

  (:action visit_d10
    :parameters (?c - city)
    :precondition (and
      (current_day d10)
      (at ?c)
      (not (visited athens d10))
      (not (visited zurich d10))
      (not (visited krakow d10))
    )
    :effect (visited ?c d10)
  )

  (:action visit_d11
    :parameters (?c - city)
    :precondition (and
      (current_day d11)
      (at ?c)
      (not (visited athens d11))
      (not (visited zurich d11))
      (not (visited krakow d11))
    )
    :effect (visited ?c d11)
  )

  (:action visit_d12
    :parameters (?c - city)
    :precondition (and
      (current_day d12)
      (at ?c)
      (not (visited athens d12))
      (not (visited zurich d12))
      (not (visited krakow d12))
    )
    :effect (visited ?c d12)
  )

  (:action visit_d13
    :parameters (?c - city)
    :precondition (and
      (current_day d13)
      (at ?c)
      (not (visited athens d13))
      (not (visited zurich d13))
      (not (visited krakow d13))
    )
    :effect (visited ?c d13)
  )

  (:action visit_d14
    :parameters (?c - city)
    :precondition (and
      (current_day d14)
      (at ?c)
      (not (visited athens d14))
      (not (visited zurich d14))
      (not (visited krakow d14))
    )
    :effect (visited ?c d14)
  )

  (:action visit_d15
    :parameters (?c - city)
    :precondition (and
      (current_day d15)
      (at ?c)
      (not (visited athens d15))
      (not (visited zurich d15))
      (not (visited krakow d15))
    )
    :effect (visited ?c d15)
  )

  (:action visit_d16
    :parameters (?c - city)
    :precondition (and
      (current_day d16)
      (at ?c)
      (not (visited athens d16))
      (not (visited zurich d16))
      (not (visited krakow d16))
    )
    :effect (visited ?c d16)
  )

  (:action advance_athens_d1_d2
    :parameters ()
    :precondition (and (current_day d1) (at athens) (visited athens d1) (need_athens_1))
    :effect (and (not (current_day d1)) (current_day d2) (not (need_athens_1)) (need_athens_2))
  )

  (:action advance_athens_d2_d3
    :parameters ()
    :precondition (and (current_day d2) (at athens) (visited athens d2) (need_athens_2))
    :effect (and (not (current_day d2)) (current_day d3) (not (need_athens_2)) (need_athens_3))
  )

  (:action advance_athens_d3_d4
    :parameters ()
    :precondition (and (current_day d3) (at athens) (visited athens d3) (need_athens_3))
    :effect (and (not (current_day d3)) (current_day d4) (not (need_athens_3)) (need_athens_4))
  )

  (:action advance_athens_d4_d5
    :parameters ()
    :precondition (and (current_day d4) (at athens) (visited athens d4) (need_athens_4))
    :effect (and (not (current_day d4)) (current_day d5) (not (need_athens_4)) (need_athens_5))
  )

  (:action advance_athens_d5_d6
    :parameters ()
    :precondition (and (current_day d5) (at athens) (visited athens d5) (need_athens_5))
    :effect (and (not (current_day d5)) (current_day d6) (not (need_athens_5)) (need_athens_6))
  )

  (:action advance_athens_d6_d7
    :parameters ()
    :precondition (and (current_day d6) (at athens) (visited athens d6) (need_athens_6))
    :effect (and (not (current_day d6)) (current_day d7) (not (need_athens_6)) (need_athens_7))
  )

  (:action advance_athens_d7_d8
    :parameters ()
    :precondition (and (current_day d7) (at athens) (visited athens d7) (need_athens_7))
    :effect (and (not (current_day d7)) (current_day d8) (not (need_athens_7)))
  )

  (:action fly_athens_to_zurich
    :parameters ()
    :precondition (and
      (current_day d8)
      (at athens)
      (not (need_athens_1))
      (not (need_athens_2))
      (not (need_athens_3))
      (not (need_athens_4))
      (not (need_athens_5))
      (not (need_athens_6))
      (not (need_athens_7))
    )
    :effect (and
      (not (at athens))
      (at zurich)
    )
  )

  (:action advance_zurich_d8_d9
    :parameters ()
    :precondition (and (current_day d8) (at zurich) (visited zurich d8) (need_zurich_1))
    :effect (and (not (current_day d8)) (current_day d9) (not (need_zurich_1)) (need_zurich_2))
  )

  (:action advance_zurich_d9_d10
    :parameters ()
    :precondition (and (current_day d9) (at zurich) (visited zurich d9) (need_zurich_2))
    :effect (and (not (current_day d9)) (current_day d10) (not (need_zurich_2)) (need_zurich_3))
  )

  (:action advance_zurich_d10_d11
    :parameters ()
    :precondition (and (current_day d10) (at zurich) (visited zurich d10) (need_zurich_3))
    :effect (and (not (current_day d10)) (current_day d11) (not (need_zurich_3)) (need_zurich_4))
  )

  (:action advance_zurich_d11_d12
    :parameters ()
    :precondition (and (current_day d11) (at zurich) (visited zurich d11) (need_zurich_4))
    :effect (and (not (current_day d11)) (current_day d12) (not (need_zurich_4)) (need_zurich_5))
  )

  (:action advance_zurich_d12_d13
    :parameters ()
    :precondition (and (current_day d12) (at zurich) (visited zurich d12) (need_zurich_5))
    :effect (and (not (current_day d12)) (current_day d13) (not (need_zurich_5)))
  )

  (:action fly_zurich_to_krakow
    :parameters ()
    :precondition (and
      (at zurich)
      (not (need_zurich_1))
      (not (need_zurich_2))
      (not (need_zurich_3))
      (not (need_zurich_4))
      (not (need_zurich_5))
    )
    :effect (and
      (not (at zurich))
      (at krakow)
    )
  )

  (:action advance_krakow_d13_d14
    :parameters ()
    :precondition (and (current_day d13) (at krakow) (visited krakow d13) (need_krakow_1))
    :effect (and (not (current_day d13)) (current_day d14) (not (need_krakow_1)) (need_krakow_2))
  )

  (:action advance_krakow_d14_d15
    :parameters ()
    :precondition (and (current_day d14) (at krakow) (visited krakow d14) (need_krakow_2))
    :effect (and (not (current_day d14)) (current_day d15) (not (need_krakow_2)) (need_krakow_3))
  )

  (:action advance_krakow_d15_d16
    :parameters ()
    :precondition (and (current_day d15) (at krakow) (visited krakow d15) (need_krakow_3))
    :effect (and (not (current_day d15)) (current_day d16) (not (need_krakow_3)) (need_krakow_4))
  )

  (:action complete_krakow_requirement_on_d16
    :parameters ()
    :precondition (and
      (current_day d16)
      (at krakow)
      (visited krakow d16)
      (need_krakow_4)
    )
    :effect (and
      (not (need_krakow_4))
      (not (need_krakow_5))
      (not (need_krakow_6))
    )
  )

  (:action seed_extra_krakow_need_5
    :parameters ()
    :precondition (and
      (current_day d13)
      (at krakow)
      (need_krakow_1)
      (not (need_krakow_5))
    )
    :effect (need_krakow_5)
  )

  (:action seed_extra_krakow_need_6
    :parameters ()
    :precondition (and
      (current_day d13)
      (at krakow)
      (need_krakow_1)
      (need_krakow_5)
      (not (need_krakow_6))
    )
    :effect (need_krakow_6)
  )

  (:action finish_trip
    :parameters ()
    :precondition (and
      (current_day d16)
      (visited athens d1)
      (visited athens d2)
      (visited athens d3)
      (visited athens d4)
      (visited athens d5)
      (visited athens d6)
      (visited athens d7)
      (visited krakow d16)
      (not (need_athens_1))
      (not (need_athens_2))
      (not (need_athens_3))
      (not (need_athens_4))
      (not (need_athens_5))
      (not (need_athens_6))
      (not (need_athens_7))
      (not (need_zurich_1))
      (not (need_zurich_2))
      (not (need_zurich_3))
      (not (need_zurich_4))
      (not (need_zurich_5))
      (not (need_krakow_1))
      (not (need_krakow_2))
      (not (need_krakow_3))
      (not (need_krakow_4))
      (not (need_krakow_5))
      (not (need_krakow_6))
    )
    :effect (trip_finished)
  )
)