(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)           ; traveler is in city on day
    (direct ?from - city ?to - city) ; direct flight exists
    (next-day ?d1 - day ?d2 - day)   ; d2 is the day after d1
    (met-friend)                     ; friend met in Tallinn
    (day-range9-15 ?d - day)         ; day is between 9 and 15 inclusive
  )

  ;; Actions belonging to valencia_agent
  (:action valencia_agent-stay
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at valencia ?d1) (next-day ?d1 ?d2))
    :effect (and (at valencia ?d2))
  )

  (:action valencia_agent-fly-valencia-to-amsterdam
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at valencia ?d1) (direct valencia amsterdam) (next-day ?d1 ?d2))
    :effect (and (at amsterdam ?d2))
  )

  ;; Actions belonging to amsterdam_agent
  (:action amsterdam_agent-stay
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at amsterdam ?d1) (next-day ?d1 ?d2))
    :effect (and (at amsterdam ?d2))
  )

  (:action amsterdam_agent-fly-amsterdam-to-tallinn
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at amsterdam ?d1) (direct amsterdam tallinn) (next-day ?d1 ?d2))
    :effect (and (at tallinn ?d2))
  )

  (:action amsterdam_agent-fly-amsterdam-to-valencia
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at amsterdam ?d1) (direct amsterdam valencia) (next-day ?d1 ?d2))
    :effect (and (at valencia ?d2))
  )

  ;; Actions for Tallinn (separate agent to model meeting and stays there)
  (:action tallinn_agent-stay
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at tallinn ?d1) (next-day ?d1 ?d2))
    :effect (and (at tallinn ?d2))
  )

  (:action tallinn_agent-meet-friend
    :parameters (?d - day)
    :precondition (and (at tallinn ?d) (day-range9-15 ?d) (not (met-friend)))
    :effect (and (met-friend))
  )
)