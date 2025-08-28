(define (domain travel-planner)
  (:requirements :strips :typing)
  (:types traveler location day)
  
  (:predicates 
    (at ?t - traveler ?l - location ?d - day)
    (has-direct-flight ?from - location ?to - location)
    (next-day ?d1 - day ?d2 - day)
    (stay-duration ?l - location ?days - number)
  )

  (:action fly
    :parameters (?t - traveler ?from - location ?to - location ?d1 - day ?d2 - day)
    :precondition (and 
      (at ?t ?from ?d1)
      (has-direct-flight ?from ?to) 
      (next-day ?d1 ?d2)
    )
    :effect (and 
      (not (at ?t ?from ?d2))
      (at ?t ?to ?d2)
    )
  )

  (:action stay
    :parameters (?t - traveler ?l - location ?d1 - day ?d2 - day)
    :precondition (and 
      (at ?t ?l ?d1)
      (next-day ?d1 ?d2)
      (stay-duration ?l ?days)
    )
    :effect (at ?t ?l ?d2)
  )
)