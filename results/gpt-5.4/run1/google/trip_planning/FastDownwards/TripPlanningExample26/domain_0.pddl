(define (domain european_trip_16_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (direct ?from - city ?to - city)
    (day_assigned ?d - day)
    (spent_in_porto ?d - day)
    (spent_in_berlin ?d - day)
    (spent_in_reykjavik ?d - day)
    (met_friend)
  )

  (:action wait_in_porto
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at porto)
      (not (day_assigned ?d_next))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (day_assigned ?d_next)
      (spent_in_porto ?d_next)
    )
  )

  (:action wait_in_berlin
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at berlin)
      (not (day_assigned ?d_next))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (day_assigned ?d_next)
      (spent_in_berlin ?d_next)
    )
  )

  (:action wait_in_reykjavik
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at reykjavik)
      (not (day_assigned ?d_next))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (day_assigned ?d_next)
      (spent_in_reykjavik ?d_next)
    )
  )

  (:action wait_in_reykjavik_meeting
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at reykjavik)
      (not (day_assigned ?d_next))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (day_assigned ?d_next)
      (spent_in_reykjavik ?d_next)
      (met_friend)
    )
  )

  (:action fly_porto_to_berlin
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at porto)
      (direct porto berlin)
      (not (day_assigned ?d_next))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at porto))
      (at berlin)
      (day_assigned ?d_next)
      (spent_in_berlin ?d_next)
    )
  )

  (:action fly_berlin_to_porto
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at berlin)
      (direct berlin porto)
      (not (day_assigned ?d_next))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at berlin))
      (at porto)
      (day_assigned ?d_next)
      (spent_in_porto ?d_next)
    )
  )

  (:action fly_berlin_to_reykjavik
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at berlin)
      (direct berlin reykjavik)
      (not (day_assigned ?d_next))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at berlin))
      (at reykjavik)
      (day_assigned ?d_next)
      (spent_in_reykjavik ?d_next)
    )
  )

  (:action fly_berlin_to_reykjavik_meeting
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at berlin)
      (direct berlin reykjavik)
      (not (day_assigned ?d_next))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at berlin))
      (at reykjavik)
      (day_assigned ?d_next)
      (spent_in_reykjavik ?d_next)
      (met_friend)
    )
  )

  (:action fly_reykjavik_to_berlin
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at reykjavik)
      (direct reykjavik berlin)
      (not (day_assigned ?d_next))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at reykjavik))
      (at berlin)
      (day_assigned ?d_next)
      (spent_in_berlin ?d_next)
    )
  )
)