(define (domain trip-orchestration)
  (:requirements :strips :typing)
  (:types agent city day)

  (:predicates
    (at ?a - agent ?c - city ?d - day)        ; agent ?a is in city ?c on day ?d
    (direct-flight ?c1 - city ?c2 - city)    ; direct flight exists between cities (directed)
    (next ?d1 - day ?d2 - day)               ; d2 is the successor day of d1
    (met-friend)                             ; flag: friend met in Tallinn
  )

  ; ---------------------------
  ; Actions for tallinn_agent
  ; ---------------------------
  (:action stay-tallinn
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at tallinn_agent ?c ?d1) (next ?d1 ?d2))
    :effect (and (at tallinn_agent ?c ?d2))
  )

  (:action fly-tallinn
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at tallinn_agent ?from ?d1) (direct-flight ?from ?to) (next ?d1 ?d2))
    :effect (and (at tallinn_agent ?to ?d2))
  )

  (:action meet-friend-tallinn-day11
    :parameters ()
    :precondition (and (at tallinn_agent tallinn day11))
    :effect (met-friend)
  )

  (:action meet-friend-tallinn-day12
    :parameters ()
    :precondition (and (at tallinn_agent tallinn day12))
    :effect (met-friend)
  )

  ; ---------------------------
  ; Actions for seville_agent
  ; ---------------------------
  (:action stay-seville
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at seville_agent ?c ?d1) (next ?d1 ?d2))
    :effect (and (at seville_agent ?c ?d2))
  )

  (:action fly-seville
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at seville_agent ?from ?d1) (direct-flight ?from ?to) (next ?d1 ?d2))
    :effect (and (at seville_agent ?to ?d2))
  )

  ; ---------------------------
  ; Actions for munich_agent
  ; ---------------------------
  (:action stay-munich
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at munich_agent ?c ?d1) (next ?d1 ?d2))
    :effect (and (at munich_agent ?c ?d2))
  )

  (:action fly-munich
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at munich_agent ?from ?d1) (direct-flight ?from ?to) (next ?d1 ?d2))
    :effect (and (at munich_agent ?to ?d2))
  )
)