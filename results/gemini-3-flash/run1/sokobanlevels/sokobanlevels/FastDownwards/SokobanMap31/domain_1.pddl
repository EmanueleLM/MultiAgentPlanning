(define (domain sokoban)
  (:requirements :strips :typing)
  (:types location direction)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (clear ?l - location)
    (next ?l1 ?l2 - location ?d - direction)
  )

  (:action move
    :parameters (?from ?to - location ?dir - direction)
    :precondition (and 
      (at_player ?from) 
      (next ?from ?to ?dir) 
      (clear ?to)
    )
    :effect (and 
      (not (at_player ?from)) 
      (at_player ?to)
    )
  )

  (:action push
    :parameters (?p_loc ?b_loc ?target_loc - location ?dir - direction)
    :precondition (and 
      (at_player ?p_loc) 
      (at_box ?b_loc) 
      (next ?p_loc ?b_loc ?dir) 
      (next ?b_loc ?target_loc ?dir) 
      (clear ?target_loc)
    )
    :effect (and 
      (not (at_player ?p_loc)) 
      (at_player ?b_loc) 
      (not (at_box ?b_loc)) 
      (at_box ?target_loc) 
      (clear ?b_loc) 
      (not (clear ?target_loc))
    )
  )
)