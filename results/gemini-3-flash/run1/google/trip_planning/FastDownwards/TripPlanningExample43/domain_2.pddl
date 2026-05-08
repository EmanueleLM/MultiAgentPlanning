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

  ;; Start the trip at a selected city on Day 1.
  (:action start_trip
    :parameters (?c - city)
    :precondition (at_start)
    :effect (and 
      (not (at_start)) 
      (at ?c)
    )
  )

  ;; Meet friends in Venice if currently there during the allowed time window.
  (:action meet_friends
    :parameters (?c - city ?d - day)
    :precondition (and 
      (at ?c) 
      (is_venice ?c) 
      (current_day ?d) 
      (friend_window ?d)
    )
    :effect (met_friends)
  )

  ;; Spend a day in the current city. This increments the stay count for this city and moves the timeline forward.
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

  ;; Travel between cities. The travel day counts as a day spent in BOTH the origin and destination cities.
  ;; This allows fitting 12 city-days (4+4+4) into a 10-day total trip duration by utilizing 2 flight days.
  (:action spend_day_flying
    :parameters (?from - city ?to - city ?d_now - day ?d_next - day ?c_f_now - count ?c_f_next - count ?c_t_now - count ?c_t_next - count)
    :precondition (and
      (at ?from)
      (flight ?from ?to)
      (current_day ?d_now)
      (next_day ?d_now ?d_next)
      (visit_count ?from ?c_f_now)
      (next_count ?c_f_now ?c_f_next)
      (visit_count ?to ?c_t_now)
      (next_count ?c_t_now ?c_t_next)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d_now))
      (current_day ?d_next)
      (not (visit_count ?from ?c_f_now))
      (visit_count ?from ?c_f_next)
      (not (visit_count ?to ?c_t_now))
      (visit_count ?to ?c_t_next)
    )
  )
)