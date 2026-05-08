(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)

  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (count_vienna ?c - count)
    (count_vilnius ?c - count)
    (count_valencia ?c - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?c1 ?c2 - count)
    (conf_9_ok)
    (conf_15_ok)
    (vienna_ok)
    (vilnius_ok)
    (valencia_ok)
    (started)
    (is_at_least_5 ?c - count)
    (is_at_least_7 ?c - count)
  )

  ;; Initial starting action to pick a city on Day 1
  (:action start_trip_vienna
    :parameters (?d - day ?c0 ?c1 - count)
    :precondition (and (not (started)) (current_day ?d) (count_vienna ?c0) (next_count ?c0 ?c1))
    :effect (and (started) (at_city vienna) (not (count_vienna ?c0)) (count_vienna ?c1))
  )

  (:action start_trip_vilnius
    :parameters (?d - day ?c0 ?c1 - count)
    :precondition (and (not (started)) (current_day ?d) (count_vilnius ?c0) (next_count ?c0 ?c1))
    :effect (and (started) (at_city vilnius) (not (count_vilnius ?c0)) (count_vilnius ?c1))
  )

  (:action start_trip_valencia
    :parameters (?d - day ?c0 ?c1 - count)
    :precondition (and (not (started)) (current_day ?d) (count_valencia ?c0) (next_count ?c0 ?c1))
    :effect (and (started) (at_city valencia) (not (count_valencia ?c0)) (count_valencia ?c1))
  )

  ;; Stay actions: increments the current city's stay count and moves to the next day
  (:action stay_vienna
    :parameters (?d_prev ?d_now - day ?c_prev ?c_now - count)
    :precondition (and (started) (at_city vienna) (current_day ?d_prev) (next_day ?d_prev ?d_now) (count_vienna ?c_prev) (next_count ?c_prev ?c_now))
    :effect (and (not (current_day ?d_prev)) (current_day ?d_now) (not (count_vienna ?c_prev)) (count_vienna ?c_now))
  )

  (:action stay_vilnius
    :parameters (?d_prev ?d_now - day ?c_prev ?c_now - count)
    :precondition (and (started) (at_city vilnius) (current_day ?d_prev) (next_day ?d_prev ?d_now) (count_vilnius ?c_prev) (next_count ?c_prev ?c_now))
    :effect (and (not (current_day ?d_prev)) (current_day ?d_now) (not (count_vilnius ?c_prev)) (count_vilnius ?c_now))
  )

  (:action stay_valencia
    :parameters (?d_prev ?d_now - day ?c_prev ?c_now - count)
    :precondition (and (started) (at_city valencia) (current_day ?d_prev) (next_day ?d_prev ?d_now) (count_valencia ?c_prev) (next_count ?c_prev ?c_now))
    :effect (and (not (current_day ?d_prev)) (current_day ?d_now) (not (count_valencia ?c_prev)) (count_valencia ?c_now))
  )

  ;; Flight actions: increments both the departure and arrival city's stay counts for the flight day
  (:action fly_vienna_valencia
    :parameters (?d_prev ?d_now - day ?c_vienna_prev ?c_vienna_now ?c_valencia_prev ?c_valencia_now - count)
    :precondition (and (started) (at_city vienna) (current_day ?d_prev) (next_day ?d_prev ?d_now) (count_vienna ?c_vienna_prev) (next_count ?c_vienna_prev ?c_vienna_now) (count_valencia ?c_valencia_prev) (next_count ?c_valencia_prev ?c_valencia_now))
    :effect (and (not (at_city vienna)) (at_city valencia) (not (current_day ?d_prev)) (current_day ?d_now) (not (count_vienna ?c_vienna_prev)) (count_vienna ?c_vienna_now) (not (count_valencia ?c_valencia_prev)) (count_valencia ?c_valencia_now))
  )

  (:action fly_valencia_vienna
    :parameters (?d_prev ?d_now - day ?c_valencia_prev ?c_valencia_now ?c_vienna_prev ?c_vienna_now - count)
    :precondition (and (started) (at_city valencia) (current_day ?d_prev) (next_day ?d_prev ?d_now) (count_valencia ?c_valencia_prev) (next_count ?c_valencia_prev ?c_valencia_now) (count_vienna ?c_vienna_prev) (next_count ?c_vienna_prev ?c_vienna_now))
    :effect (and (not (at_city valencia)) (at_city vienna) (not (current_day ?d_prev)) (current_day ?d_now) (not (count_valencia ?c_valencia_prev)) (count_valencia ?c_valencia_now) (not (count_vienna ?c_vienna_prev)) (count_vienna ?c_vienna_now))
  )

  (:action fly_vienna_vilnius
    :parameters (?d_prev ?d_now - day ?c_vienna_prev ?c_vienna_now ?c_vilnius_prev ?c_vilnius_now - count)
    :precondition (and (started) (at_city vienna) (current_day ?d_prev) (next_day ?d_prev ?d_now) (count_vienna ?c_vienna_prev) (next_count ?c_vienna_prev ?c_vienna_now) (count_vilnius ?c_vilnius_prev) (next_count ?c_vilnius_prev ?c_vilnius_now))
    :effect (and (not (at_city vienna)) (at_city vilnius) (not (current_day ?d_prev)) (current_day ?d_now) (not (count_vienna ?c_vienna_prev)) (count_vienna ?c_vienna_now) (not (count_vilnius ?c_vilnius_prev)) (count_vilnius ?c_vilnius_now))
  )

  (:action fly_vilnius_vienna
    :parameters (?d_prev ?d_now - day ?c_vilnius_prev ?c_vilnius_now ?c_vienna_prev ?c_vienna_now - count)
    :precondition (and (started) (at_city vilnius) (current_day ?d_prev) (next_day ?d_prev ?d_now) (count_vilnius ?c_vilnius_prev) (next_count ?c_vilnius_prev ?c_vilnius_now) (count_vienna ?c_vienna_prev) (next_count ?c_vienna_prev ?c_vienna_now))
    :effect (and (not (at_city vilnius)) (at_city vienna) (not (current_day ?d_prev)) (current_day ?d_now) (not (count_vilnius ?c_vilnius_prev)) (count_vilnius ?c_vilnius_now) (not (count_vienna ?c_vienna_prev)) (count_vienna ?c_vienna_now))
  )

  ;; Conference attendance checks
  (:action attend_conf_9
    :parameters ()
    :precondition (and (current_day d9) (at_city valencia))
    :effect (conf_9_ok)
  )

  (:action attend_conf_15
    :parameters ()
    :precondition (and (current_day d15) (at_city valencia))
    :effect (conf_15_ok)
  )

  ;; Threshold satisfaction checks
  (:action satisfy_vienna
    :parameters (?c - count)
    :precondition (and (count_vienna ?c) (is_at_least_5 ?c))
    :effect (vienna_ok)
  )

  (:action satisfy_vilnius
    :parameters (?c - count)
    :precondition (and (count_vilnius ?c) (is_at_least_5 ?c))
    :effect (vilnius_ok)
  )

  (:action satisfy_valencia
    :parameters (?c - count)
    :precondition (and (count_valencia ?c) (is_at_least_7 ?c))
    :effect (valencia_ok)
  )
)