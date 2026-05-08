(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:constants
    vienna vilnius valencia - city
    d9 d15 - day
  )
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (day_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (started)
    (is_day_1 ?d - day)
    (conf_9_ok)
    (conf_15_ok)
    (vienna_ready)
    (vilnius_ready)
    (valencia_ready)
    (at_least_5 ?n - count)
    (at_least_7 ?n - count)
  )

  ;; Start the trip on Day 1 in any city
  (:action start_trip
    :parameters (?c - city ?d1 - day ?c0 ?c1 - count)
    :precondition (and (not (started)) (is_day_1 ?d1) (day_count ?c ?c0) (next_count ?c0 ?c1))
    :effect (and (started) (at_city ?c) (current_day ?d1) (not (day_count ?c ?c0)) (day_count ?c ?c1))
  )

  ;; Stay in the current city, progressing time by one day and count by one
  (:action stay
    :parameters (?c - city ?d_from ?d_to - day ?n_from ?n_to - count)
    :precondition (and (started) (at_city ?c) (current_day ?d_from) (next_day ?d_from ?d_to) (day_count ?c ?n_from) (next_count ?n_from ?n_to))
    :effect (and (not (current_day ?d_from)) (current_day ?d_to) (not (day_count ?c ?n_from)) (day_count ?c ?n_to))
  )

  ;; Fly from one city to another, both the origin and destination gain a stay count for the travel day
  (:action fly
    :parameters (?c_from ?c_to - city ?d_from ?d_to - day ?nf_from ?nf_to ?nt_from ?nt_to - count)
    :precondition (and (started) (at_city ?c_from) (can_fly ?c_from ?c_to) (current_day ?d_from) (next_day ?d_from ?d_to) (day_count ?c_from ?nf_from) (next_count ?nf_from ?nf_to) (day_count ?c_to ?nt_from) (next_count ?nt_from ?nt_to))
    :effect (and (not (at_city ?c_from)) (at_city ?c_to) (not (current_day ?d_from)) (current_day ?d_to) (not (day_count ?c_from ?nf_from)) (day_count ?c_from ?nf_to) (not (day_count ?c_to ?nt_from)) (day_count ?c_to ?nt_to))
  )

  ;; Conference attendance requirements
  (:action attend_conference_9
    :parameters ()
    :precondition (and (current_day d9) (at_city valencia))
    :effect (conf_9_ok)
  )

  (:action attend_conference_15
    :parameters ()
    :precondition (and (current_day d15) (at_city valencia))
    :effect (conf_15_ok)
  )

  ;; Stay duration verifications
  (:action check_vienna
    :parameters (?n - count)
    :precondition (and (day_count vienna ?n) (at_least_5 ?n))
    :effect (vienna_ready)
  )

  (:action check_vilnius
    :parameters (?n - count)
    :precondition (and (day_count vilnius ?n) (at_least_5 ?n))
    :effect (vilnius_ready)
  )

  (:action check_valencia
    :parameters (?n - count)
    :precondition (and (day_count valencia ?n) (at_least_7 ?n))
    :effect (valencia_ready)
  )
)