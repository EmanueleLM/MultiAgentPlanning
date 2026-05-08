(define (domain sokoban_domain)
  (:requirements :strips :typing)
  (:types pos direction)
  (:predicates
    (at_player ?p - pos)
    (at_box ?p - pos)
    (adj ?p1 ?p2 - pos ?d - direction)
    (is_clear ?p - pos)
  )

  (:action move
    :parameters (?from - pos ?to - pos ?d - direction)
    :precondition (and 
      (at_player ?from) 
      (adj ?from ?to ?d) 
      (is_clear ?to)
    )
    :effect (and 
      (not (at_player ?from)) 
      (at_player ?to)
    )
  )

  (:action push
    :parameters (?p_pos - pos ?b_pos - pos ?t_pos - pos ?d - direction)
    :precondition (and 
      (at_player ?p_pos) 
      (at_box ?b_pos) 
      (adj ?p_pos ?b_pos ?d) 
      (adj ?b_pos ?t_pos ?d) 
      (is_clear ?t_pos)
    )
    :effect (and 
      (not (at_player ?p_pos)) 
      (at_player ?b_pos) 
      (not (at_box ?b_pos)) 
      (at_box ?t_pos) 
      (is_clear ?b_pos) 
      (not (is_clear ?t_pos))
    )
  )
)