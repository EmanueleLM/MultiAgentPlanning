(define (domain trip-multiagent)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    ;; occupancy predicates per city (keeps agent actions distinct by predicate names)
    (in-krakow ?d - day)
    (in-athens ?d - day)
    (in-zurich ?d - day)

    ;; allowed-day predicates to constrain which days each city-agent may occupy
    (allowed-krakow ?d - day)
    (allowed-athens ?d - day)
    (allowed-zurich ?d - day)

    ;; allowed days for visiting relatives (Athens)
    (allowed-relatives ?d - day)

    ;; direct flight connectivity between cities (static)
    (direct-flight ?from - city ?to - city)

    ;; records that a direct flight was used on a particular day
    (flew ?from - city ?to - city ?d - day)

    ;; record that relatives were visited on a specific day in Athens
    (visited-relatives ?d - day)
  )

  ;; Krakow agent: occupy allowed days in Krakow
  (:action krakow-agent-occupy-day
    :parameters (?d - day)
    :precondition (allowed-krakow ?d)
    :effect (in-krakow ?d)
  )

  ;; Athens agent: occupy allowed days in Athens
  (:action athens-agent-occupy-day
    :parameters (?d - day)
    :precondition (allowed-athens ?d)
    :effect (in-athens ?d)
  )

  ;; Zurich agent: occupy allowed days in Zurich
  (:action zurich-agent-occupy-day
    :parameters (?d - day)
    :precondition (allowed-zurich ?d)
    :effect (in-zurich ?d)
  )

  ;; Krakow agent uses a direct flight Krakow -> Athens on a specific day
  (:action krakow-agent-fly-to-athens
    :parameters (?d - day)
    :precondition (and (in-krakow ?d) (direct-flight krakow athens))
    :effect (flew krakow athens ?d)
  )

  ;; Athens agent uses a direct flight Athens -> Zurich on a specific day
  (:action athens-agent-fly-to-zurich
    :parameters (?d - day)
    :precondition (and (in-athens ?d) (direct-flight athens zurich))
    :effect (flew athens zurich ?d)
  )

  ;; Athens agent visits relatives on a day allowed for relatives
  (:action athens-agent-visit-relatives
    :parameters (?d - day)
    :precondition (and (in-athens ?d) (allowed-relatives ?d))
    :effect (visited-relatives ?d)
  )
)