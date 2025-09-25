(define (domain multiagent-trip)
  (:requirements :strips :typing :fluents)
  (:types agent city)
  (:predicates
    (at ?ag - agent ?c - city)
    (direct ?c1 - city ?c2 - city)
    (is_reykjavik ?c - city)
    (met_friend)
  )
  (:functions
    (day-index)
    (total-days-left)
    (porto-req)
    (berlin-req)
    (reyk-req)
  )

  (:action traveler_stay_porto
    :parameters (?trav - agent)
    :precondition (and (at ?trav porto) (> (total-days-left) 0) (> (porto-req) 0))
    :effect (and
      (decrease (total-days-left) 1)
      (increase (day-index) 1)
      (decrease (porto-req) 1)
    )
  )

  (:action traveler_stay_berlin
    :parameters (?trav - agent)
    :precondition (and (at ?trav berlin) (> (total-days-left) 0) (> (berlin-req) 0))
    :effect (and
      (decrease (total-days-left) 1)
      (increase (day-index) 1)
      (decrease (berlin-req) 1)
    )
  )

  (:action traveler_stay_reykjavik
    :parameters (?trav - agent)
    :precondition (and (at ?trav reykjavik) (> (total-days-left) 0) (> (reyk-req) 0))
    :effect (and
      (decrease (total-days-left) 1)
      (increase (day-index) 1)
      (decrease (reyk-req) 1)
    )
  )

  (:action flights_agent_fly
    :parameters (?trav - agent ?from - city ?to - city)
    :precondition (and (at ?trav ?from) (direct ?from ?to))
    :effect (and (not (at ?trav ?from)) (at ?trav ?to))
  )

  (:action meet_friend
    :parameters (?trav - agent ?c - city)
    :precondition (and (at ?trav ?c) (is_reykjavik ?c) (>= (day-index) 12) (<= (day-index) 16))
    :effect (and (met_friend))
  )
)