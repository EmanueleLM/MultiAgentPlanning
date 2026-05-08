(define (domain sokoban)
  (:requirements :strips :typing)
  (:types location direction)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (is_clear ?l - location)
    (adjacent ?l1 - location ?l2 - location ?d - direction)
  )

  (:action move
    :parameters (?from - location ?to - location ?dir - direction)
    :precondition (and 
      (at_player ?from) 
      (adjacent ?from ?to ?dir) 
      (is_clear ?to)
    )
    :effect (and 
      (not (at_player ?from)) 
      (at_player ?to)
    )
  )

  (:action push
    :parameters (?p_at - location ?b_at - location ?b_to - location ?dir - direction)
    :precondition (and 
      (at_player ?p_at) 
      (at_box ?b_at) 
      (adjacent ?p_at ?b_at ?dir) 
      (adjacent ?b_at ?b_to ?dir) 
      (is_clear ?b_to)
    )
    :effect (and 
      (not (at_player ?p_at)) 
      (at_player ?b_at) 
      (not (at_box ?b_at)) 
      (at_box ?b_to) 
      (is_clear ?b_at) 
      (not (is_clear ?b_to))
    )
  )
)