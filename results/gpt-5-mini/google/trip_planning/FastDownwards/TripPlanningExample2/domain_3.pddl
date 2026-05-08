(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)          ; you are in city ?c on day ?d
    (occupied ?d - day)             ; some city has been assigned for day ?d (prevents multiple assignments)
    (succ ?d1 - day ?d2 - day)      ; ?d2 is the immediate successor of ?d1
    (flight ?c1 - city ?c2 - city)  ; direct flight exists between cities (directed)
  )

  ;; remain in the same city from one day to the next
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (succ ?d1 ?d2) (not (occupied ?d2)))
    :effect (and (at ?c ?d2) (occupied ?d2))
  )

  ;; take a direct flight from one city to another between consecutive days
  (:action fly_direct
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (flight ?from ?to) (succ ?d1 ?d2) (not (occupied ?d2)))
    :effect (and (at ?to ?d2) (occupied ?d2))
  )
)