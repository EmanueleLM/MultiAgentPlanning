(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)            ; traveler is in city ?c on calendar day ?d
    (unassigned ?d - day)             ; day ?d has not yet been assigned to a city
    (next ?d1 - day ?d2 - day)        ; temporal ordering: ?d2 follows ?d1
    (direct ?from - city ?to - city)  ; a permitted direct flight exists from ?from to ?to
    (reduced ?c - city)               ; reconciliation marker: stay reduced for city ?c
  )

  ;; Action: stay in the same city from one day to the next (no flight needed).
  (:action stay
    :parameters (?c - city ?dprev - day ?dcurr - day)
    :precondition (and
      (at ?c ?dprev)
      (next ?dprev ?dcurr)
      (unassigned ?dcurr)
    )
    :effect (and
      (at ?c ?dcurr)
      (not (unassigned ?dcurr))
    )
  )

  ;; Action: fly from one city to another (requires a direct connection).
  (:action fly
    :parameters (?from - city ?to - city ?dprev - day ?dcurr - day)
    :precondition (and
      (at ?from ?dprev)
      (next ?dprev ?dcurr)
      (unassigned ?dcurr)
      (direct ?from ?to)
    )
    :effect (and
      (at ?to ?dcurr)
      (not (unassigned ?dcurr))
    )
  )
)