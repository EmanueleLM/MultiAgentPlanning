(define (domain trip_planning_example_44)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at_city ?c - city ?d - day)
    (counted ?c - city ?d - day)
    (stay_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (count_succ ?n1 ?n2 - count)
    (has_flight ?c1 ?c2 - city)
  )

  (:action record_stay
    :parameters (?c - city ?d - day ?n_before ?n_after - count)
    :precondition (and (at_city ?c ?d)
                       (stay_count ?c ?n_before)
                       (count_succ ?n_before ?n_after)
                       (not (counted ?c ?d)))
    :effect (and (not (stay_count ?c ?n_before))
                 (stay_count ?c ?n_after)
                 (counted ?c ?d))
  )

  (:action fly
    :parameters (?c_from ?c_to - city ?d - day)
    :precondition (and (at_city ?c_from ?d)
                       (has_flight ?c_from ?c_to))
    :effect (and (not (at_city ?c_from ?d))
                 (at_city ?c_to ?d))
  )

  (:action move_next_day
    :parameters (?c - city ?d_now ?d_next - day)
    :precondition (and (at_city ?c ?d_now)
                       (next_day ?d_now ?d_next))
    :effect (and (not (at_city ?c ?d_now))
                 (at_city ?c ?d_next))
  )
)