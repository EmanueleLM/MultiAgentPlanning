(define (domain integrated_trip_direct_flights)
  (:requirements :strips :typing)
  (:types city day)
  (:constants
    amsterdam santorini istanbul - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (is-amsterdam ?c - city)
    (is-istanbul ?c - city)
    (is-santorini ?c - city)
    (stayed-amsterdam)
    (visited-relatives-santorini)
    (relatives-visited-any)
    (will-start ?c - city)
  )

  (:action a1_stay_amsterdam_7
    :parameters (?d1 ?d2 ?d3 ?d4 ?d5 ?d6 ?d7 - day)
    :precondition (and
      (at amsterdam ?d1)
      (next ?d1 ?d2) (next ?d2 ?d3) (next ?d3 ?d4)
      (next ?d4 ?d5) (next ?d5 ?d6) (next ?d6 ?d7)
      (is-amsterdam amsterdam)
    )
    :effect (and
      (at amsterdam ?d2) (at amsterdam ?d3) (at amsterdam ?d4)
      (at amsterdam ?d5) (at amsterdam ?d6) (at amsterdam ?d7)
      (stayed-amsterdam)
    )
  )

  (:action a1_stay_istanbul_3
    :parameters (?d1 ?d2 ?d3 - day)
    :precondition (and (at istanbul ?d1) (next ?d1 ?d2) (next ?d2 ?d3) (is-istanbul istanbul))
    :effect (and (at istanbul ?d2) (at istanbul ?d3))
  )

  (:action a1_fly
    :parameters (?from ?to - city ?d1 ?d2 - day)
    :precondition (and (at ?from ?d1) (direct ?from ?to) (next ?d1 ?d2))
    :effect (and (not (at ?from ?d1)) (at ?to ?d2))
  )

  (:action a1_visit_relatives_day12
    :parameters ()
    :precondition (and (at santorini day12) (is-santorini santorini))
    :effect (visited-relatives-santorini)
  )
  (:action a1_visit_relatives_day13
    :parameters ()
    :precondition (and (at santorini day13) (is-santorini santorini))
    :effect (visited-relatives-santorini)
  )
  (:action a1_visit_relatives_day14
    :parameters ()
    :precondition (and (at santorini day14) (is-santorini santorini))
    :effect (visited-relatives-santorini)
  )

  (:action a2_start_in
    :parameters (?c - city)
    :precondition (will-start ?c)
    :effect (and (at ?c day1) (not (will-start ?c)))
  )

  (:action a2_fly
    :parameters (?from ?to - city ?d1 ?d2 - day)
    :precondition (and (at ?from ?d1) (direct ?from ?to) (next ?d1 ?d2))
    :effect (and (not (at ?from ?d1)) (at ?to ?d2))
  )

  (:action a2_stay
    :parameters (?c - city ?d1 ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2))
  )

  (:action a2_visit_relatives_day12
    :parameters ()
    :precondition (at santorini day12)
    :effect (relatives-visited-any)
  )
  (:action a2_visit_relatives_day13
    :parameters ()
    :precondition (at santorini day13)
    :effect (relatives-visited-any)
  )
  (:action a2_visit_relatives_day14
    :parameters ()
    :precondition (at santorini day14)
    :effect (relatives-visited-any)
  )

  (:action a3_stay
    :parameters (?c - city ?d1 ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2))
  )

  (:action a3_fly
    :parameters (?from ?to - city ?d1 ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and (not (at ?from ?d1)) (at ?to ?d2))
  )
)