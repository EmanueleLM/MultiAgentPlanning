(define (domain jack_of_all_trades_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day token)

  (:predicates
    (current_day ?d - day)
    (day_succ ?d ?dnext - day)
    (assigned ?d - day ?c - city)
    (token_available ?t - token)
    (token_used ?t - token)
    (token_of ?t - token ?c - city)
    (flight ?c1 - city ?c2 - city)
    (relatives_visited)
  )

  ; -----------------
  ; Day 1 assignments
  ; -----------------
  (:action assign_day1_porto
    :parameters (?t - token)
    :precondition (and
      (current_day day1)
      (token_available ?t)
      (token_of ?t porto)
    )
    :effect (and
      (assigned day1 porto)
      (not (token_available ?t))
      (token_used ?t)
      (not (current_day day1))
      (current_day day2)
      (relatives_visited)
    )
  )

  (:action assign_day1_barcelona
    :parameters (?t - token)
    :precondition (and
      (current_day day1)
      (token_available ?t)
      (token_of ?t barcelona)
    )
    :effect (and
      (assigned day1 barcelona)
      (not (token_available ?t))
      (token_used ?t)
      (not (current_day day1))
      (current_day day2)
    )
  )

  (:action assign_day1_florence
    :parameters (?t - token)
    :precondition (and
      (current_day day1)
      (token_available ?t)
      (token_of ?t florence)
    )
    :effect (and
      (assigned day1 florence)
      (not (token_available ?t))
      (token_used ?t)
      (not (current_day day1))
      (current_day day2)
    )
  )

  ; ----------------------------
  ; Day 2..Day 11 (advance days)
  ; For each predecessor city -> current city allowed by flights
  ; If current city is porto on day2 or day3, add relatives_visited
  ; ----------------------------

  ; day2 actions (prev = day1)
  (:action assign_day2_from_porto_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day2) (assigned day1 porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day2 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day2)) (current_day day3) (relatives_visited))
  )
  (:action assign_day2_from_porto_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day2) (assigned day1 porto) (flight porto barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day2 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day2)) (current_day day3))
  )
  ; porto -> florence not allowed (no direct flight) -> no action

  (:action assign_day2_from_barcelona_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day2) (assigned day1 barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day2 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day2)) (current_day day3))
  )
  (:action assign_day2_from_barcelona_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day2) (assigned day1 barcelona) (flight barcelona porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day2 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day2)) (current_day day3) (relatives_visited))
  )
  (:action assign_day2_from_barcelona_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day2) (assigned day1 barcelona) (flight barcelona florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day2 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day2)) (current_day day3))
  )

  (:action assign_day2_from_florence_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day2) (assigned day1 florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day2 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day2)) (current_day day3))
  )
  (:action assign_day2_from_florence_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day2) (assigned day1 florence) (flight florence barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day2 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day2)) (current_day day3))
  )
  ; florence -> porto not allowed

  ; day3 actions (prev = day2). If current==porto add relatives_visited
  (:action assign_day3_from_porto_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day3) (assigned day2 porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day3 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day3)) (current_day day4) (relatives_visited))
  )
  (:action assign_day3_from_porto_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day3) (assigned day2 porto) (flight porto barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day3 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day3)) (current_day day4))
  )
  ; porto->florence not allowed

  (:action assign_day3_from_barcelona_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day3) (assigned day2 barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day3 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day3)) (current_day day4))
  )
  (:action assign_day3_from_barcelona_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day3) (assigned day2 barcelona) (flight barcelona porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day3 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day3)) (current_day day4) (relatives_visited))
  )
  (:action assign_day3_from_barcelona_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day3) (assigned day2 barcelona) (flight barcelona florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day3 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day3)) (current_day day4))
  )

  (:action assign_day3_from_florence_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day3) (assigned day2 florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day3 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day3)) (current_day day4))
  )
  (:action assign_day3_from_florence_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day3) (assigned day2 florence) (flight florence barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day3 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day3)) (current_day day4))
  )
  ; florence->porto not allowed

  ; day4 actions (prev = day3) - no relatives addition even if porto
  (:action assign_day4_from_porto_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day4) (assigned day3 porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day4 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day4)) (current_day day5))
  )
  (:action assign_day4_from_porto_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day4) (assigned day3 porto) (flight porto barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day4 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day4)) (current_day day5))
  )

  (:action assign_day4_from_barcelona_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day4) (assigned day3 barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day4 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day4)) (current_day day5))
  )
  (:action assign_day4_from_barcelona_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day4) (assigned day3 barcelona) (flight barcelona porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day4 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day4)) (current_day day5))
  )
  (:action assign_day4_from_barcelona_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day4) (assigned day3 barcelona) (flight barcelona florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day4 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day4)) (current_day day5))
  )

  (:action assign_day4_from_florence_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day4) (assigned day3 florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day4 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day4)) (current_day day5))
  )
  (:action assign_day4_from_florence_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day4) (assigned day3 florence) (flight florence barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day4 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day4)) (current_day day5))
  )

  ; day5 actions (prev = day4)
  (:action assign_day5_from_porto_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day5) (assigned day4 porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day5 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day5)) (current_day day6))
  )
  (:action assign_day5_from_porto_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day5) (assigned day4 porto) (flight porto barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day5 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day5)) (current_day day6))
  )

  (:action assign_day5_from_barcelona_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day5) (assigned day4 barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day5 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day5)) (current_day day6))
  )
  (:action assign_day5_from_barcelona_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day5) (assigned day4 barcelona) (flight barcelona porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day5 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day5)) (current_day day6))
  )
  (:action assign_day5_from_barcelona_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day5) (assigned day4 barcelona) (flight barcelona florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day5 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day5)) (current_day day6))
  )

  (:action assign_day5_from_florence_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day5) (assigned day4 florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day5 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day5)) (current_day day6))
  )
  (:action assign_day5_from_florence_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day5) (assigned day4 florence) (flight florence barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day5 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day5)) (current_day day6))
  )

  ; day6 actions (prev = day5)
  (:action assign_day6_from_porto_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day6) (assigned day5 porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day6 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day6)) (current_day day7))
  )
  (:action assign_day6_from_porto_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day6) (assigned day5 porto) (flight porto barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day6 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day6)) (current_day day7))
  )

  (:action assign_day6_from_barcelona_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day6) (assigned day5 barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day6 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day6)) (current_day day7))
  )
  (:action assign_day6_from_barcelona_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day6) (assigned day5 barcelona) (flight barcelona porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day6 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day6)) (current_day day7))
  )
  (:action assign_day6_from_barcelona_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day6) (assigned day5 barcelona) (flight barcelona florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day6 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day6)) (current_day day7))
  )

  (:action assign_day6_from_florence_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day6) (assigned day5 florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day6 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day6)) (current_day day7))
  )
  (:action assign_day6_from_florence_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day6) (assigned day5 florence) (flight florence barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day6 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day6)) (current_day day7))
  )

  ; day7 actions (prev = day6)
  (:action assign_day7_from_porto_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day7) (assigned day6 porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day7 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day7)) (current_day day8))
  )
  (:action assign_day7_from_porto_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day7) (assigned day6 porto) (flight porto barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day7 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day7)) (current_day day8))
  )

  (:action assign_day7_from_barcelona_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day7) (assigned day6 barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day7 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day7)) (current_day day8))
  )
  (:action assign_day7_from_barcelona_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day7) (assigned day6 barcelona) (flight barcelona porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day7 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day7)) (current_day day8))
  )
  (:action assign_day7_from_barcelona_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day7) (assigned day6 barcelona) (flight barcelona florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day7 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day7)) (current_day day8))
  )

  (:action assign_day7_from_florence_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day7) (assigned day6 florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day7 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day7)) (current_day day8))
  )
  (:action assign_day7_from_florence_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day7) (assigned day6 florence) (flight florence barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day7 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day7)) (current_day day8))
  )

  ; day8 actions (prev = day7)
  (:action assign_day8_from_porto_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day8) (assigned day7 porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day8 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day8)) (current_day day9))
  )
  (:action assign_day8_from_porto_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day8) (assigned day7 porto) (flight porto barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day8 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day8)) (current_day day9))
  )

  (:action assign_day8_from_barcelona_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day8) (assigned day7 barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day8 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day8)) (current_day day9))
  )
  (:action assign_day8_from_barcelona_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day8) (assigned day7 barcelona) (flight barcelona porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day8 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day8)) (current_day day9))
  )
  (:action assign_day8_from_barcelona_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day8) (assigned day7 barcelona) (flight barcelona florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day8 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day8)) (current_day day9))
  )

  (:action assign_day8_from_florence_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day8) (assigned day7 florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day8 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day8)) (current_day day9))
  )
  (:action assign_day8_from_florence_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day8) (assigned day7 florence) (flight florence barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day8 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day8)) (current_day day9))
  )

  ; day9 actions (prev = day8)
  (:action assign_day9_from_porto_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day9) (assigned day8 porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day9 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day9)) (current_day day10))
  )
  (:action assign_day9_from_porto_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day9) (assigned day8 porto) (flight porto barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day9 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day9)) (current_day day10))
  )

  (:action assign_day9_from_barcelona_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day9) (assigned day8 barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day9 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day9)) (current_day day10))
  )
  (:action assign_day9_from_barcelona_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day9) (assigned day8 barcelona) (flight barcelona porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day9 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day9)) (current_day day10))
  )
  (:action assign_day9_from_barcelona_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day9) (assigned day8 barcelona) (flight barcelona florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day9 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day9)) (current_day day10))
  )

  (:action assign_day9_from_florence_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day9) (assigned day8 florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day9 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day9)) (current_day day10))
  )
  (:action assign_day9_from_florence_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day9) (assigned day8 florence) (flight florence barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day9 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day9)) (current_day day10))
  )

  ; day10 actions (prev = day9)
  (:action assign_day10_from_porto_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day10) (assigned day9 porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day10 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day10)) (current_day day11))
  )
  (:action assign_day10_from_porto_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day10) (assigned day9 porto) (flight porto barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day10 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day10)) (current_day day11))
  )

  (:action assign_day10_from_barcelona_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day10) (assigned day9 barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day10 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day10)) (current_day day11))
  )
  (:action assign_day10_from_barcelona_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day10) (assigned day9 barcelona) (flight barcelona porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day10 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day10)) (current_day day11))
  )
  (:action assign_day10_from_barcelona_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day10) (assigned day9 barcelona) (flight barcelona florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day10 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day10)) (current_day day11))
  )

  (:action assign_day10_from_florence_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day10) (assigned day9 florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day10 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day10)) (current_day day11))
  )
  (:action assign_day10_from_florence_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day10) (assigned day9 florence) (flight florence barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day10 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day10)) (current_day day11))
  )

  ; day11 actions (prev = day10)
  (:action assign_day11_from_porto_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day11) (assigned day10 porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day11 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day11)) (current_day day12))
  )
  (:action assign_day11_from_porto_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day11) (assigned day10 porto) (flight porto barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day11 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day11)) (current_day day12))
  )

  (:action assign_day11_from_barcelona_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day11) (assigned day10 barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day11 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day11)) (current_day day12))
  )
  (:action assign_day11_from_barcelona_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day11) (assigned day10 barcelona) (flight barcelona porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day11 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day11)) (current_day day12))
  )
  (:action assign_day11_from_barcelona_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day11) (assigned day10 barcelona) (flight barcelona florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day11 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day11)) (current_day day12))
  )

  (:action assign_day11_from_florence_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day11) (assigned day10 florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day11 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day11)) (current_day day12))
  )
  (:action assign_day11_from_florence_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day11) (assigned day10 florence) (flight florence barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day11 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day11)) (current_day day12))
  )

  ; ----------------------------
  ; Day 12 actions (final day, do not advance current_day)
  ; ----------------------------
  (:action assign_day12_from_porto_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day12) (assigned day11 porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day12 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day12)))
  )
  (:action assign_day12_from_porto_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day12) (assigned day11 porto) (flight porto barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day12 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day12)))
  )

  (:action assign_day12_from_barcelona_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day12) (assigned day11 barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day12 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day12)))
  )
  (:action assign_day12_from_barcelona_to_porto
    :parameters (?t - token)
    :precondition (and (current_day day12) (assigned day11 barcelona) (flight barcelona porto) (token_available ?t) (token_of ?t porto))
    :effect (and (assigned day12 porto) (not (token_available ?t)) (token_used ?t) (not (current_day day12)))
  )
  (:action assign_day12_from_barcelona_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day12) (assigned day11 barcelona) (flight barcelona florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day12 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day12)))
  )

  (:action assign_day12_from_florence_to_florence
    :parameters (?t - token)
    :precondition (and (current_day day12) (assigned day11 florence) (token_available ?t) (token_of ?t florence))
    :effect (and (assigned day12 florence) (not (token_available ?t)) (token_used ?t) (not (current_day day12)))
  )
  (:action assign_day12_from_florence_to_barcelona
    :parameters (?t - token)
    :precondition (and (current_day day12) (assigned day11 florence) (flight florence barcelona) (token_available ?t) (token_of ?t barcelona))
    :effect (and (assigned day12 barcelona) (not (token_available ?t)) (token_used ?t) (not (current_day day12)))
  )

)