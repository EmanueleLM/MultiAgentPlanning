(define (domain travel-planner)
  (:requirements :strips :typing :equality :numeric-fluents)
  (:types traveler location day number)

  (:predicates 
    (at ?t - traveler ?l - location ?d - day)
    (has-direct-flight ?from - location ?to - location)
    (next-day ?d1 - day ?d2 - day)
    (assigned-day-number ?d - day ?n - number)
  )

  (:functions
    (stay-duration ?l - location)
  )

  (:action fly
    :parameters (?t - traveler ?from - location ?to - location ?d1 - day ?d2 - day)
    :precondition (and 
      (at ?t ?from ?d1)
      (has-direct-flight ?from ?to) 
      (next-day ?d1 ?d2)
    )
    :effect (and 
      (not (at ?t ?from ?d1))
      (at ?t ?to ?d2)
    )
  )

  (:action stay
    :parameters (?t - traveler ?l - location ?d1 - day ?d2 - day ?n1 - number ?n2 - number)
    :precondition (and 
      (at ?t ?l ?d1)
      (next-day ?d1 ?d2)
      (assigned-day-number ?d1 ?n1)
      (assigned-day-number ?d2 ?n2)
      (<= (- ?n2 ?n1) (stay-duration ?l))
    )
    :effect (and
      (at ?t ?l ?d2)
      (not (at ?t ?l ?d1))
    )
  )
)