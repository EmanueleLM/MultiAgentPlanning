(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (visit_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (is_friend_window ?d - day)
    (friend_met)
    (trip_started)
    (flr_goal_met)
    (bcn_goal_met)
    (hel_goal_met)
    (is_day_one ?d - day)
    (flr_at_least_6 ?n - count)
    (bcn_at_least_5 ?n - count)
    (hel_at_least_5 ?n - count)
  )

  (:action start_trip
    :parameters (?c - city ?d - day ?n0 - count ?n1 - count)
    :precondition (and 
      (not (trip_started)) 
      (is_day_one ?d) 
      (visit_count ?c ?n0) 
      (next_count ?n0 ?n1)
    )
    :effect (and 
      (trip_started) 
      (at_city ?c) 
      (current_day ?d) 
      (not (visit_count ?c ?n0)) 
      (visit_count ?c ?n1)
    )
  )

  (:action stay
    :parameters (?c - city ?df - day ?dt - day ?nf - count ?nt - count)
    :precondition (and 
      (trip_started) 
      (at_city ?c) 
      (current_day ?df) 
      (next_day ?df ?dt) 
      (visit_count ?c ?nf) 
      (next_count ?nf ?nt)
    )
    :effect (and 
      (not (current_day ?df)) 
      (current_day ?dt) 
      (not (visit_count ?c ?nf)) 
      (visit_count ?c ?nt)
    )
  )

  (:action fly
    :parameters (?cf - city ?ct - city ?df - day ?dt - day ?nf - count ?nt - count)
    :precondition (and 
      (trip_started) 
      (at_city ?cf) 
      (can_fly ?cf ?ct) 
      (current_day ?df) 
      (next_day ?df ?dt) 
      (visit_count ?ct ?nf) 
      (next_count ?nf ?nt)
    )
    :effect (and 
      (not (at_city ?cf)) 
      (at_city ?ct) 
      (not (current_day ?df)) 
      (current_day ?dt) 
      (not (visit_count ?ct ?nf)) 
      (visit_count ?ct ?nt)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and 
      (at_city florence) 
      (current_day ?d) 
      (is_friend_window ?d)
    )
    :effect (and 
      (friend_met)
    )
  )

  (:action check_flr_quota
    :parameters (?n - count)
    :precondition (and 
      (visit_count florence ?n) 
      (flr_at_least_6 ?n)
    )
    :effect (and 
      (flr_goal_met)
    )
  )

  (:action check_bcn_quota
    :parameters (?n - count)
    :precondition (and 
      (visit_count barcelona ?n) 
      (bcn_at_least_5 ?n)
    )
    :effect (and 
      (bcn_goal_met)
    )
  )

  (:action check_hel_quota
    :parameters (?n - count)
    :precondition (and 
      (visit_count helsinki ?n) 
      (hel_at_least_5 ?n)
    )
    :effect (and 
      (hel_goal_met)
    )
  )
)