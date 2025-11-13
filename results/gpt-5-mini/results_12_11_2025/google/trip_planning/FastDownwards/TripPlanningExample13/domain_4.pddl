(define (domain travel-days)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (edge ?from - city ?to - city)     ; direct flight connectivity (store only one direction per link)
    (succ ?d1 - day ?d2 - day)         ; successor relation between consecutive days
    (at ?c - city ?d - day)            ; traveler is at city ?c on day ?d
    (used ?d - day)                    ; marker that day ?d has been advanced from (prevents double-advancing)
  )

  ;; Travel along a direct flight edge from ?from on day ?d1 to arrive in ?to on day ?d2 (successor day).
  ;; Prevent using the same source day for multiple advances via (not (used ?d1)).
  (:action travel
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (edge ?from ?to)
      (succ ?d1 ?d2)
      (not (used ?d1))
    )
    :effect (and
      (at ?to ?d2)
      (used ?d1)
    )
  )

  ;; Allow travel when the stored edge fact is in the opposite direction (enables undirected links with fewer init facts).
  (:action travel-reverse
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (edge ?to ?from)
      (succ ?d1 ?d2)
      (not (used ?d1))
    )
    :effect (and
      (at ?to ?d2)
      (used ?d1)
    )
  )

  ;; Stay in the same city from day ?d1 to the next day ?d2.
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (succ ?d1 ?d2)
      (not (used ?d1))
    )
    :effect (and
      (at ?c ?d2)
      (used ?d1)
    )
  )
)