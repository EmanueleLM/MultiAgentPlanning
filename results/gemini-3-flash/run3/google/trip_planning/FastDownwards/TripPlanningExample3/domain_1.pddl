(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:constants
    berlin warsaw bucharest - city
  )
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (at_at_day ?c - city ?d - day)
    (berlin_count ?n - count)
    (warsaw_count ?n - count)
    (bucharest_count ?n - count)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
  )

  ;; Start the trip at a specific city on day 1
  (:action start_at_berlin
    :parameters (?d0 ?d1 - day ?n0 ?n1 - count)
    :precondition (and (current_day ?d0) (next_day ?d0 ?d1) (berlin_count ?n0) (next_count ?n0 ?n1))
    :effect (and (not (current_day ?d0)) (current_day ?d1) (at berlin) (not (berlin_count ?n0)) (berlin_count ?n1) (at_at_day berlin ?d1))
  )

  (:action start_at_warsaw
    :parameters (?d0 ?d1 - day ?n0 ?n1 - count)
    :precondition (and (current_day ?d0) (next_day ?d0 ?d1) (warsaw_count ?n0) (next_count ?n0 ?n1))
    :effect (and (not (current_day ?d0)) (current_day ?d1) (at warsaw) (not (warsaw_count ?n0)) (warsaw_count ?n1) (at_at_day warsaw ?d1))
  )

  (:action start_at_bucharest
    :parameters (?d0 ?d1 - day ?n0 ?n1 - count)
    :precondition (and (current_day ?d0) (next_day ?d0 ?d1) (bucharest_count ?n0) (next_count ?n0 ?n1))
    :effect (and (not (current_day ?d0)) (current_day ?d1) (at bucharest) (not (bucharest_count ?n0)) (bucharest_count ?n1) (at_at_day bucharest ?d1))
  )

  ;; Stay in the current city for another day
  (:action stay_in_berlin
    :parameters (?d_now ?d_next - day ?n_now ?n_next - count)
    :precondition (and (at berlin) (current_day ?d_now) (next_day ?d_now ?d_next) (berlin_count ?n_now) (next_count ?n_now ?n_next))
    :effect (and (not (current_day ?d_now)) (current_day ?d_next) (not (berlin_count ?n_now)) (berlin_count ?n_next) (at_at_day berlin ?d_next))
  )

  (:action stay_in_warsaw
    :parameters (?d_now ?d_next - day ?n_now ?n_next - count)
    :precondition (and (at warsaw) (current_day ?d_now) (next_day ?d_now ?d_next) (warsaw_count ?n_now) (next_count ?n_now ?n_next))
    :effect (and (not (current_day ?d_now)) (current_day ?d_next) (not (warsaw_count ?n_now)) (warsaw_count ?n_next) (at_at_day warsaw ?d_next))
  )

  (:action stay_in_bucharest
    :parameters (?d_now ?d_next - day ?n_now ?n_next - count)
    :precondition (and (at bucharest) (current_day ?d_now) (next_day ?d_now ?d_next) (bucharest_count ?n_now) (next_count ?n_now ?n_next))
    :effect (and (not (current_day ?d_now)) (current_day ?d_next) (not (bucharest_count ?n_now)) (bucharest_count ?n_next) (at_at_day bucharest ?d_next))
  )

  ;; Fly from a city to another city
  (:action fly_to_berlin
    :parameters (?from - city ?d_now ?d_next - day ?n_now ?n_next - count)
    :precondition (and (at ?from) (can_fly ?from berlin) (current_day ?d_now) (next_day ?d_now ?d_next) (berlin_count ?n_now) (next_count ?n_now ?n_next))
    :effect (and (not (at ?from)) (at berlin) (not (current_day ?d_now)) (current_day ?d_next) (not (berlin_count ?n_now)) (berlin_count ?n_next) (at_at_day berlin ?d_next))
  )

  (:action fly_to_warsaw
    :parameters (?from - city ?d_now ?d_next - day ?n_now ?n_next - count)
    :precondition (and (at ?from) (can_fly ?from warsaw) (current_day ?d_now) (next_day ?d_now ?d_next) (warsaw_count ?n_now) (next_count ?n_now ?n_next))
    :effect (and (not (at ?from)) (at warsaw) (not (current_day ?d_now)) (current_day ?d_next) (not (warsaw_count ?n_now)) (warsaw_count ?n_next) (at_at_day warsaw ?d_next))
  )

  (:action fly_to_bucharest
    :parameters (?from - city ?d_now ?d_next - day ?n_now ?n_next - count)
    :precondition (and (at ?from) (can_fly ?from bucharest) (current_day ?d_now) (next_day ?d_now ?d_next) (bucharest_count ?n_now) (next_count ?n_now ?n_next))
    :effect (and (not (at ?from)) (at bucharest) (not (current_day ?d_now)) (current_day ?d_next) (not (bucharest_count ?n_now)) (bucharest_count ?n_next) (at_at_day bucharest ?d_next))
  )
)