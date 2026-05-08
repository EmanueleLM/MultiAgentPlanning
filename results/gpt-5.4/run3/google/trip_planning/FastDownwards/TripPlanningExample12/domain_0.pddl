(define (domain european_trip_15_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day stay_token
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (token_for_city ?t - stay_token ?c - city)
    (unused ?t - stay_token)
    (used ?t - stay_token)
    (meeting_window_day ?d - day)
    (friend_met)
    (ready_to_spend)
    (start_selected)
    (can_start_in ?c - city)
  )

  (:action select_start_city
    :parameters (?c - city)
    :precondition (and
      (not (start_selected))
      (can_start_in ?c)
      (ready_to_spend)
    )
    :effect (and
      (at ?c)
      (start_selected)
    )
  )

  (:action spend_day
    :parameters (?c - city ?d - day ?d_next - day ?t - stay_token)
    :precondition (and
      (start_selected)
      (at ?c)
      (current_day ?d)
      (next_day ?d ?d_next)
      (ready_to_spend)
      (token_for_city ?t ?c)
      (unused ?t)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (ready_to_spend))
      (not (unused ?t))
      (used ?t)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (start_selected)
      (at ?from)
      (direct_flight ?from ?to)
      (not (ready_to_spend))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (ready_to_spend)
    )
  )

  (:action wait
    :parameters ()
    :precondition (and
      (start_selected)
      (not (ready_to_spend))
    )
    :effect (and
      (ready_to_spend)
    )
  )

  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (start_selected)
      (current_day ?d)
      (meeting_window_day ?d)
      (at tallinn)
      (not (friend_met))
    )
    :effect (and
      (friend_met)
    )
  )
)