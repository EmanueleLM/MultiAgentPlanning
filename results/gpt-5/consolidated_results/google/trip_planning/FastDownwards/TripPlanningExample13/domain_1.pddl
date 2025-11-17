(define (domain eurotrip-17days)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)          ; traveler is at city c on day d
    (current-day ?d - day)           ; the current day
    (next ?d1 - day ?d2 - day)       ; successor relation among days
    (flight ?from - city ?to - city) ; direct flight connectivity
    (must-at ?c - city ?d - day)     ; enforced city occupancy for day d
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current-day ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
      (must-at ?c ?d2)   ; can only advance if next day requires same city
    )
    :effect (and
      (not (current-day ?d1))
      (current-day ?d2)
      (at ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current-day ?d1)
      (next ?d1 ?d2)
      (at ?from ?d1)
      (flight ?from ?to)
      (must-at ?to ?d2)  ; arrival city must match the enforced city for next day
    )
    :effect (and
      (not (current-day ?d1))
      (current-day ?d2)
      (at ?to ?d2)
    )
  )
)