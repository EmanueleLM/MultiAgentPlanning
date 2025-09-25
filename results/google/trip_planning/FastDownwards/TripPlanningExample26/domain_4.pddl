(define (domain multiagent-trip)
  (:requirements :strips :typing)
  (:types agent city day)
  (:predicates
    (at ?ag - agent ?c - city)
    (visited ?c - city)
    (direct ?c1 - city ?c2 - city)
    (met_friend)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)
    (allowed_meet_day ?d - day)
    (is_reykjavik ?c - city)
  )

  (:action stay_one_day
    :parameters (?trav - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?trav ?c) (current_day ?d1) (next ?d1 ?d2))
    :effect (and (not (current_day ?d1)) (current_day ?d2) (visited ?c))
  )

  (:action meet_friend
    :parameters (?trav - agent ?c - city ?d - day)
    :precondition (and (at ?trav ?c) (current_day ?d) (allowed_meet_day ?d) (is_reykjavik ?c))
    :effect (and (met_friend))
  )

  (:action flights_agent_fly
    :parameters (?trav - agent ?from - city ?to - city)
    :precondition (and (at ?trav ?from) (direct ?from ?to))
    :effect (and (not (at ?trav ?from)) (at ?trav ?to) (visited ?to))
  )
)