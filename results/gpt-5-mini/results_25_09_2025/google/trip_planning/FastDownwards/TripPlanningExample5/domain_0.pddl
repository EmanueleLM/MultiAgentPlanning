(define (domain trip-planning-multiagent)
  (:requirements :typing :fluents :numeric-fluents)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)        ; traveler is in city ?c on day ?d
    (next ?d1 - day ?d2 - day)    ; successor day
    (flight ?from - city ?to - city) ; direct flight exists
    (free ?d - day)               ; day ?d is not yet assigned (only one city per day)
    (day1 ?d - day)               ; indicates the first day object
  )

  (:functions
    (days-in ?c - city)           ; numeric counter: number of days spent in city ?c
  )

  ;; Traveler agent actions
  (:action traveler-start
    :parameters (?c - city ?d - day)
    :precondition (and (day1 ?d) (free ?d))
    :effect (and
      (at ?c ?d)
      (not (free ?d))
      (increase (days-in ?c) 1)
    )
  )

  (:action traveler-stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (free ?d2))
    :effect (and
      (at ?c ?d2)
      (not (free ?d2))
      (increase (days-in ?c) 1)
    )
  )

  ;; Flight network agent actions (distinct prefix)
  (:action flight_network-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (free ?d2) (flight ?from ?to))
    :effect (and
      (at ?to ?d2)
      (not (free ?d2))
      (increase (days-in ?to) 1)
    )
  )
)