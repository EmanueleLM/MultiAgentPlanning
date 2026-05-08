(define (domain sokoban_map_35)
  (:requirements :strips :typing :negative-preconditions)
  (:types pos direction)
  (:predicates
    (at_player ?p - pos)
    (at_box ?p - pos)
    (is_empty ?p - pos)
    (adj ?p1 ?p2 - pos ?d - direction)
  )

  (:action move
    :parameters (?from ?to - pos ?d - direction)
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
    :parameters (?p ?b ?t - pos ?d - direction)
    :precondition (and 
      (at_player ?p) 
      (adj ?p ?b ?d) 
      (at_box ?b) 
      (adj ?b ?t ?d) 
      (is_empty ?t)
    )
    :effect (and 
      (not (at_player ?p)) 
      (at_player ?b) 
      (is_empty ?p) 
      (not (at_box ?b)) 
      (at_box ?t) 
      (not (is_empty ?t))
    )
  )
)