(define (domain pddl_orchestrator)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)           ; traveler is at city ?c on day ?d
    (next ?d1 - day ?d2 - day)       ; immediate successor day relation
    (direct-flight ?from - city ?to - city) ; direct flight link (one-hop) exists
  )

  ;; Travel on a direct flight consumes the current day and results in being at the destination on the next day.
  (:action travel
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct-flight ?from ?to))
    :effect (and (not (at ?from ?d1)) (at ?to ?d2))
  )

  ;; Stay in the same city for one day (consume current day, produce next-day presence in same city).
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2))
  )
)