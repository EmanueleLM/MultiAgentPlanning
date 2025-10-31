(define (domain travel)
  (:requirements :strips :typing)
  (:types loc day)
  (:predicates
    (at ?l - loc ?d - day)           ; at location l on day d
    (next ?d1 - day ?d2 - day)       ; day successor relation
    (connected ?from - loc ?to - loc) ; direct flight connection
  )

  ;; stay in the same city from day d1 to day d2 (d2 is next of d1)
  (:action stay
    :parameters (?l - loc ?d1 - day ?d2 - day)
    :precondition (and (at ?l ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?l ?d1)) (at ?l ?d2))
  )

  ;; fly from ?from to ?to overnight (only allowed if a direct connection exists)
  (:action fly
    :parameters (?from - loc ?to - loc ?d1 - day ?d2 - day)
    :precondition (and (connected ?from ?to) (at ?from ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?from ?d1)) (at ?to ?d2))
  )
)