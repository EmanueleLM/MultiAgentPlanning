(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity cell)
  
  (:predicates
    (at ?entity - entity ?cell - cell)
    (cell_empty ?cell - cell)
    (adjacent ?c1 - cell ?c2 - cell)
    (goal ?cell - cell)
  )
  
  (:action move
    :parameters (?entity - entity ?from - cell ?to - cell)
    :precondition (and (at ?entity ?from) (adjacent ?from ?to) (cell_empty ?to))
    :effect (and (not (at ?entity ?from)) (at ?entity ?to))
  )
  
  (:action push
    :parameters (?player - entity ?player_from - cell ?player_to - cell ?box - entity ?box_from - cell ?box_to - cell)
    :precondition (and (at ?player ?player_from) (at ?box ?box_from) 
                       (adjacent ?player_from ?box_from) (adjacent ?box_from ?box_to)
                       (cell_empty ?box_to))
    :effect (and (not (at ?player ?player_from)) 
                 (not (at ?box ?box_from)) 
                 (at ?player ?box_from) 
                 (at ?box ?box_to))
  )
)