(define (domain integrated-trip)
  (:requirements :typing :strips :adl)
  (:types city day)
  (:constants bucharest - city day5 day6 - day)

  (:predicates
    (at ?c - city ?d - day)
    (direct ?c1 - city ?c2 - city)
    (next ?d1 - day ?d2 - day)
    (met-friend)
  )

  (:action flight_fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (next ?d ?d2) (direct ?from ?to))
    :effect (and (at ?to ?d2))
  )

  (:action flight_stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2))
    :effect (and (at ?c ?d2))
  )

  (:action traveler_start_at
    :parameters (?c - city ?d - day)
    :precondition (and)
    :effect (and (at ?c ?d))
  )

  (:action traveler_fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (next ?d ?d2) (direct ?from ?to))
    :effect (and (at ?to ?d2))
  )

  (:action traveler_stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2))
    :effect (and (at ?c ?d2))
  )

  (:action traveler_meet_friend_day5
    :parameters ()
    :precondition (and (at bucharest day5))
    :effect (and (met-friend))
  )

  (:action traveler_meet_friend_day6
    :parameters ()
    :precondition (and (at bucharest day6))
    :effect (and (met-friend))
  )
)