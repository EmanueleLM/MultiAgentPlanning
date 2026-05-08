(define (domain sokoban_domain)
  (:requirements :strips :typing)
  (:types location direction)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (clear ?l - location)
    (adj ?l1 - location ?l2 - location ?d - direction)
  )

  (:action move
    :parameters (?from - location ?to - location ?dir - direction)
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
    :parameters (?p_loc - location ?b_loc - location ?b_to - location ?dir - direction)
    :precondition (and 
      (at_player ?p_loc) 
      (adj ?p_loc ?b_loc ?dir) 
      (at_box ?b_loc) 
      (adj ?b_loc ?b_to ?dir) 
      (clear ?b_to)
    )
    :effect (and 
      (not (at_player ?p_loc)) 
      (at_player ?b_loc) 
      (not (at_box ?b_loc)) 
      (at_box ?b_to) 
      (clear ?p_loc) 
      (not (clear ?b_to))
    )
  )
)