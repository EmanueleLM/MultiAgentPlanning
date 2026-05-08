(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types location direction)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (is_free ?l - location)
    (adj ?l1 ?l2 - location ?d - direction)
  )

  (:action move
    :parameters (?from ?to - location ?d - direction)
    :precondition (and 
      (at_player ?from) 
      (adj ?from ?to ?d) 
      (is_free ?to)
    )
    :effect (and 
      (not (at_player ?from)) 
      (at_player ?to)
    )
  )

  (:action push
    :parameters (?p_from ?b_from ?b_to - location ?d - direction)
    :precondition (and 
      (at_player ?p_from) 
      (adj ?p_from ?b_from ?d) 
      (at_box ?b_from) 
      (adj ?b_from ?b_to ?d) 
      (is_free ?b_to)
    )
    :effect (and 
      (not (at_player ?p_from)) 
      (at_player ?b_from) 
      (not (at_box ?b_from)) 
      (is_free ?b_from) 
      (at_box ?b_to) 
      (not (is_free ?b_to))
    )
  )
)