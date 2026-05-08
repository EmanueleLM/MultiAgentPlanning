(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (day_less ?d1 ?d2 - day)
    (direct_flight ?c1 ?c2 - city)
    (istanbul_ok)
    (salzburg_ok)
  )

  (:action stay
    :parameters (?c - city ?d_now - day ?d_next - day)
    :precondition (and (at ?c) (current_day ?d_now) (next_day ?d_now ?d_next))
    :effect (and (not (current_day ?d_now)) (current_day ?d_next) (visited ?c ?d_now))
  )

  (:action fly
    :parameters (?c_from - city ?c_to - city ?d_now - day)
    :precondition (and (at ?c_from) (current_day ?d_now) (direct_flight ?c_from ?c_to))
    :effect (and (not (at ?c_from)) (at ?c_to) (visited ?c_from ?d_now) (visited ?c_to ?d_now))
  )

  (:action verify_istanbul
    :parameters (?d1 ?d2 - day)
    :precondition (and (visited istanbul ?d1) (visited istanbul ?d2) (day_less ?d1 ?d2))
    :effect (istanbul_ok)
  )

  (:action verify_salzburg
    :parameters (?d1 ?d2 ?d3 ?d4 ?d5 - day)
    :precondition (and 
      (visited salzburg ?d1) (visited salzburg ?d2) (visited salzburg ?d3) (visited salzburg ?d4) (visited salzburg ?d5)
      (day_less ?d1 ?d2) (day_less ?d2 ?d3) (day_less ?d3 ?d4) (day_less ?d4 ?d5)
    )
    :effect (salzburg_ok)
  )
)