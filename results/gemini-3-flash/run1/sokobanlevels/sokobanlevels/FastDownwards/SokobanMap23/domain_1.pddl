(define (domain sokoban)
  (:requirements :strips :typing)
  (:types 
    location direction thing - object
    player box - thing
  )

  (:predicates 
    (at ?t - thing ?l - location)
    (adj ?l1 - location ?l2 - location ?d - direction)
    (clear ?l - location)
  )

  (:action move
    :parameters (?p - player ?from - location ?to - location ?d - direction)
    :precondition (and 
      (at ?p ?from) 
      (adj ?from ?to ?d) 
      (clear ?to)
    )
    :effect (and 
      (not (at ?p ?from)) 
      (at ?p ?to) 
      (not (clear ?to)) 
      (clear ?from)
    )
  )

  (:action push
    :parameters (?p - player ?b - box ?p_from - location ?b_from - location ?b_to - location ?d - direction)
    :precondition (and 
      (at ?p ?p_from) 
      (at ?b ?b_from) 
      (adj ?p_from ?b_from ?d) 
      (adj ?b_from ?b_to ?d) 
      (clear ?b_to)
    )
    :effect (and 
      (not (at ?p ?p_from)) 
      (at ?p ?b_from) 
      (not (at ?b ?b_from)) 
      (at ?b ?b_to) 
      (clear ?p_from) 
      (not (clear ?b_to))
    )
  )
)