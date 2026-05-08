(define (domain sokoban)
  (:requirements :strips :typing)
  (:types
    loc direction
  )
  (:predicates
    (at_player ?l - loc)
    (at_box ?l - loc)
    (clear ?l - loc)
    (adj ?l1 ?l2 - loc ?d - direction)
  )

  (:action move
    :parameters (?from ?to - loc ?dir - direction)
    :precondition (and 
      (at_player ?from) 
      (adj ?from ?to ?dir) 
      (clear ?to)
    )
    :effect (and 
      (not (at_player ?from)) 
      (at_player ?to) 
      (clear ?from) 
      (not (clear ?to))
    )
  )

  (:action push
    :parameters (?p_from ?b_from ?b_to - loc ?dir - direction)
    :precondition (and 
      (at_player ?p_from) 
      (at_box ?b_from) 
      (adj ?p_from ?b_from ?dir) 
      (adj ?b_from ?b_to ?dir) 
      (clear ?b_to)
    )
    :effect (and 
      (not (at_player ?p_from)) 
      (at_player ?b_from) 
      (clear ?p_from) 
      (not (at_box ?b_from)) 
      (at_box ?b_to) 
      (not (clear ?b_to))
    )
  )
)