(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (next ?d1 ?d2 - day)
    (day_less ?d1 ?d2 - day)
    (direct_flight ?c1 ?c2 - city)
    (is_istanbul ?c - city)
    (is_salzburg ?c - city)
    (istanbul_ok)
    (salzburg_ok)
  )

  (:action stay
    :parameters (?c - city ?d_now - day ?d_next - day)
    :precondition (and (at ?c) (current_day ?d_now) (next ?d_now ?d_next))
    :effect (and (not (current_day ?d_now)) (current_day ?d_next) (visited ?c ?d_now))
  )

  (:action fly
    :parameters (?c_from - city ?c_to - city ?d_now - day ?d_next - day)
    :precondition (and (at ?c_from) (current_day ?d_now) (next ?d_now ?d_next) (direct_flight ?c_from ?c_to))
    :effect (and (not (at ?c_from)) (at ?c_to) (not (current_day ?d_now)) (current_day ?d_next) (visited ?c_from ?d_now) (visited ?c_to ?d_now))
  )

  (:action validate_istanbul
    :parameters (?c - city ?d1 ?d2 - day)
    :precondition (and (is_istanbul ?c) (visited ?c ?d1) (visited ?c ?d2) (day_less ?d1 ?d2))
    :effect (istanbul_ok)
  )

  (:action validate_salzburg
    :parameters (?c - city ?d1 ?d2 ?d3 ?d4 ?d5 - day)
    :precondition (and (is_salzburg ?c)
                       (visited ?c ?d1) (visited ?c ?d2) (visited ?c ?d3) (visited ?c ?d4) (visited ?c ?d5)
                       (day_less ?d1 ?d2) (day_less ?d2 ?d3) (day_less ?d3 ?d4) (day_less ?d4 ?d5))
    :effect (salzburg_ok)
  )
)