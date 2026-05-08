(define (domain sokoban_domain)
  (:requirements :typing :negative-preconditions)
  (:types location direction)
  (:predicates
    (at-player ?l - location)
    (at-box ?l - location)
    (adjacent ?l1 ?l2 - location ?d - direction)
    (clear ?l - location)
  )

  (:action move
    :parameters (?from ?to - location ?dir - direction)
    :precondition (and 
        (at-player ?from) 
        (adjacent ?from ?to ?dir) 
        (clear ?to)
    )
    :effect (and 
        (not (at-player ?from)) 
        (at-player ?to)
    )
  )

  (:action push
    :parameters (?p_loc ?b_loc ?b_next - location ?dir - direction)
    :precondition (and 
        (at-player ?p_loc) 
        (adjacent ?p_loc ?b_loc ?dir) 
        (at-box ?b_loc) 
        (adjacent ?b_loc ?b_next ?dir) 
        (clear ?b_next)
    )
    :effect (and 
        (not (at-player ?p_loc)) 
        (at-player ?b_loc) 
        (not (at-box ?b_loc)) 
        (at-box ?b_next) 
        (clear ?b_loc) 
        (not (clear ?b_next))
    )
  )
)