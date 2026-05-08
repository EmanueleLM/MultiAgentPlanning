(define (domain jack_of_all_trades_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (unassigned ?d - day)
    (assigned ?c - city ?d - day)
    (direct_flight ?from - city ?to - city)
    (can_travel ?from - city ?to - city)
    (visited_split_early)
  )

  ; Grounded actions for day1 (no previous-day travel constraint)
  (:action assign_day1_reykjavik
    :precondition (unassigned day1)
    :effect (and (assigned reykjavik day1) (not (unassigned day1)))
  )
  (:action assign_day1_milan
    :precondition (unassigned day1)
    :effect (and (assigned milan day1) (not (unassigned day1)))
  )
  (:action assign_day1_split
    :precondition (unassigned day1)
    :effect (and (assigned split day1) (not (unassigned day1)) (visited_split_early))
  )

  ; Grounded actions for transitions day1 -> day2
  (:action assign_day2_reykjavik_from_reykjavik
    :precondition (and (assigned reykjavik day1) (unassigned day2) (can_travel reykjavik reykjavik))
    :effect (and (assigned reykjavik day2) (not (unassigned day2)))
  )
  (:action assign_day2_reykjavik_from_milan
    :precondition (and (assigned milan day1) (unassigned day2) (can_travel milan reykjavik))
    :effect (and (assigned reykjavik day2) (not (unassigned day2)))
  )
  (:action assign_day2_reykjavik_from_split
    :precondition (and (assigned split day1) (unassigned day2) (can_travel split reykjavik))
    :effect (and (assigned reykjavik day2) (not (unassigned day2)))
  )

  (:action assign_day2_milan_from_reykjavik
    :precondition (and (assigned reykjavik day1) (unassigned day2) (can_travel reykjavik milan))
    :effect (and (assigned milan day2) (not (unassigned day2)))
  )
  (:action assign_day2_milan_from_milan
    :precondition (and (assigned milan day1) (unassigned day2) (can_travel milan milan))
    :effect (and (assigned milan day2) (not (unassigned day2)))
  )
  (:action assign_day2_milan_from_split
    :precondition (and (assigned split day1) (unassigned day2) (can_travel split milan))
    :effect (and (assigned milan day2) (not (unassigned day2)))
  )

  (:action assign_day2_split_from_reykjavik
    :precondition (and (assigned reykjavik day1) (unassigned day2) (can_travel reykjavik split))
    :effect (and (assigned split day2) (not (unassigned day2)) (visited_split_early))
  )
  (:action assign_day2_split_from_milan
    :precondition (and (assigned milan day1) (unassigned day2) (can_travel milan split))
    :effect (and (assigned split day2) (not (unassigned day2)) (visited_split_early))
  )
  (:action assign_day2_split_from_split
    :precondition (and (assigned split day1) (unassigned day2) (can_travel split split))
    :effect (and (assigned split day2) (not (unassigned day2)) (visited_split_early))
  )

  ; Grounded actions for transitions day2 -> day3
  (:action assign_day3_reykjavik_from_reykjavik
    :precondition (and (assigned reykjavik day2) (unassigned day3) (can_travel reykjavik reykjavik))
    :effect (and (assigned reykjavik day3) (not (unassigned day3)))
  )
  (:action assign_day3_reykjavik_from_milan
    :precondition (and (assigned milan day2) (unassigned day3) (can_travel milan reykjavik))
    :effect (and (assigned reykjavik day3) (not (unassigned day3)))
  )
  (:action assign_day3_reykjavik_from_split
    :precondition (and (assigned split day2) (unassigned day3) (can_travel split reykjavik))
    :effect (and (assigned reykjavik day3) (not (unassigned day3)))
  )

  (:action assign_day3_milan_from_reykjavik
    :precondition (and (assigned reykjavik day2) (unassigned day3) (can_travel reykjavik milan))
    :effect (and (assigned milan day3) (not (unassigned day3)))
  )
  (:action assign_day3_milan_from_milan
    :precondition (and (assigned milan day2) (unassigned day3) (can_travel milan milan))
    :effect (and (assigned milan day3) (not (unassigned day3)))
  )
  (:action assign_day3_milan_from_split
    :precondition (and (assigned split day2) (unassigned day3) (can_travel split milan))
    :effect (and (assigned milan day3) (not (unassigned day3)))
  )

  (:action assign_day3_split_from_reykjavik
    :precondition (and (assigned reykjavik day2) (unassigned day3) (can_travel reykjavik split))
    :effect (and (assigned split day3) (not (unassigned day3)) (visited_split_early))
  )
  (:action assign_day3_split_from_milan
    :precondition (and (assigned milan day2) (unassigned day3) (can_travel milan split))
    :effect (and (assigned split day3) (not (unassigned day3)) (visited_split_early))
  )
  (:action assign_day3_split_from_split
    :precondition (and (assigned split day2) (unassigned day3) (can_travel split split))
    :effect (and (assigned split day3) (not (unassigned day3)) (visited_split_early))
  )

  ; For the remaining days, create grounded actions for each consecutive pair dayk -> dayk+1
  ; We systematically include all combinations prev_city x curr_city for each day transition.

  ; day3 -> day4
  (:action assign_day4_reykjavik_from_reykjavik
    :precondition (and (assigned reykjavik day3) (unassigned day4) (can_travel reykjavik reykjavik))
    :effect (and (assigned reykjavik day4) (not (unassigned day4)))
  )
  (:action assign_day4_reykjavik_from_milan
    :precondition (and (assigned milan day3) (unassigned day4) (can_travel milan reykjavik))
    :effect (and (assigned reykjavik day4) (not (unassigned day4)))
  )
  (:action assign_day4_reykjavik_from_split
    :precondition (and (assigned split day3) (unassigned day4) (can_travel split reykjavik))
    :effect (and (assigned reykjavik day4) (not (unassigned day4)))
  )

  (:action assign_day4_milan_from_reykjavik
    :precondition (and (assigned reykjavik day3) (unassigned day4) (can_travel reykjavik milan))
    :effect (and (assigned milan day4) (not (unassigned day4)))
  )
  (:action assign_day4_milan_from_milan
    :precondition (and (assigned milan day3) (unassigned day4) (can_travel milan milan))
    :effect (and (assigned milan day4) (not (unassigned day4)))
  )
  (:action assign_day4_milan_from_split
    :precondition (and (assigned split day3) (unassigned day4) (can_travel split milan))
    :effect (and (assigned milan day4) (not (unassigned day4)))
  )

  (:action assign_day4_split_from_reykjavik
    :precondition (and (assigned reykjavik day3) (unassigned day4) (can_travel reykjavik split))
    :effect (and (assigned split day4) (not (unassigned day4)))
  )
  (:action assign_day4_split_from_milan
    :precondition (and (assigned milan day3) (unassigned day4) (can_travel milan split))
    :effect (and (assigned split day4) (not (unassigned day4)))
  )
  (:action assign_day4_split_from_split
    :precondition (and (assigned split day3) (unassigned day4) (can_travel split split))
    :effect (and (assigned split day4) (not (unassigned day4)))
  )

  ; day4 -> day5
  (:action assign_day5_reykjavik_from_reykjavik
    :precondition (and (assigned reykjavik day4) (unassigned day5) (can_travel reykjavik reykjavik))
    :effect (and (assigned reykjavik day5) (not (unassigned day5)))
  )
  (:action assign_day5_reykjavik_from_milan
    :precondition (and (assigned milan day4) (unassigned day5) (can_travel milan reykjavik))
    :effect (and (assigned reykjavik day5) (not (unassigned day5)))
  )
  (:action assign_day5_reykjavik_from_split
    :precondition (and (assigned split day4) (unassigned day5) (can_travel split reykjavik))
    :effect (and (assigned reykjavik day5) (not (unassigned day5)))
  )

  (:action assign_day5_milan_from_reykjavik
    :precondition (and (assigned reykjavik day4) (unassigned day5) (can_travel reykjavik milan))
    :effect (and (assigned milan day5) (not (unassigned day5)))
  )
  (:action assign_day5_milan_from_milan
    :precondition (and (assigned milan day4) (unassigned day5) (can_travel milan milan))
    :effect (and (assigned milan day5) (not (unassigned day5)))
  )
  (:action assign_day5_milan_from_split
    :precondition (and (assigned split day4) (unassigned day5) (can_travel split milan))
    :effect (and (assigned milan day5) (not (unassigned day5)))
  )

  (:action assign_day5_split_from_reykjavik
    :precondition (and (assigned reykjavik day4) (unassigned day5) (can_travel reykjavik split))
    :effect (and (assigned split day5) (not (unassigned day5)))
  )
  (:action assign_day5_split_from_milan
    :precondition (and (assigned milan day4) (unassigned day5) (can_travel milan split))
    :effect (and (assigned split day5) (not (unassigned day5)))
  )
  (:action assign_day5_split_from_split
    :precondition (and (assigned split day4) (unassigned day5) (can_travel split split))
    :effect (and (assigned split day5) (not (unassigned day5)))
  )

  ; day5 -> day6
  (:action assign_day6_reykjavik_from_reykjavik
    :precondition (and (assigned reykjavik day5) (unassigned day6) (can_travel reykjavik reykjavik))
    :effect (and (assigned reykjavik day6) (not (unassigned day6)))
  )
  (:action assign_day6_reykjavik_from_milan
    :precondition (and (assigned milan day5) (unassigned day6) (can_travel milan reykjavik))
    :effect (and (assigned reykjavik day6) (not (unassigned day6)))
  )
  (:action assign_day6_reykjavik_from_split
    :precondition (and (assigned split day5) (unassigned day6) (can_travel split reykjavik))
    :effect (and (assigned reykjavik day6) (not (unassigned day6)))
  )

  (:action assign_day6_milan_from_reykjavik
    :precondition (and (assigned reykjavik day5) (unassigned day6) (can_travel reykjavik milan))
    :effect (and (assigned milan day6) (not (unassigned day6)))
  )
  (:action assign_day6_milan_from_milan
    :precondition (and (assigned milan day5) (unassigned day6) (can_travel milan milan))
    :effect (and (assigned milan day6) (not (unassigned day6)))
  )
  (:action assign_day6_milan_from_split
    :precondition (and (assigned split day5) (unassigned day6) (can_travel split milan))
    :effect (and (assigned milan day6) (not (unassigned day6)))
  )

  (:action assign_day6_split_from_reykjavik
    :precondition (and (assigned reykjavik day5) (unassigned day6) (can_travel reykjavik split))
    :effect (and (assigned split day6) (not (unassigned day6)))
  )
  (:action assign_day6_split_from_milan
    :precondition (and (assigned milan day5) (unassigned day6) (can_travel milan split))
    :effect (and (assigned split day6) (not (unassigned day6)))
  )
  (:action assign_day6_split_from_split
    :precondition (and (assigned split day5) (unassigned day6) (can_travel split split))
    :effect (and (assigned split day6) (not (unassigned day6)))
  )

  ; day6 -> day7
  (:action assign_day7_reykjavik_from_reykjavik
    :precondition (and (assigned reykjavik day6) (unassigned day7) (can_travel reykjavik reykjavik))
    :effect (and (assigned reykjavik day7) (not (unassigned day7)))
  )
  (:action assign_day7_reykjavik_from_milan
    :precondition (and (assigned milan day6) (unassigned day7) (can_travel milan reykjavik))
    :effect (and (assigned reykjavik day7) (not (unassigned day7)))
  )
  (:action assign_day7_reykjavik_from_split
    :precondition (and (assigned split day6) (unassigned day7) (can_travel split reykjavik))
    :effect (and (assigned reykjavik day7) (not (unassigned day7)))
  )

  (:action assign_day7_milan_from_reykjavik
    :precondition (and (assigned reykjavik day6) (unassigned day7) (can_travel reykjavik milan))
    :effect (and (assigned milan day7) (not (unassigned day7)))
  )
  (:action assign_day7_milan_from_milan
    :precondition (and (assigned milan day6) (unassigned day7) (can_travel milan milan))
    :effect (and (assigned milan day7) (not (unassigned day7)))
  )
  (:action assign_day7_milan_from_split
    :precondition (and (assigned split day6) (unassigned day7) (can_travel split milan))
    :effect (and (assigned milan day7) (not (unassigned day7)))
  )

  (:action assign_day7_split_from_reykjavik
    :precondition (and (assigned reykjavik day6) (unassigned day7) (can_travel reykjavik split))
    :effect (and (assigned split day7) (not (unassigned day7)))
  )
  (:action assign_day7_split_from_milan
    :precondition (and (assigned milan day6) (unassigned day7) (can_travel milan split))
    :effect (and (assigned split day7) (not (unassigned day7)))
  )
  (:action assign_day7_split_from_split
    :precondition (and (assigned split day6) (unassigned day7) (can_travel split split))
    :effect (and (assigned split day7) (not (unassigned day7)))
  )

  ; day7 -> day8
  (:action assign_day8_reykjavik_from_reykjavik
    :precondition (and (assigned reykjavik day7) (unassigned day8) (can_travel reykjavik reykjavik))
    :effect (and (assigned reykjavik day8) (not (unassigned day8)))
  )
  (:action assign_day8_reykjavik_from_milan
    :precondition (and (assigned milan day7) (unassigned day8) (can_travel milan reykjavik))
    :effect (and (assigned reykjavik day8) (not (unassigned day8)))
  )
  (:action assign_day8_reykjavik_from_split
    :precondition (and (assigned split day7) (unassigned day8) (can_travel split reykjavik))
    :effect (and (assigned reykjavik day8) (not (unassigned day8)))
  )

  (:action assign_day8_milan_from_reykjavik
    :precondition (and (assigned reykjavik day7) (unassigned day8) (can_travel reykjavik milan))
    :effect (and (assigned milan day8) (not (unassigned day8)))
  )
  (:action assign_day8_milan_from_milan
    :precondition (and (assigned milan day7) (unassigned day8) (can_travel milan milan))
    :effect (and (assigned milan day8) (not (unassigned day8)))
  )
  (:action assign_day8_milan_from_split
    :precondition (and (assigned split day7) (unassigned day8) (can_travel split milan))
    :effect (and (assigned milan day8) (not (unassigned day8)))
  )

  (:action assign_day8_split_from_reykjavik
    :precondition (and (assigned reykjavik day7) (unassigned day8) (can_travel reykjavik split))
    :effect (and (assigned split day8) (not (unassigned day8)))
  )
  (:action assign_day8_split_from_milan
    :precondition (and (assigned milan day7) (unassigned day8) (can_travel milan split))
    :effect (and (assigned split day8) (not (unassigned day8)))
  )
  (:action assign_day8_split_from_split
    :precondition (and (assigned split day7) (unassigned day8) (can_travel split split))
    :effect (and (assigned split day8) (not (unassigned day8)))
  )

  ; day8 -> day9
  (:action assign_day9_reykjavik_from_reykjavik
    :precondition (and (assigned reykjavik day8) (unassigned day9) (can_travel reykjavik reykjavik))
    :effect (and (assigned reykjavik day9) (not (unassigned day9)))
  )
  (:action assign_day9_reykjavik_from_milan
    :precondition (and (assigned milan day8) (unassigned day9) (can_travel milan reykjavik))
    :effect (and (assigned reykjavik day9) (not (unassigned day9)))
  )
  (:action assign_day9_reykjavik_from_split
    :precondition (and (assigned split day8) (unassigned day9) (can_travel split reykjavik))
    :effect (and (assigned reykjavik day9) (not (unassigned day9)))
  )

  (:action assign_day9_milan_from_reykjavik
    :precondition (and (assigned reykjavik day8) (unassigned day9) (can_travel reykjavik milan))
    :effect (and (assigned milan day9) (not (unassigned day9)))
  )
  (:action assign_day9_milan_from_milan
    :precondition (and (assigned milan day8) (unassigned day9) (can_travel milan milan))
    :effect (and (assigned milan day9) (not (unassigned day9)))
  )
  (:action assign_day9_milan_from_split
    :precondition (and (assigned split day8) (unassigned day9) (can_travel split milan))
    :effect (and (assigned milan day9) (not (unassigned day9)))
  )

  (:action assign_day9_split_from_reykjavik
    :precondition (and (assigned reykjavik day8) (unassigned day9) (can_travel reykjavik split))
    :effect (and (assigned split day9) (not (unassigned day9)))
  )
  (:action assign_day9_split_from_milan
    :precondition (and (assigned milan day8) (unassigned day9) (can_travel milan split))
    :effect (and (assigned split day9) (not (unassigned day9)))
  )
  (:action assign_day9_split_from_split
    :precondition (and (assigned split day8) (unassigned day9) (can_travel split split))
    :effect (and (assigned split day9) (not (unassigned day9)))
  )

  ; day9 -> day10
  (:action assign_day10_reykjavik_from_reykjavik
    :precondition (and (assigned reykjavik day9) (unassigned day10) (can_travel reykjavik reykjavik))
    :effect (and (assigned reykjavik day10) (not (unassigned day10)))
  )
  (:action assign_day10_reykjavik_from_milan
    :precondition (and (assigned milan day9) (unassigned day10) (can_travel milan reykjavik))
    :effect (and (assigned reykjavik day10) (not (unassigned day10)))
  )
  (:action assign_day10_reykjavik_from_split
    :precondition (and (assigned split day9) (unassigned day10) (can_travel split reykjavik))
    :effect (and (assigned reykjavik day10) (not (unassigned day10)))
  )

  (:action assign_day10_milan_from_reykjavik
    :precondition (and (assigned reykjavik day9) (unassigned day10) (can_travel reykjavik milan))
    :effect (and (assigned milan day10) (not (unassigned day10)))
  )
  (:action assign_day10_milan_from_milan
    :precondition (and (assigned milan day9) (unassigned day10) (can_travel milan milan))
    :effect (and (assigned milan day10) (not (unassigned day10)))
  )
  (:action assign_day10_milan_from_split
    :precondition (and (assigned split day9) (unassigned day10) (can_travel split milan))
    :effect (and (assigned milan day10) (not (unassigned day10)))
  )

  (:action assign_day10_split_from_reykjavik
    :precondition (and (assigned reykjavik day9) (unassigned day10) (can_travel reykjavik split))
    :effect (and (assigned split day10) (not (unassigned day10)))
  )
  (:action assign_day10_split_from_milan
    :precondition (and (assigned milan day9) (unassigned day10) (can_travel milan split))
    :effect (and (assigned split day10) (not (unassigned day10)))
  )
  (:action assign_day10_split_from_split
    :precondition (and (assigned split day9) (unassigned day10) (can_travel split split))
    :effect (and (assigned split day10) (not (unassigned day10)))
  )

  ; day10 -> day11
  (:action assign_day11_reykjavik_from_reykjavik
    :precondition (and (assigned reykjavik day10) (unassigned day11) (can_travel reykjavik reykjavik))
    :effect (and (assigned reykjavik day11) (not (unassigned day11)))
  )
  (:action assign_day11_reykjavik_from_milan
    :precondition (and (assigned milan day10) (unassigned day11) (can_travel milan reykjavik))
    :effect (and (assigned reykjavik day11) (not (unassigned day11)))
  )
  (:action assign_day11_reykjavik_from_split
    :precondition (and (assigned split day10) (unassigned day11) (can_travel split reykjavik))
    :effect (and (assigned reykjavik day11) (not (unassigned day11)))
  )

  (:action assign_day11_milan_from_reykjavik
    :precondition (and (assigned reykjavik day10) (unassigned day11) (can_travel reykjavik milan))
    :effect (and (assigned milan day11) (not (unassigned day11)))
  )
  (:action assign_day11_milan_from_milan
    :precondition (and (assigned milan day10) (unassigned day11) (can_travel milan milan))
    :effect (and (assigned milan day11) (not (unassigned day11)))
  )
  (:action assign_day11_milan_from_split
    :precondition (and (assigned split day10) (unassigned day11) (can_travel split milan))
    :effect (and (assigned milan day11) (not (unassigned day11)))
  )

  (:action assign_day11_split_from_reykjavik
    :precondition (and (assigned reykjavik day10) (unassigned day11) (can_travel reykjavik split))
    :effect (and (assigned split day11) (not (unassigned day11)))
  )
  (:action assign_day11_split_from_milan
    :precondition (and (assigned milan day10) (unassigned day11) (can_travel milan split))
    :effect (and (assigned split day11) (not (unassigned day11)))
  )
  (:action assign_day11_split_from_split
    :precondition (and (assigned split day10) (unassigned day11) (can_travel split split))
    :effect (and (assigned split day11) (not (unassigned day11)))
  )

  ; day11 -> day12
  (:action assign_day12_reykjavik_from_reykjavik
    :precondition (and (assigned reykjavik day11) (unassigned day12) (can_travel reykjavik reykjavik))
    :effect (and (assigned reykjavik day12) (not (unassigned day12)))
  )
  (:action assign_day12_reykjavik_from_milan
    :precondition (and (assigned milan day11) (unassigned day12) (can_travel milan reykjavik))
    :effect (and (assigned reykjavik day12) (not (unassigned day12)))
  )
  (:action assign_day12_reykjavik_from_split
    :precondition (and (assigned split day11) (unassigned day12) (can_travel split reykjavik))
    :effect (and (assigned reykjavik day12) (not (unassigned day12)))
  )

  (:action assign_day12_milan_from_reykjavik
    :precondition (and (assigned reykjavik day11) (unassigned day12) (can_travel reykjavik milan))
    :effect (and (assigned milan day12) (not (unassigned day12)))
  )
  (:action assign_day12_milan_from_milan
    :precondition (and (assigned milan day11) (unassigned day12) (can_travel milan milan))
    :effect (and (assigned milan day12) (not (unassigned day12)))
  )
  (:action assign_day12_milan_from_split
    :precondition (and (assigned split day11) (unassigned day12) (can_travel split milan))
    :effect (and (assigned milan day12) (not (unassigned day12)))
  )

  (:action assign_day12_split_from_reykjavik
    :precondition (and (assigned reykjavik day11) (unassigned day12) (can_travel reykjavik split))
    :effect (and (assigned split day12) (not (unassigned day12)))
  )
  (:action assign_day12_split_from_milan
    :precondition (and (assigned milan day11) (unassigned day12) (can_travel milan split))
    :effect (and (assigned split day12) (not (unassigned day12)))
  )
  (:action assign_day12_split_from_split
    :precondition (and (assigned split day11) (unassigned day12) (can_travel split split))
    :effect (and (assigned split day12) (not (unassigned day12)))
  )

  ; day12 -> day13
  (:action assign_day13_reykjavik_from_reykjavik
    :precondition (and (assigned reykjavik day12) (unassigned day13) (can_travel reykjavik reykjavik))
    :effect (and (assigned reykjavik day13) (not (unassigned day13)))
  )
  (:action assign_day13_reykjavik_from_milan
    :precondition (and (assigned milan day12) (unassigned day13) (can_travel milan reykjavik))
    :effect (and (assigned reykjavik day13) (not (unassigned day13)))
  )
  (:action assign_day13_reykjavik_from_split
    :precondition (and (assigned split day12) (unassigned day13) (can_travel split reykjavik))
    :effect (and (assigned reykjavik day13) (not (unassigned day13)))
  )

  (:action assign_day13_milan_from_reykjavik
    :precondition (and (assigned reykjavik day12) (unassigned day13) (can_travel reykjavik milan))
    :effect (and (assigned milan day13) (not (unassigned day13)))
  )
  (:action assign_day13_milan_from_milan
    :precondition (and (assigned milan day12) (unassigned day13) (can_travel milan milan))
    :effect (and (assigned milan day13) (not (unassigned day13)))
  )
  (:action assign_day13_milan_from_split
    :precondition (and (assigned split day12) (unassigned day13) (can_travel split milan))
    :effect (and (assigned milan day13) (not (unassigned day13)))
  )

  (:action assign_day13_split_from_reykjavik
    :precondition (and (assigned reykjavik day12) (unassigned day13) (can_travel reykjavik split))
    :effect (and (assigned split day13) (not (unassigned day13)))
  )
  (:action assign_day13_split_from_milan
    :precondition (and (assigned milan day12) (unassigned day13) (can_travel milan split))
    :effect (and (assigned split day13) (not (unassigned day13)))
  )
  (:action assign_day13_split_from_split
    :precondition (and (assigned split day12) (unassigned day13) (can_travel split split))
    :effect (and (assigned split day13) (not (unassigned day13)))
  )
)