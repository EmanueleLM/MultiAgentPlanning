(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:constants vienna vilnius valencia - city)
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (stay_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (started)
    (conf_9_attended)
    (conf_15_attended)
    (vienna_ready)
    (vilnius_ready)
    (valencia_ready)
    (at_least_5 ?n - count)
    (at_least_7 ?n - count)
  )

  ;; Initialize the trip on Day 1
  (:action start_trip
    :parameters (?c - city ?c0 ?c1 - count)
    :precondition (and (not (started)) (stay_count ?c ?c0) (next_count ?c0 ?c1))
    :effect (and (started) (at_city ?c) (current_day d1) (not (stay_count ?c ?c0)) (stay_count ?c ?c1))
  )

  ;; Stay in the same city for the next day
  (:action stay
    :parameters (?c - city ?d_prev ?d_now - day ?c_prev ?c_now - count)
    :precondition (and (started) (at_city ?c) (current_day ?d_prev) (next_day ?d_prev ?d_now) (stay_count ?c ?c_prev) (next_count ?c_prev ?c_now))
    :effect (and (not (current_day ?d_prev)) (current_day ?d_now) (not (stay_count ?c ?c_prev)) (stay_count ?c ?c_now))
  )

  ;; Fly from one city to another, incrementing counts for both cities for the travel day
  (:action fly
    :parameters (?c_from ?c_to - city ?d_prev ?d_now - day ?cf_prev ?cf_now ?ct_prev ?ct_now - count)
    :precondition (and (started) (at_city ?c_from) (can_fly ?c_from ?c_to) (current_day ?d_prev) (next_day ?d_prev ?d_now) (stay_count ?c_from ?cf_prev) (next_count ?cf_prev ?cf_now) (stay_count ?c_to ?ct_prev) (next_count ?ct_prev ?ct_now))
    :effect (and (not (at_city ?c_from)) (at_city ?c_to) (not (current_day ?d_prev)) (current_day ?d_now) (not (stay_count ?c_from ?cf_prev)) (stay_count ?c_from ?cf_now) (not (stay_count ?c_to ?ct_prev)) (stay_count ?c_to ?ct_now))
  )

  ;; Attend specific conferences
  (:action attend_conference_9
    :parameters ()
    :precondition (and (current_day d9) (at_city valencia))
    :effect (conf_9_attended)
  )

  (:action attend_conference_15
    :parameters ()
    :precondition (and (current_day d15) (at_city valencia))
    :effect (conf_15_attended)
  )

  ;; Verify stay count thresholds
  (:action check_vienna
    :parameters (?c - count)
    :precondition (and (stay_count vienna ?c) (at_least_5 ?c))
    :effect (vienna_ready)
  )

  (:action check_vilnius
    :parameters (?c - count)
    :precondition (and (stay_count vilnius ?c) (at_least_5 ?c))
    :effect (vilnius_ready)
  )

  (:action check_valencia
    :parameters (?c - count)
    :precondition (and (stay_count valencia ?c) (at_least_7 ?c))
    :effect (valencia_ready)
  )
)