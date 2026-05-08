(define (domain multiagent-travel)
  (:requirements :strips)
  (:predicates
    (at ?agent ?city ?day)            ; agent is in city at day
    (next ?day1 ?day2)               ; chronological day successor
    (direct ?city1 ?city2)           ; direct flight available between cities (static)
    (conference ?city ?day)          ; conference held in city on day (static)
    (attended ?city ?day)            ; traveler attended conference in city on day
    (is-traveler ?agent)
    (is-manager ?agent)
  )

  ;; Traveler actions: moving and staying consume one day (discrete time steps).
  (:action fly-traveler
    :parameters (?trav ?from ?to ?d1 ?d2)
    :precondition (and
      (is-traveler ?trav)
      (at ?trav ?from ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
    )
    :effect (and
      (not (at ?trav ?from ?d1))
      (at ?trav ?to ?d2)
    )
  )

  (:action stay-traveler
    :parameters (?trav ?city ?d1 ?d2)
    :precondition (and
      (is-traveler ?trav)
      (at ?trav ?city ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      (not (at ?trav ?city ?d1))
      (at ?trav ?city ?d2)
    )
  )

  (:action attend-conference
    :parameters (?trav ?city ?day)
    :precondition (and
      (is-traveler ?trav)
      (at ?trav ?city ?day)
      (conference ?city ?day)
    )
    :effect (and
      (attended ?city ?day)
    )
  )

  ;; Flight manager action (keeps agent distinctions explicit). Not required for the initial plan
  ;; since direct facts are provided in the initial state; included to reflect connectivity management.
  (:action manager-declare-direct
    :parameters (?mgr ?c1 ?c2)
    :precondition (is-manager ?mgr)
    :effect (and
      (direct ?c1 ?c2)
      (direct ?c2 ?c1)
    )
  )
)