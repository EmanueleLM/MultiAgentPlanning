(define (domain european_trip_16_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)

    (in_porto ?d - day)
    (in_berlin ?d - day)
    (in_reykjavik ?d - day)

    (meeting_day ?d - day)
    (met_friend)
  )

  (:action stay_porto
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at porto)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (in_porto ?d_next)
    )
  )

  (:action stay_berlin
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at berlin)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (in_berlin ?d_next)
    )
  )

  (:action stay_reykjavik
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at reykjavik)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (in_reykjavik ?d_next)
    )
  )

  (:action meet_friend_in_reykjavik
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at reykjavik)
      (meeting_day ?d_next)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (in_reykjavik ?d_next)
      (met_friend)
    )
  )

  (:action fly_porto_berlin
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at porto)
      (direct porto berlin)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at porto))
      (at berlin)
      (in_berlin ?d_next)
    )
  )

  (:action fly_berlin_porto
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at berlin)
      (direct berlin porto)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at berlin))
      (at porto)
      (in_porto ?d_next)
    )
  )

  (:action fly_berlin_reykjavik
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at berlin)
      (direct berlin reykjavik)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at berlin))
      (at reykjavik)
      (in_reykjavik ?d_next)
    )
  )

  (:action fly_berlin_reykjavik_meet
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at berlin)
      (direct berlin reykjavik)
      (meeting_day ?d_next)
      (not (met_friend))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at berlin))
      (at reykjavik)
      (in_reykjavik ?d_next)
      (met_friend)
    )
  )

  (:action fly_reykjavik_berlin
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at reykjavik)
      (direct reykjavik berlin)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at reykjavik))
      (at berlin)
      (in_berlin ?d_next)
    )
  )
)