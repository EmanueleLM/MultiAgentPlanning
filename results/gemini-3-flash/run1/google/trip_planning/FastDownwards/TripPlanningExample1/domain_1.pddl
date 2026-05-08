(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city step count)
  (:predicates
    (at ?c - city)
    (current_step ?s - step)
    (stay_count ?c - city ?n - count)
    (next_step ?s1 ?s2 - step)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (ready)
  )

  ;; Initial action to choose the starting city without consuming a day.
  (:action start
    :parameters (?c - city)
    :precondition (ready)
    :effect (and (not (ready)) (at ?c))
  )

  ;; Flying between cities is modeled as an instantaneous transition.
  ;; The actual time is consumed by the spend_day action.
  (:action fly
    :parameters (?from ?to - city)
    :precondition (and (at ?from) (can_fly ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )

  ;; Spending a day in the current city consumes one step and increases the city's stay count.
  (:action spend_day
    :parameters (?c - city ?s_old ?s_new - step ?n_old ?n_new - count)
    :precondition (and (at ?c) 
                       (current_step ?s_old) (next_step ?s_old ?s_new)
                       (stay_count ?c ?n_old) (next_count ?n_old ?n_new))
    :effect (and (not (current_step ?s_old)) (current_step ?s_new)
                 (not (stay_count ?c ?n_old)) (stay_count ?c ?n_new))
  )
)