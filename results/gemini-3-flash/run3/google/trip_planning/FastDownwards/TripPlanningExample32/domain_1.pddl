(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (stayed ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_count ?c1 ?c2 - count)
    (city_count ?c - city ?n - count)
    (can_fly_today)
    (attended ?d - day)
    (show_day ?d - day)
    (can_fly ?c1 ?c2 - city)
  )

  (:action advance_day
    :parameters (?d_old ?d_new - day)
    :precondition (and (current_day ?d_old) (next_day ?d_old ?d_new))
    :effect (and (not (current_day ?d_old)) (current_day ?d_new) (can_fly_today))
  )

  (:action fly
    :parameters (?from ?to - city ?d - day)
    :precondition (and (at ?from) (current_day ?d) (can_fly ?from ?to) (can_fly_today))
    :effect (and (not (at ?from)) (at ?to) (not (can_fly_today)))
  )

  (:action record_stay
    :parameters (?c - city ?d - day ?n_old ?n_new - count)
    :precondition (and (at ?c) (current_day ?d) (not (stayed ?c ?d))
                       (city_count ?c ?n_old) (next_count ?n_old ?n_new))
    :effect (and (not (city_count ?c ?n_old)) (city_count ?c ?n_new) (stayed ?c ?d))
  )

  (:action attend_show
    :parameters (?d - day)
    :precondition (and (at reykjavik) (current_day ?d) (show_day ?d))
    :effect (attended ?d)
  )
)