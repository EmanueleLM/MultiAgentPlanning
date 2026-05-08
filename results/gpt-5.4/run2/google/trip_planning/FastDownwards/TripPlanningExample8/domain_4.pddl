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
      (current_day day1)
      (at ?c)
      (not (visited athens day1))
      (not (visited zurich day1))
      (not (visited krakow day1))
    )
    :effect (visited ?c day1)
  )

  (:action visit_d2
    :parameters (?c - city)
    :precondition (and
      (current_day day2)
      (at ?c)
      (not (visited athens day2))
      (not (visited zurich day2))
      (not (visited krakow day2))
    )
    :effect (visited ?c day2)
  )

  (:action visit_d3
    :parameters (?c - city)
    :precondition (and
      (current_day day3)
      (at ?c)
      (not (visited athens day3))
      (not (visited zurich day3))
      (not (visited krakow day3))
    )
    :effect (visited ?c day3)
  )

  (:action visit_d4
    :parameters (?c - city)
    :precondition (and
      (current_day day4)
      (at ?c)
      (not (visited athens day4))
      (not (visited zurich day4))
      (not (visited krakow day4))
    )
    :effect (visited ?c day4)
  )

  (:action visit_d5
    :parameters (?c - city)
    :precondition (and
      (current_day day5)
      (at ?c)
      (not (visited athens day5))
      (not (visited zurich day5))
      (not (visited krakow day5))
    )
    :effect (visited ?c day5)
  )

  (:action visit_d6
    :parameters (?c - city)
    :precondition (and
      (current_day day6)
      (at ?c)
      (not (visited athens day6))
      (not (visited zurich day6))
      (not (visited krakow day6))
    )
    :effect (visited ?c day6)
  )

  (:action visit_d7
    :parameters (?c - city)
    :precondition (and
      (current_day day7)
      (at ?c)
      (not (visited athens day7))
      (not (visited zurich day7))
      (not (visited krakow day7))
    )
    :effect (visited ?c day7)
  )

  (:action visit_d8
    :parameters (?c - city)
    :precondition (and
      (current_day day8)
      (at ?c)
      (not (visited athens day8))
      (not (visited zurich day8))
      (not (visited krakow day8))
    )
    :effect (visited ?c day8)
  )

  (:action visit_d9
    :parameters (?c - city)
    :precondition (and
      (current_day day9)
      (at ?c)
      (not (visited athens day9))
      (not (visited zurich day9))
      (not (visited krakow day9))
    )
    :effect (visited ?c day9)
  )

  (:action visit_d10
    :parameters (?c - city)
    :precondition (and
      (current_day day10)
      (at ?c)
      (not (visited athens day10))
      (not (visited zurich day10))
      (not (visited krakow day10))
    )
    :effect (visited ?c day10)
  )

  (:action visit_d11
    :parameters (?c - city)
    :precondition (and
      (current_day day11)
      (at ?c)
      (not (visited athens day11))
      (not (visited zurich day11))
      (not (visited krakow day11))
    )
    :effect (visited ?c day11)
  )

  (:action visit_d12
    :parameters (?c - city)
    :precondition (and
      (current_day day12)
      (at ?c)
      (not (visited athens day12))
      (not (visited zurich day12))
      (not (visited krakow day12))
    )
    :effect (visited ?c day12)
  )

  (:action visit_d13
    :parameters (?c - city)
    :precondition (and
      (current_day day13)
      (at ?c)
      (not (visited athens day13))
      (not (visited zurich day13))
      (not (visited krakow day13))
    )
    :effect (visited ?c day13)
  )

  (:action visit_d14
    :parameters (?c - city)
    :precondition (and
      (current_day day14)
      (at ?c)
      (not (visited athens day14))
      (not (visited zurich day14))
      (not (visited krakow day14))
    )
    :effect (visited ?c day14)
  )

  (:action visit_d15
    :parameters (?c - city)
    :precondition (and
      (current_day day15)
      (at ?c)
      (not (visited athens day15))
      (not (visited zurich day15))
      (not (visited krakow day15))
    )
    :effect (visited ?c day15)
  )

  (:action visit_d16
    :parameters (?c - city)
    :precondition (and
      (current_day day16)
      (at ?c)
      (not (visited athens day16))
      (not (visited zurich day16))
      (not (visited krakow day16))
    )
    :effect (visited ?c day16)
  )

  (:action advance_athens_day1_day2
    :parameters ()
    :precondition (and (current_day day1) (at athens) (visited athens day1) (need_athens_1))
    :effect (and (not (current_day day1)) (current_day day2) (not (need_athens_1)) (need_athens_2))
  )

  (:action advance_athens_day2_day3
    :parameters ()
    :precondition (and (current_day day2) (at athens) (visited athens day2) (need_athens_2))
    :effect (and (not (current_day day2)) (current_day day3) (not (need_athens_2)) (need_athens_3))
  )

  (:action advance_athens_day3_day4
    :parameters ()
    :precondition (and (current_day day3) (at athens) (visited athens day3) (need_athens_3))
    :effect (and (not (current_day day3)) (current_day day4) (not (need_athens_3)) (need_athens_4))
  )

  (:action advance_athens_day4_day5
    :parameters ()
    :precondition (and (current_day day4) (at athens) (visited athens day4) (need_athens_4))
    :effect (and (not (current_day day4)) (current_day day5) (not (need_athens_4)) (need_athens_5))
  )

  (:action advance_athens_day5_day6
    :parameters ()
    :precondition (and (current_day day5) (at athens) (visited athens day5) (need_athens_5))
    :effect (and (not (current_day day5)) (current_day day6) (not (need_athens_5)) (need_athens_6))
  )

  (:action advance_athens_day6_day7
    :parameters ()
    :precondition (and (current_day day6) (at athens) (visited athens day6) (need_athens_6))
    :effect (and (not (current_day day6)) (current_day day7) (not (need_athens_6)) (need_athens_7))
  )

  (:action advance_athens_day7_day8
    :parameters ()
    :precondition (and (current_day day7) (at athens) (visited athens day7) (need_athens_7))
    :effect (and (not (current_day day7)) (current_day day8) (not (need_athens_7)))
  )

  (:action fly_athens_to_zurich
    :parameters ()
    :precondition (and
      (current_day day8)
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

  (:action advance_zurich_day8_day9
    :parameters ()
    :precondition (and (current_day day8) (at zurich) (visited zurich day8) (need_zurich_1))
    :effect (and (not (current_day day8)) (current_day day9) (not (need_zurich_1)) (need_zurich_2))
  )

  (:action advance_zurich_day9_day10
    :parameters ()
    :precondition (and (current_day day9) (at zurich) (visited zurich day9) (need_zurich_2))
    :effect (and (not (current_day day9)) (current_day day10) (not (need_zurich_2)) (need_zurich_3))
  )

  (:action advance_zurich_day10_day11
    :parameters ()
    :precondition (and (current_day day10) (at zurich) (visited zurich day10) (need_zurich_3))
    :effect (and (not (current_day day10)) (current_day day11) (not (need_zurich_3)) (need_zurich_4))
  )

  (:action advance_zurich_day11_day12
    :parameters ()
    :precondition (and (current_day day11) (at zurich) (visited zurich day11) (need_zurich_4))
    :effect (and (not (current_day day11)) (current_day day12) (not (need_zurich_4)) (need_zurich_5))
  )

  (:action advance_zurich_day12_day13
    :parameters ()
    :precondition (and (current_day day12) (at zurich) (visited zurich day12) (need_zurich_5))
    :effect (and (not (current_day day12)) (current_day day13) (not (need_zurich_5)))
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

  (:action advance_krakow_day13_day14
    :parameters ()
    :precondition (and (current_day day13) (at krakow) (visited krakow day13) (need_krakow_1))
    :effect (and (not (current_day day13)) (current_day day14) (not (need_krakow_1)) (need_krakow_2))
  )

  (:action advance_krakow_day14_day15
    :parameters ()
    :precondition (and (current_day day14) (at krakow) (visited krakow day14) (need_krakow_2))
    :effect (and (not (current_day day14)) (current_day day15) (not (need_krakow_2)) (need_krakow_3))
  )

  (:action advance_krakow_day15_day16
    :parameters ()
    :precondition (and (current_day day15) (at krakow) (visited krakow day15) (need_krakow_3))
    :effect (and (not (current_day day15)) (current_day day16) (not (need_krakow_3)) (need_krakow_4))
  )

  (:action complete_krakow_requirement_on_day16
    :parameters ()
    :precondition (and
      (current_day day16)
      (at krakow)
      (visited krakow day16)
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
      (current_day day13)
      (at krakow)
      (need_krakow_1)
      (not (need_krakow_5))
    )
    :effect (need_krakow_5)
  )

  (:action seed_extra_krakow_need_6
    :parameters ()
    :precondition (and
      (current_day day13)
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
      (current_day day16)
      (visited athens day1)
      (visited athens day2)
      (visited athens day3)
      (visited athens day4)
      (visited athens day5)
      (visited athens day6)
      (visited athens day7)
      (visited krakow day16)
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