(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (visit_count ?c - city ?n - count)
    (met_friends)
    (at_start)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
    (friend_window ?d - day)
    (is_venice ?c - city)
  )

  ;; Start the trip at any city on Day 1.
  (:action start_trip
    :parameters (?c - city)
    :precondition (at_start)
    :effect (and (not (at_start)) (at ?c))
  )

  ;; Meet friends in Venice if the current day being spent is in the window.
  (:action meet_friends
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c) (is_venice ?c) (current_day ?d) (friend_window ?d))
    :effect (met_friends)
  )

  ;; Spend a day in the current city, incrementing its visit count and the timeline.
  (:action spend_day_staying
    :parameters (?c - city ?d_now - day ?d_next - day ?c_now - count ?c_next - count)
    :precondition (and
      (at ?c)
      (current_day ?d_now)
      (next_day ?d_now ?d_next)
      (visit_count ?c ?c_now)
      (next_count ?c_now ?c_next)
    )
    :effect (and
      (not (current_day ?d_now))
      (current_day ?d_next)
      (not (visit_count ?c ?c_now))
      (visit_count ?c ?c_next)
    )
  )

  ;; Spend a day flying to a new city, incrementing the destination's visit count and the timeline.
  (:action spend_day_flying
    :parameters (?from - city ?to - city ?d_now - day ?d_next - day ?c_now - count ?c_next - count)
    :precondition (and
      (at ?from)
      (flight ?from ?to)
      (current_day ?d_now)
      (next_day ?d_now ?d_next)
      (visit_count ?to ?c_now)
      (next_count ?c_now ?c_next)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d_now))
      (current_day ?d_next)
      (not (visit_count ?to ?c_now))
      (visit_count ?to ?c_next)
    )
  )
)