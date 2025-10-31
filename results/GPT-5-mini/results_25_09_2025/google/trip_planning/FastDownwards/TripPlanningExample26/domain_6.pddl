(define (domain multiagent-trip)
  (:requirements :strips :typing)
  (:types agent city token day)
  (:predicates
    (at ?ag - agent ?c - city)
    (direct ?c1 - city ?c2 - city)
    (reykjavik ?c - city)
    (current-day ?d - day)
    (next ?d1 - day ?d2 - day)
    (meetable_day ?d - day)
    (porto_token ?t - token)
    (berlin_token ?t - token)
    (reyk_token ?t - token)
    (consumed_porto ?t - token)
    (consumed_berlin ?t - token)
    (consumed_reyk ?t - token)
    (met_friend)
  )

  (:action stay_porto
    :parameters (?trav - agent ?t - token ?d - day ?d2 - day)
    :precondition (and (at ?trav porto) (porto_token ?t) (current-day ?d) (next ?d ?d2))
    :effect (and
      (not (porto_token ?t))
      (consumed_porto ?t)
      (not (current-day ?d))
      (current-day ?d2)
    )
  )

  (:action stay_berlin
    :parameters (?trav - agent ?t - token ?d - day ?d2 - day)
    :precondition (and (at ?trav berlin) (berlin_token ?t) (current-day ?d) (next ?d ?d2))
    :effect (and
      (not (berlin_token ?t))
      (consumed_berlin ?t)
      (not (current-day ?d))
      (current-day ?d2)
    )
  )

  (:action stay_reykjavik
    :parameters (?trav - agent ?t - token ?d - day ?d2 - day)
    :precondition (and (at ?trav reykjavik) (reyk_token ?t) (current-day ?d) (next ?d ?d2))
    :effect (and
      (not (reyk_token ?t))
      (consumed_reyk ?t)
      (not (current-day ?d))
      (current-day ?d2)
    )
  )

  (:action flights_agent_fly
    :parameters (?trav - agent ?from - city ?to - city)
    :precondition (and (at ?trav ?from) (direct ?from ?to))
    :effect (and
      (not (at ?trav ?from))
      (at ?trav ?to)
    )
  )

  (:action meet_friend
    :parameters (?trav - agent ?d - day)
    :precondition (and (at ?trav reykjavik) (current-day ?d) (meetable_day ?d))
    :effect (and (met_friend))
  )
)