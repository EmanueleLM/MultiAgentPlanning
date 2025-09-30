(define (domain multiagent-travel)
  (:requirements :typing)
  (:types agent city day)
  (:predicates
    (at ?agent - agent ?city - city ?day - day)
    (next ?day1 - day ?day2 - day)
    (direct ?city1 - city ?city2 - city)
    (conference ?city - city ?day - day)
    (attended ?city - city ?day - day)
    (is-traveler ?agent - agent)
    (is-manager ?agent - agent)
  )

  (:action fly-traveler
    :parameters (?trav - agent ?from - city ?to - city ?d1 - day ?d2 - day)
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
    :parameters (?trav - agent ?city - city ?d1 - day ?d2 - day)
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
    :parameters (?trav - agent ?city - city ?day - day)
    :precondition (and
      (is-traveler ?trav)
      (at ?trav ?city ?day)
      (conference ?city ?day)
    )
    :effect (and
      (attended ?city ?day)
    )
  )

  (:action manager-declare-direct
    :parameters (?mgr - agent ?c1 - city ?c2 - city)
    :precondition (is-manager ?mgr)
    :effect (and
      (direct ?c1 ?c2)
      (direct ?c2 ?c1)
    )
  )
)