(define (domain sokoban_domain)
  (:requirements :strips :typing)
  (:types location direction)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (is_empty ?l - location)
    (adj ?l1 ?l2 - location ?d - direction)
  )

  (:action move
    :parameters (?from - location ?to - location ?d - direction)
    :precondition (and 
      (at_player ?from) 
      (adj ?from ?to ?d) 
      (is_empty ?to)
    )
    :effect (and 
      (not (at_player ?from)) 
      (at_player ?to) 
      (is_empty ?from) 
      (not (is_empty ?to))
    )
  )

  (:action push
    :parameters (?p_from - location ?b_from - location ?b_to - location ?d - direction)
    :precondition (and 
      (at_player ?p_from) 
      (at_box ?b_from) 
      (adj ?p_from ?b_from ?d) 
      (adj ?b_from ?b_to ?d) 
      (is_empty ?b_to)
    )
    :effect (and 
      (not (at_player ?p_from)) 
      (at_player ?b_from) 
      (not (at_box ?b_from)) 
      (at_box ?b_to) 
      (is_empty ?p_from) 
      (not (is_empty ?b_to))
    )
  )
)