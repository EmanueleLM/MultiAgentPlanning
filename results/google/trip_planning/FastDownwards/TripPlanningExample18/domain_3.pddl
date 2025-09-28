(define (domain travel-multicity)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:constants
    amsterdam vilnius bucharest - city
    day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )
  (:predicates
    (at ?c - city)
    (at-day ?d - day)
    (done_amsterdam_1)
    (done_amsterdam_2)
    (done_amsterdam_3)
    (done_amsterdam_4)
    (done_amsterdam_5)
    (done_vilnius_1)
    (done_vilnius_2)
    (done_bucharest_1)
    (done_bucharest_2)
    (done_bucharest_3)
    (done_bucharest_4)
    (met)
  )

  (:action fly_amsterdam_to_bucharest
    :parameters ()
    :precondition (and (at amsterdam))
    :effect (and (not (at amsterdam)) (at bucharest))
  )

  (:action fly_bucharest_to_amsterdam
    :parameters ()
    :precondition (and (at bucharest))
    :effect (and (not (at bucharest)) (at amsterdam))
  )

  (:action fly_vilnius_to_amsterdam
    :parameters ()
    :precondition (and (at vilnius))
    :effect (and (not (at vilnius)) (at amsterdam))
  )

  (:action fly_amsterdam_to_vilnius
    :parameters ()
    :precondition (and (at amsterdam))
    :effect (and (not (at amsterdam)) (at vilnius))
  )

  (:action stay_amsterdam_1_day0
    :parameters ()
    :precondition (and (at amsterdam) (at-day day0) (not (done_amsterdam_1)))
    :effect (and (not (at-day day0)) (at-day day1) (done_amsterdam_1))
  )
  (:action stay_amsterdam_1_day1
    :parameters ()
    :precondition (and (at amsterdam) (at-day day1) (not (done_amsterdam_1)))
    :effect (and (not (at-day day1)) (at-day day2) (done_amsterdam_1))
  )
  (:action stay_amsterdam_1_day2
    :parameters ()
    :precondition (and (at amsterdam) (at-day day2) (not (done_amsterdam_1)))
    :effect (and (not (at-day day2)) (at-day day3) (done_amsterdam_1))
  )
  (:action stay_amsterdam_1_day3
    :parameters ()
    :precondition (and (at amsterdam) (at-day day3) (not (done_amsterdam_1)))
    :effect (and (not (at-day day3)) (at-day day4) (done_amsterdam_1))
  )
  (:action stay_amsterdam_1_day4
    :parameters ()
    :precondition (and (at amsterdam) (at-day day4) (not (done_amsterdam_1)))
    :effect (and (not (at-day day4)) (at-day day5) (done_amsterdam_1))
  )
  (:action stay_amsterdam_1_day5
    :parameters ()
    :precondition (and (at amsterdam) (at-day day5) (not (done_amsterdam_1)))
    :effect (and (not (at-day day5)) (at-day day6) (done_amsterdam_1))
  )
  (:action stay_amsterdam_1_day6
    :parameters ()
    :precondition (and (at amsterdam) (at-day day6) (not (done_amsterdam_1)))
    :effect (and (not (at-day day6)) (at-day day7) (done_amsterdam_1))
  )
  (:action stay_amsterdam_1_day7
    :parameters ()
    :precondition (and (at amsterdam) (at-day day7) (not (done_amsterdam_1)))
    :effect (and (not (at-day day7)) (at-day day8) (done_amsterdam_1))
  )
  (:action stay_amsterdam_1_day8
    :parameters ()
    :precondition (and (at amsterdam) (at-day day8) (not (done_amsterdam_1)))
    :effect (and (not (at-day day8)) (at-day day9) (done_amsterdam_1))
  )
  (:action stay_amsterdam_1_day9
    :parameters ()
    :precondition (and (at amsterdam) (at-day day9) (not (done_amsterdam_1)))
    :effect (and (not (at-day day9)) (at-day day10) (done_amsterdam_1))
  )
  (:action stay_amsterdam_1_day10
    :parameters ()
    :precondition (and (at amsterdam) (at-day day10) (not (done_amsterdam_1)))
    :effect (and (not (at-day day10)) (at-day day11) (done_amsterdam_1))
  )

  (:action stay_amsterdam_2_day0
    :parameters ()
    :precondition (and (at amsterdam) (at-day day0) (not (done_amsterdam_2)))
    :effect (and (not (at-day day0)) (at-day day1) (done_amsterdam_2))
  )
  (:action stay_amsterdam_2_day1
    :parameters ()
    :precondition (and (at amsterdam) (at-day day1) (not (done_amsterdam_2)))
    :effect (and (not (at-day day1)) (at-day day2) (done_amsterdam_2))
  )
  (:action stay_amsterdam_2_day2
    :parameters ()
    :precondition (and (at amsterdam) (at-day day2) (not (done_amsterdam_2)))
    :effect (and (not (at-day day2)) (at-day day3) (done_amsterdam_2))
  )
  (:action stay_amsterdam_2_day3
    :parameters ()
    :precondition (and (at amsterdam) (at-day day3) (not (done_amsterdam_2)))
    :effect (and (not (at-day day3)) (at-day day4) (done_amsterdam_2))
  )
  (:action stay_amsterdam_2_day4
    :parameters ()
    :precondition (and (at amsterdam) (at-day day4) (not (done_amsterdam_2)))
    :effect (and (not (at-day day4)) (at-day day5) (done_amsterdam_2))
  )
  (:action stay_amsterdam_2_day5
    :parameters ()
    :precondition (and (at amsterdam) (at-day day5) (not (done_amsterdam_2)))
    :effect (and (not (at-day day5)) (at-day day6) (done_amsterdam_2))
  )
  (:action stay_amsterdam_2_day6
    :parameters ()
    :precondition (and (at amsterdam) (at-day day6) (not (done_amsterdam_2)))
    :effect (and (not (at-day day6)) (at-day day7) (done_amsterdam_2))
  )
  (:action stay_amsterdam_2_day7
    :parameters ()
    :precondition (and (at amsterdam) (at-day day7) (not (done_amsterdam_2)))
    :effect (and (not (at-day day7)) (at-day day8) (done_amsterdam_2))
  )
  (:action stay_amsterdam_2_day8
    :parameters ()
    :precondition (and (at amsterdam) (at-day day8) (not (done_amsterdam_2)))
    :effect (and (not (at-day day8)) (at-day day9) (done_amsterdam_2))
  )
  (:action stay_amsterdam_2_day9
    :parameters ()
    :precondition (and (at amsterdam) (at-day day9) (not (done_amsterdam_2)))
    :effect (and (not (at-day day9)) (at-day day10) (done_amsterdam_2))
  )
  (:action stay_amsterdam_2_day10
    :parameters ()
    :precondition (and (at amsterdam) (at-day day10) (not (done_amsterdam_2)))
    :effect (and (not (at-day day10)) (at-day day11) (done_amsterdam_2))
  )

  (:action stay_amsterdam_3_day0
    :parameters ()
    :precondition (and (at amsterdam) (at-day day0) (not (done_amsterdam_3)))
    :effect (and (not (at-day day0)) (at-day day1) (done_amsterdam_3))
  )
  (:action stay_amsterdam_3_day1
    :parameters ()
    :precondition (and (at amsterdam) (at-day day1) (not (done_amsterdam_3)))
    :effect (and (not (at-day day1)) (at-day day2) (done_amsterdam_3))
  )
  (:action stay_amsterdam_3_day2
    :parameters ()
    :precondition (and (at amsterdam) (at-day day2) (not (done_amsterdam_3)))
    :effect (and (not (at-day day2)) (at-day day3) (done_amsterdam_3))
  )
  (:action stay_amsterdam_3_day3
    :parameters ()
    :precondition (and (at amsterdam) (at-day day3) (not (done_amsterdam_3)))
    :effect (and (not (at-day day3)) (at-day day4) (done_amsterdam_3))
  )
  (:action stay_amsterdam_3_day4
    :parameters ()
    :precondition (and (at amsterdam) (at-day day4) (not (done_amsterdam_3)))
    :effect (and (not (at-day day4)) (at-day day5) (done_amsterdam_3))
  )
  (:action stay_amsterdam_3_day5
    :parameters ()
    :precondition (and (at amsterdam) (at-day day5) (not (done_amsterdam_3)))
    :effect (and (not (at-day day5)) (at-day day6) (done_amsterdam_3))
  )
  (:action stay_amsterdam_3_day6
    :parameters ()
    :precondition (and (at amsterdam) (at-day day6) (not (done_amsterdam_3)))
    :effect (and (not (at-day day6)) (at-day day7) (done_amsterdam_3))
  )
  (:action stay_amsterdam_3_day7
    :parameters ()
    :precondition (and (at amsterdam) (at-day day7) (not (done_amsterdam_3)))
    :effect (and (not (at-day day7)) (at-day day8) (done_amsterdam_3))
  )
  (:action stay_amsterdam_3_day8
    :parameters ()
    :precondition (and (at amsterdam) (at-day day8) (not (done_amsterdam_3)))
    :effect (and (not (at-day day8)) (at-day day9) (done_amsterdam_3))
  )
  (:action stay_amsterdam_3_day9
    :parameters ()
    :precondition (and (at amsterdam) (at-day day9) (not (done_amsterdam_3)))
    :effect (and (not (at-day day9)) (at-day day10) (done_amsterdam_3))
  )
  (:action stay_amsterdam_3_day10
    :parameters ()
    :precondition (and (at amsterdam) (at-day day10) (not (done_amsterdam_3)))
    :effect (and (not (at-day day10)) (at-day day11) (done_amsterdam_3))
  )

  (:action stay_amsterdam_4_day0
    :parameters ()
    :precondition (and (at amsterdam) (at-day day0) (not (done_amsterdam_4)))
    :effect (and (not (at-day day0)) (at-day day1) (done_amsterdam_4))
  )
  (:action stay_amsterdam_4_day1
    :parameters ()
    :precondition (and (at amsterdam) (at-day day1) (not (done_amsterdam_4)))
    :effect (and (not (at-day day1)) (at-day day2) (done_amsterdam_4))
  )
  (:action stay_amsterdam_4_day2
    :parameters ()
    :precondition (and (at amsterdam) (at-day day2) (not (done_amsterdam_4)))
    :effect (and (not (at-day day2)) (at-day day3) (done_amsterdam_4))
  )
  (:action stay_amsterdam_4_day3
    :parameters ()
    :precondition (and (at amsterdam) (at-day day3) (not (done_amsterdam_4)))
    :effect (and (not (at-day day3)) (at-day day4) (done_amsterdam_4))
  )
  (:action stay_amsterdam_4_day4
    :parameters ()
    :precondition (and (at amsterdam) (at-day day4) (not (done_amsterdam_4)))
    :effect (and (not (at-day day4)) (at-day day5) (done_amsterdam_4))
  )
  (:action stay_amsterdam_4_day5
    :parameters ()
    :precondition (and (at amsterdam) (at-day day5) (not (done_amsterdam_4)))
    :effect (and (not (at-day day5)) (at-day day6) (done_amsterdam_4))
  )
  (:action stay_amsterdam_4_day6
    :parameters ()
    :precondition (and (at amsterdam) (at-day day6) (not (done_amsterdam_4)))
    :effect (and (not (at-day day6)) (at-day day7) (done_amsterdam_4))
  )
  (:action stay_amsterdam_4_day7
    :parameters ()
    :precondition (and (at amsterdam) (at-day day7) (not (done_amsterdam_4)))
    :effect (and (not (at-day day7)) (at-day day8) (done_amsterdam_4))
  )
  (:action stay_amsterdam_4_day8
    :parameters ()
    :precondition (and (at amsterdam) (at-day day8) (not (done_amsterdam_4)))
    :effect (and (not (at-day day8)) (at-day day9) (done_amsterdam_4))
  )
  (:action stay_amsterdam_4_day9
    :parameters ()
    :precondition (and (at amsterdam) (at-day day9) (not (done_amsterdam_4)))
    :effect (and (not (at-day day9)) (at-day day10) (done_amsterdam_4))
  )
  (:action stay_amsterdam_4_day10
    :parameters ()
    :precondition (and (at amsterdam) (at-day day10) (not (done_amsterdam_4)))
    :effect (and (not (at-day day10)) (at-day day11) (done_amsterdam_4))
  )

  (:action stay_amsterdam_5_day0
    :parameters ()
    :precondition (and (at amsterdam) (at-day day0) (not (done_amsterdam_5)))
    :effect (and (not (at-day day0)) (at-day day1) (done_amsterdam_5))
  )
  (:action stay_amsterdam_5_day1
    :parameters ()
    :precondition (and (at amsterdam) (at-day day1) (not (done_amsterdam_5)))
    :effect (and (not (at-day day1)) (at-day day2) (done_amsterdam_5))
  )
  (:action stay_amsterdam_5_day2
    :parameters ()
    :precondition (and (at amsterdam) (at-day day2) (not (done_amsterdam_5)))
    :effect (and (not (at-day day2)) (at-day day3) (done_amsterdam_5))
  )
  (:action stay_amsterdam_5_day3
    :parameters ()
    :precondition (and (at amsterdam) (at-day day3) (not (done_amsterdam_5)))
    :effect (and (not (at-day day3)) (at-day day4) (done_amsterdam_5))
  )
  (:action stay_amsterdam_5_day4
    :parameters ()
    :precondition (and (at amsterdam) (at-day day4) (not (done_amsterdam_5)))
    :effect (and (not (at-day day4)) (at-day day5) (done_amsterdam_5))
  )
  (:action stay_amsterdam_5_day5
    :parameters ()
    :precondition (and (at amsterdam) (at-day day5) (not (done_amsterdam_5)))
    :effect (and (not (at-day day5)) (at-day day6) (done_amsterdam_5))
  )
  (:action stay_amsterdam_5_day6
    :parameters ()
    :precondition (and (at amsterdam) (at-day day6) (not (done_amsterdam_5)))
    :effect (and (not (at-day day6)) (at-day day7) (done_amsterdam_5))
  )
  (:action stay_amsterdam_5_day7
    :parameters ()
    :precondition (and (at amsterdam) (at-day day7) (not (done_amsterdam_5)))
    :effect (and (not (at-day day7)) (at-day day8) (done_amsterdam_5))
  )
  (:action stay_amsterdam_5_day8
    :parameters ()
    :precondition (and (at amsterdam) (at-day day8) (not (done_amsterdam_5)))
    :effect (and (not (at-day day8)) (at-day day9) (done_amsterdam_5))
  )
  (:action stay_amsterdam_5_day9
    :parameters ()
    :precondition (and (at amsterdam) (at-day day9) (not (done_amsterdam_5)))
    :effect (and (not (at-day day9)) (at-day day10) (done_amsterdam_5))
  )
  (:action stay_amsterdam_5_day10
    :parameters ()
    :precondition (and (at amsterdam) (at-day day10) (not (done_amsterdam_5)))
    :effect (and (not (at-day day10)) (at-day day11) (done_amsterdam_5))
  )

  (:action stay_vilnius_1_day0
    :parameters ()
    :precondition (and (at vilnius) (at-day day0) (not (done_vilnius_1)))
    :effect (and (not (at-day day0)) (at-day day1) (done_vilnius_1))
  )
  (:action stay_vilnius_1_day1
    :parameters ()
    :precondition (and (at vilnius) (at-day day1) (not (done_vilnius_1)))
    :effect (and (not (at-day day1)) (at-day day2) (done_vilnius_1))
  )
  (:action stay_vilnius_1_day2
    :parameters ()
    :precondition (and (at vilnius) (at-day day2) (not (done_vilnius_1)))
    :effect (and (not (at-day day2)) (at-day day3) (done_vilnius_1))
  )
  (:action stay_vilnius_1_day3
    :parameters ()
    :precondition (and (at vilnius) (at-day day3) (not (done_vilnius_1)))
    :effect (and (not (at-day day3)) (at-day day4) (done_vilnius_1))
  )
  (:action stay_vilnius_1_day4
    :parameters ()
    :precondition (and (at vilnius) (at-day day4) (not (done_vilnius_1)))
    :effect (and (not (at-day day4)) (at-day day5) (done_vilnius_1))
  )
  (:action stay_vilnius_1_day5
    :parameters ()
    :precondition (and (at vilnius) (at-day day5) (not (done_vilnius_1)))
    :effect (and (not (at-day day5)) (at-day day6) (done_vilnius_1))
  )
  (:action stay_vilnius_1_day6
    :parameters ()
    :precondition (and (at vilnius) (at-day day6) (not (done_vilnius_1)))
    :effect (and (not (at-day day6)) (at-day day7) (done_vilnius_1))
  )
  (:action stay_vilnius_1_day7
    :parameters ()
    :precondition (and (at vilnius) (at-day day7) (not (done_vilnius_1)))
    :effect (and (not (at-day day7)) (at-day day8) (done_vilnius_1))
  )
  (:action stay_vilnius_1_day8
    :parameters ()
    :precondition (and (at vilnius) (at-day day8) (not (done_vilnius_1)))
    :effect (and (not (at-day day8)) (at-day day9) (done_vilnius_1))
  )
  (:action stay_vilnius_1_day9
    :parameters ()
    :precondition (and (at vilnius) (at-day day9) (not (done_vilnius_1)))
    :effect (and (not (at-day day9)) (at-day day10) (done_vilnius_1))
  )
  (:action stay_vilnius_1_day10
    :parameters ()
    :precondition (and (at vilnius) (at-day day10) (not (done_vilnius_1)))
    :effect (and (not (at-day day10)) (at-day day11) (done_vilnius_1))
  )

  (:action stay_vilnius_2_day0
    :parameters ()
    :precondition (and (at vilnius) (at-day day0) (not (done_vilnius_2)))
    :effect (and (not (at-day day0)) (at-day day1) (done_vilnius_2))
  )
  (:action stay_vilnius_2_day1
    :parameters ()
    :precondition (and (at vilnius) (at-day day1) (not (done_vilnius_2)))
    :effect (and (not (at-day day1)) (at-day day2) (done_vilnius_2))
  )
  (:action stay_vilnius_2_day2
    :parameters ()
    :precondition (and (at vilnius) (at-day day2) (not (done_vilnius_2)))
    :effect (and (not (at-day day2)) (at-day day3) (done_vilnius_2))
  )
  (:action stay_vilnius_2_day3
    :parameters ()
    :precondition (and (at vilnius) (at-day day3) (not (done_vilnius_2)))
    :effect (and (not (at-day day3)) (at-day day4) (done_vilnius_2))
  )
  (:action stay_vilnius_2_day4
    :parameters ()
    :precondition (and (at vilnius) (at-day day4) (not (done_vilnius_2)))
    :effect (and (not (at-day day4)) (at-day day5) (done_vilnius_2))
  )
  (:action stay_vilnius_2_day5
    :parameters ()
    :precondition (and (at vilnius) (at-day day5) (not (done_vilnius_2)))
    :effect (and (not (at-day day5)) (at-day day6) (done_vilnius_2))
  )
  (:action stay_vilnius_2_day6
    :parameters ()
    :precondition (and (at vilnius) (at-day day6) (not (done_vilnius_2)))
    :effect (and (not (at-day day6)) (at-day day7) (done_vilnius_2))
  )
  (:action stay_vilnius_2_day7
    :parameters ()
    :precondition (and (at vilnius) (at-day day7) (not (done_vilnius_2)))
    :effect (and (not (at-day day7)) (at-day day8) (done_vilnius_2))
  )
  (:action stay_vilnius_2_day8
    :parameters ()
    :precondition (and (at vilnius) (at-day day8) (not (done_vilnius_2)))
    :effect (and (not (at-day day8)) (at-day day9) (done_vilnius_2))
  )
  (:action stay_vilnius_2_day9
    :parameters ()
    :precondition (and (at vilnius) (at-day day9) (not (done_vilnius_2)))
    :effect (and (not (at-day day9)) (at-day day10) (done_vilnius_2))
  )
  (:action stay_vilnius_2_day10
    :parameters ()
    :precondition (and (at vilnius) (at-day day10) (not (done_vilnius_2)))
    :effect (and (not (at-day day10)) (at-day day11) (done_vilnius_2))
  )

  (:action stay_bucharest_1_day0
    :parameters ()
    :precondition (and (at bucharest) (at-day day0) (not (done_bucharest_1)))
    :effect (and (not (at-day day0)) (at-day day1) (done_bucharest_1))
  )
  (:action stay_bucharest_1_day1
    :parameters ()
    :precondition (and (at bucharest) (at-day day1) (not (done_bucharest_1)))
    :effect (and (not (at-day day1)) (at-day day2) (done_bucharest_1))
  )
  (:action stay_bucharest_1_day2
    :parameters ()
    :precondition (and (at bucharest) (at-day day2) (not (done_bucharest_1)))
    :effect (and (not (at-day day2)) (at-day day3) (done_bucharest_1))
  )
  (:action stay_bucharest_1_day3
    :parameters ()
    :precondition (and (at bucharest) (at-day day3) (not (done_bucharest_1)))
    :effect (and (not (at-day day3)) (at-day day4) (done_bucharest_1))
  )
  (:action stay_bucharest_1_day4
    :parameters ()
    :precondition (and (at bucharest) (at-day day4) (not (done_bucharest_1)))
    :effect (and (not (at-day day4)) (at-day day5) (done_bucharest_1))
  )
  (:action stay_bucharest_1_day5
    :parameters ()
    :precondition (and (at bucharest) (at-day day5) (not (done_bucharest_1)))
    :effect (and (not (at-day day5)) (at-day day6) (done_bucharest_1))
  )
  (:action stay_bucharest_1_day6
    :parameters ()
    :precondition (and (at bucharest) (at-day day6) (not (done_bucharest_1)))
    :effect (and (not (at-day day6)) (at-day day7) (done_bucharest_1))
  )
  (:action stay_bucharest_1_day7
    :parameters ()
    :precondition (and (at bucharest) (at-day day7) (not (done_bucharest_1)))
    :effect (and (not (at-day day7)) (at-day day8) (done_bucharest_1))
  )
  (:action stay_bucharest_1_day8
    :parameters ()
    :precondition (and (at bucharest) (at-day day8) (not (done_bucharest_1)))
    :effect (and (not (at-day day8)) (at-day day9) (done_bucharest_1))
  )
  (:action stay_bucharest_1_day9
    :parameters ()
    :precondition (and (at bucharest) (at-day day9) (not (done_bucharest_1)))
    :effect (and (not (at-day day9)) (at-day day10) (done_bucharest_1))
  )
  (:action stay_bucharest_1_day10
    :parameters ()
    :precondition (and (at bucharest) (at-day day10) (not (done_bucharest_1)))
    :effect (and (not (at-day day10)) (at-day day11) (done_bucharest_1))
  )

  (:action stay_bucharest_2_day0
    :parameters ()
    :precondition (and (at bucharest) (at-day day0) (not (done_bucharest_2)))
    :effect (and (not (at-day day0)) (at-day day1) (done_bucharest_2))
  )
  (:action stay_bucharest_2_day1
    :parameters ()
    :precondition (and (at bucharest) (at-day day1) (not (done_bucharest_2)))
    :effect (and (not (at-day day1)) (at-day day2) (done_bucharest_2))
  )
  (:action stay_bucharest_2_day2
    :parameters ()
    :precondition (and (at bucharest) (at-day day2) (not (done_bucharest_2)))
    :effect (and (not (at-day day2)) (at-day day3) (done_bucharest_2))
  )
  (:action stay_bucharest_2_day3
    :parameters ()
    :precondition (and (at bucharest) (at-day day3) (not (done_bucharest_2)))
    :effect (and (not (at-day day3)) (at-day day4) (done_bucharest_2))
  )
  (:action stay_bucharest_2_day4
    :parameters ()
    :precondition (and (at bucharest) (at-day day4) (not (done_bucharest_2)))
    :effect (and (not (at-day day4)) (at-day day5) (done_bucharest_2))
  )
  (:action stay_bucharest_2_day5
    :parameters ()
    :precondition (and (at bucharest) (at-day day5) (not (done_bucharest_2)))
    :effect (and (not (at-day day5)) (at-day day6) (done_bucharest_2))
  )
  (:action stay_bucharest_2_day6
    :parameters ()
    :precondition (and (at bucharest) (at-day day6) (not (done_bucharest_2)))
    :effect (and (not (at-day day6)) (at-day day7) (done_bucharest_2))
  )
  (:action stay_bucharest_2_day7
    :parameters ()
    :precondition (and (at bucharest) (at-day day7) (not (done_bucharest_2)))
    :effect (and (not (at-day day7)) (at-day day8) (done_bucharest_2))
  )
  (:action stay_bucharest_2_day8
    :parameters ()
    :precondition (and (at bucharest) (at-day day8) (not (done_bucharest_2)))
    :effect (and (not (at-day day8)) (at-day day9) (done_bucharest_2))
  )
  (:action stay_bucharest_2_day9
    :parameters ()
    :precondition (and (at bucharest) (at-day day9) (not (done_bucharest_2)))
    :effect (and (not (at-day day9)) (at-day day10) (done_bucharest_2))
  )
  (:action stay_bucharest_2_day10
    :parameters ()
    :precondition (and (at bucharest) (at-day day10) (not (done_bucharest_2)))
    :effect (and (not (at-day day10)) (at-day day11) (done_bucharest_2))
  )

  (:action stay_bucharest_3_day0
    :parameters ()
    :precondition (and (at bucharest) (at-day day0) (not (done_bucharest_3)))
    :effect (and (not (at-day day0)) (at-day day1) (done_bucharest_3))
  )
  (:action stay_bucharest_3_day1
    :parameters ()
    :precondition (and (at bucharest) (at-day day1) (not (done_bucharest_3)))
    :effect (and (not (at-day day1)) (at-day day2) (done_bucharest_3))
  )
  (:action stay_bucharest_3_day2
    :parameters ()
    :precondition (and (at bucharest) (at-day day2) (not (done_bucharest_3)))
    :effect (and (not (at-day day2)) (at-day day3) (done_bucharest_3))
  )
  (:action stay_bucharest_3_day3
    :parameters ()
    :precondition (and (at bucharest) (at-day day3) (not (done_bucharest_3)))
    :effect (and (not (at-day day3)) (at-day day4) (done_bucharest_3))
  )
  (:action stay_bucharest_3_day4
    :parameters ()
    :precondition (and (at bucharest) (at-day day4) (not (done_bucharest_3)))
    :effect (and (not (at-day day4)) (at-day day5) (done_bucharest_3))
  )
  (:action stay_bucharest_3_day5
    :parameters ()
    :precondition (and (at bucharest) (at-day day5) (not (done_bucharest_3)))
    :effect (and (not (at-day day5)) (at-day day6) (done_bucharest_3))
  )
  (:action stay_bucharest_3_day6
    :parameters ()
    :precondition (and (at bucharest) (at-day day6) (not (done_bucharest_3)))
    :effect (and (not (at-day day6)) (at-day day7) (done_bucharest_3))
  )
  (:action stay_bucharest_3_day7
    :parameters ()
    :precondition (and (at bucharest) (at-day day7) (not (done_bucharest_3)))
    :effect (and (not (at-day day7)) (at-day day8) (done_bucharest_3))
  )
  (:action stay_bucharest_3_day8
    :parameters ()
    :precondition (and (at bucharest) (at-day day8) (not (done_bucharest_3)))
    :effect (and (not (at-day day8)) (at-day day9) (done_bucharest_3))
  )
  (:action stay_bucharest_3_day9
    :parameters ()
    :precondition (and (at bucharest) (at-day day9) (not (done_bucharest_3)))
    :effect (and (not (at-day day9)) (at-day day10) (done_bucharest_3))
  )
  (:action stay_bucharest_3_day10
    :parameters ()
    :precondition (and (at bucharest) (at-day day10) (not (done_bucharest_3)))
    :effect (and (not (at-day day10)) (at-day day11) (done_bucharest_3))
  )

  (:action stay_bucharest_4_day0
    :parameters ()
    :precondition (and (at bucharest) (at-day day0) (not (done_bucharest_4)))
    :effect (and (not (at-day day0)) (at-day day1) (done_bucharest_4))
  )
  (:action stay_bucharest_4_day1
    :parameters ()
    :precondition (and (at bucharest) (at-day day1) (not (done_bucharest_4)))
    :effect (and (not (at-day day1)) (at-day day2) (done_bucharest_4))
  )
  (:action stay_bucharest_4_day2
    :parameters ()
    :precondition (and (at bucharest) (at-day day2) (not (done_bucharest_4)))
    :effect (and (not (at-day day2)) (at-day day3) (done_bucharest_4))
  )
  (:action stay_bucharest_4_day3
    :parameters ()
    :precondition (and (at bucharest) (at-day day3) (not (done_bucharest_4)))
    :effect (and (not (at-day day3)) (at-day day4) (done_bucharest_4))
  )
  (:action stay_bucharest_4_day4
    :parameters ()
    :precondition (and (at bucharest) (at-day day4) (not (done_bucharest_4)))
    :effect (and (not (at-day day4)) (at-day day5) (done_bucharest_4))
  )
  (:action stay_bucharest_4_day5
    :parameters ()
    :precondition (and (at bucharest) (at-day day5) (not (done_bucharest_4)))
    :effect (and (not (at-day day5)) (at-day day6) (done_bucharest_4))
  )
  (:action stay_bucharest_4_day6
    :parameters ()
    :precondition (and (at bucharest) (at-day day6) (not (done_bucharest_4)))
    :effect (and (not (at-day day6)) (at-day day7) (done_bucharest_4))
  )
  (:action stay_bucharest_4_day7
    :parameters ()
    :precondition (and (at bucharest) (at-day day7) (not (done_bucharest_4)))
    :effect (and (not (at-day day7)) (at-day day8) (done_bucharest_4))
  )
  (:action stay_bucharest_4_day8
    :parameters ()
    :precondition (and (at bucharest) (at-day day8) (not (done_bucharest_4)))
    :effect (and (not (at-day day8)) (at-day day9) (done_bucharest_4))
  )
  (:action stay_bucharest_4_day9
    :parameters ()
    :precondition (and (at bucharest) (at-day day9) (not (done_bucharest_4)))
    :effect (and (not (at-day day9)) (at-day day10) (done_bucharest_4))
  )
  (:action stay_bucharest_4_day10
    :parameters ()
    :precondition (and (at bucharest) (at-day day10) (not (done_bucharest_4)))
    :effect (and (not (at-day day10)) (at-day day11) (done_bucharest_4))
  )

  (:action meet_friends_in_bucharest_day6
    :parameters ()
    :precondition (and (at bucharest) (at-day day6) (not (met)))
    :effect (and (met))
  )
  (:action meet_friends_in_bucharest_day7
    :parameters ()
    :precondition (and (at bucharest) (at-day day7) (not (met)))
    :effect (and (met))
  )
  (:action meet_friends_in_bucharest_day8
    :parameters ()
    :precondition (and (at bucharest) (at-day day8) (not (met)))
    :effect (and (met))
  )
  (:action meet_friends_in_bucharest_day9
    :parameters ()
    :precondition (and (at bucharest) (at-day day9) (not (met)))
    :effect (and (met))
  )
  (:action meet_friends_in_bucharest_day10
    :parameters ()
    :precondition (and (at bucharest) (at-day day10) (not (met)))
    :effect (and (met))
  )
  (:action meet_friends_in_bucharest_day11
    :parameters ()
    :precondition (and (at bucharest) (at-day day11) (not (met)))
    :effect (and (met))
  )
)