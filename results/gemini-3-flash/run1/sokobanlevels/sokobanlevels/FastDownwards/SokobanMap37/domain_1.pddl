(define (domain sokoban_map_37)
  (:requirements :strips :typing)
  (:types loc dir obj)
  (:predicates
    (at ?o - obj ?l - loc)
    (adj ?l1 ?l2 - loc ?d - dir)
    (is_player ?o - obj)
    (is_box ?o - obj)
    (clear ?l - loc)
  )

  (:action move
    :parameters (?p - obj ?from - loc ?to - loc ?d - dir)
    :precondition (and 
      (is_player ?p) 
      (at ?p ?from) 
      (adj ?from ?to ?d) 
      (clear ?to)
    )
    :effect (and 
      (not (at ?p ?from)) 
      (at ?p ?to)
    )
  )

  (:action push
    :parameters (?p - obj ?b - obj ?p_loc - loc ?b_loc - loc ?t_loc - loc ?d - dir)
    :precondition (and 
      (is_player ?p) 
      (is_box ?b) 
      (at ?p ?p_loc) 
      (at ?b ?b_loc) 
      (adj ?p_loc ?b_loc ?d) 
      (adj ?b_loc ?t_loc ?d) 
      (clear ?t_loc)
    )
    :effect (and 
      (not (at ?p ?p_loc)) 
      (at ?p ?b_loc) 
      (not (at ?b ?b_loc)) 
      (at ?b ?t_loc) 
      (clear ?b_loc) 
      (not (clear ?t_loc))
    )
  )
)