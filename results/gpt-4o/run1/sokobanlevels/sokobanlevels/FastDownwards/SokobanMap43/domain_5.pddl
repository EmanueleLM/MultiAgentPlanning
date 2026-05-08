(define (domain sokoban)
  (:requirements :strips :typing)

  (:types 
    location
  )

  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (goal ?l - location)
    (clear ?l - location)
    (adjacent ?l1 ?l2 - location)
  )

  (:action move
    :parameters (?from ?to - location)
    :precondition (and (at_player ?from) (clear ?to) (adjacent ?from ?to))
    :effect (and (not (at_player ?from)) (at_player ?to))
  )

  (:action push
    :parameters (?from ?box ?to - location)
    :precondition (and 
      (at_player ?from)
      (at_box ?box)
      (clear ?to)
      (adjacent ?from ?box)
      (adjacent ?box ?to))
    :effect (and 
      (not (at_player ?from)) (at_player ?box)
      (not (at_box ?box)) (at_box ?to)
      (clear ?box) (not (clear ?to)))   
  )
)