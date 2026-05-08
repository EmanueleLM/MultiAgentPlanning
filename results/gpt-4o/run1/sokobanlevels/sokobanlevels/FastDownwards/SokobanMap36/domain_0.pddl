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
    :parameters (?from - cell ?to - cell)
    :precondition (and (at player1 ?from) (adjacent ?from ?to) (cell_empty ?to))
    :effect (and (not (at player1 ?from)) (at player1 ?to))
  )
  
  (:action push
    :parameters (?player_from - cell ?player_to - cell ?box_from - cell ?box_to - cell)
    :precondition (and (at player1 ?player_from) (at box1 ?box_from) 
                       (adjacent ?player_from ?box_from) (adjacent ?box_from ?box_to)
                       (cell_empty ?box_to))
    :effect (and (not (at player1 ?player_from)) 
                 (not (at box1 ?box_from)) 
                 (at player1 ?box_from) 
                 (at box1 ?box_to))
  )
)