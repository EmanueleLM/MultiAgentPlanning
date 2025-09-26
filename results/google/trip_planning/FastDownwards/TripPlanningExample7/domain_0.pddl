(define (domain travel-days)
  ; Domain: travel-days
  ; Purpose: model travel between cities with direct flights and staying days.
  ; Intended for FastDownwards (PDDL 2.1 numeric fluents).
  ; Types and predicates:
  ; - agent: the traveler(s)
  ; - city: locations
  ; Predicates:
  ;  (at ?ag ?c)       : agent is at city
  ;  (direct-flight ?from ?to) : there is a direct flight available (problem supplies edges)
  ;  (visited ?c)      : city has been visited at least once
  ; Functions:
  ;  (elapsed) numeric : total elapsed days so far (integer count)
  ;
  ; Actions:
  ;  - fly: move via a direct-flight edge, takes 1 day (increments elapsed)
  ;  - stay: remain in same city for one extra day (increments elapsed)
  ;
  ; Comments about agents and roles:
  ;  This domain models one or more agents of type agent. The example problem will typically use one agent (the traveler).
  ;  Agents perform 'fly' and 'stay' actions; each action increments the global elapsed counter by 1 day.
  ;  All temporal preferences from the itinerary inputs should be encoded as hard constraints in the problem (not here).
  (:requirements :strips :typing :negative-preconditions :fluents :numeric-fluents)
  (:types agent city)

  (:predicates
    (at ?ag - agent ?c - city)
    (direct-flight ?from ?to - city)
    (visited ?c - city)
  )

  (:functions
    (elapsed) ; numeric counter for days elapsed
  )

  ; Action: fly from one city to another via a direct-flight
  (:action fly
    :parameters (?ag - agent ?from - city ?to - city)
    :precondition (and
                    (at ?ag ?from)
                    (direct-flight ?from ?to)
                  )
    :effect (and
              (not (at ?ag ?from))
              (at ?ag ?to)
              (visited ?to)
              (increase (elapsed) 1)
            )
  )

  ; Action: stay one extra day in current city
  (:action stay
    :parameters (?ag - agent ?c - city)
    :precondition (at ?ag ?c)
    :effect (and
              (visited ?c)
              (increase (elapsed) 1)
            )
  )

)