(define (domain sokoban_domain)
  (:requirements :strips :typing)
  (:types location)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (adj ?l1 ?l2 - location)
    (clear ?l - location)
  )

  ;; Move action: The player moves from one location to an adjacent clear location.
  (:action move
    :parameters (?from ?to - location)
    :precondition (and 
      (at_player ?from) 
      (adj ?from ?to) 
      (clear ?to)
    )
    :effect (and 
      (not (at_player ?from)) 
      (at_player ?to) 
      (not (clear ?to)) 
      (clear ?from)
    )
  )

  ;; Push action: The player pushes the box from its current location to an adjacent empty location.
  ;; The player then moves into the box's previous location.
  (:action push
    :parameters (?p_from ?p_to ?b_to - location)
    :precondition (and 
      (at_player ?p_from) 
      (adj ?p_from ?p_to) 
      (at_box ?p_to) 
      (adj ?p_to ?b_to) 
      (clear ?b_to)
    )
    :effect (and 
      (not (at_player ?p_from)) 
      (at_player ?p_to) 
      (not (at_box ?p_to)) 
      (at_box ?b_to) 
      (not (clear ?b_to)) 
      (clear ?p_from)
    )
  )
)