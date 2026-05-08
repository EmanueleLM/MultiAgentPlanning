(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)        ; you are in city ?c on day ?d
    (occupied ?d - day)           ; day ?d already assigned to a city
    (succ ?d1 - day ?d2 - day)    ; ?d2 is the immediate successor of ?d1
    (flight ?c1 - city ?c2 - city) ; direct flight exists from ?c1 to ?c2
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (succ ?d1 ?d2) (not (occupied ?d2)))
    :effect (and (at ?c ?d2) (occupied ?d2))
  )

  (:action fly_direct
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (flight ?from ?to) (succ ?d1 ?d2) (not (occupied ?d2)))
    :effect (and (at ?to ?d2) (occupied ?d2))
  )
)