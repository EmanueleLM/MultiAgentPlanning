(define (domain multiagent-trip)
  (:requirements :strips :typing :fluents)
  (:types agent city day)
  (:predicates
    (at ?ag - agent ?c - city)
    (visited ?c - city)
    (direct ?c1 - city ?c2 - city)
    (met_friend)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)
    (allowed_meet_day ?d - day)
  )
  (:functions
    (porto_days)
    (berlin_days)
    (reykjavik_days)
  )

  (:action stay_one_day_porto
    :parameters (?trav - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?trav porto) (current_day ?d1) (next ?d1 ?d2))
    :effect (and (not (current_day ?d1)) (current_day ?d2) (visited porto) (decrease (porto_days) 1))
  )

  (:action stay_one_day_berlin
    :parameters (?trav - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?trav berlin) (current_day ?d1) (next ?d1 ?d2))
    :effect (and (not (current_day ?d1)) (current_day ?d2) (visited berlin) (decrease (berlin_days) 1))
  )

  (:action stay_one_day_reykjavik
    :parameters (?trav - agent ?d1 - day ?d2 - day)
    :precondition (and (at ?trav reykjavik) (current_day ?d1) (next ?d1 ?d2))
    :effect (and (not (current_day ?d1)) (current_day ?d2) (visited reykjavik) (decrease (reykjavik_days) 1))
  )

  (:action meet_friend
    :parameters (?trav - agent ?d - day)
    :precondition (and (at ?trav reykjavik) (current_day ?d) (allowed_meet_day ?d))
    :effect (met_friend)
  )

  (:action flights_agent_fly_porto_to_berlin
    :parameters (?trav - agent)
    :precondition (and (at ?trav porto) (direct porto berlin))
    :effect (and (not (at ?trav porto)) (at ?trav berlin) (visited berlin))
  )

  (:action flights_agent_fly_berlin_to_porto
    :parameters (?trav - agent)
    :precondition (and (at ?trav berlin) (direct berlin porto))
    :effect (and (not (at ?trav berlin)) (at ?trav porto) (visited porto))
  )

  (:action flights_agent_fly_berlin_to_reyk
    :parameters (?trav - agent)
    :precondition (and (at ?trav berlin) (direct berlin reykjavik))
    :effect (and (not (at ?trav berlin)) (at ?trav reykjavik) (visited reykjavik))
  )

  (:action flights_agent_fly_reyk_to_berlin
    :parameters (?trav - agent)
    :precondition (and (at ?trav reykjavik) (direct reykjavik berlin))
    :effect (and (not (at ?trav reykjavik)) (at ?trav berlin) (visited berlin))
  )
)