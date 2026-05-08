(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box goal position)
  (:predicates
    (player-at ?p - position)
    (box-at ?b - box ?p - position)
    (goal-at ?g - goal ?p - position)
    (is-clear ?p - position)
    (adjacent ?p1 ?p2 - position)
  )

  (:action move-left
    :parameters (?from ?to - position)
    :precondition (and 
        (player-at ?from)
        (is-clear ?to)
        (adjacent ?from ?to))
    :effect (and
        (not (player-at ?from))
        (player-at ?to))
  )

  (:action move-right
    :parameters (?from ?to - position)
    :precondition (and 
        (player-at ?from)
        (is-clear ?to)
        (adjacent ?from ?to))
    :effect (and
        (not (player-at ?from))
        (player-at ?to))
  )

  (:action move-up
    :parameters (?from ?to - position)
    :precondition (and 
        (player-at ?from)
        (is-clear ?to)
        (adjacent ?from ?to))
    :effect (and
        (not (player-at ?from))
        (player-at ?to))
  )

  (:action move-down
    :parameters (?from ?to - position)
    :precondition (and 
        (player-at ?from)
        (is-clear ?to)
        (adjacent ?from ?to))
    :effect (and
        (not (player-at ?from))
        (player-at ?to))
  )

  (:action push-left
    :parameters (?player-pos ?box-pos ?new-box-pos - position)
    :precondition (and 
        (player-at ?player-pos)
        (box-at box1 ?box-pos)
        (is-clear ?new-box-pos)
        (adjacent ?player-pos ?box-pos)
        (adjacent ?box-pos ?new-box-pos))
    :effect (and
        (not (player-at ?player-pos))
        (not (box-at box1 ?box-pos))
        (player-at ?box-pos)
        (box-at box1 ?new-box-pos))
  )
  
  (:action push-right
    :parameters (?player-pos ?box-pos ?new-box-pos - position)
    :precondition (and 
        (player-at ?player-pos)
        (box-at box1 ?box-pos)
        (is-clear ?new-box-pos)
        (adjacent ?player-pos ?box-pos)
        (adjacent ?box-pos ?new-box-pos))
    :effect (and
        (not (player-at ?player-pos))
        (not (box-at box1 ?box-pos))
        (player-at ?box-pos)
        (box-at box1 ?new-box-pos))
  )
  
  (:action push-up
    :parameters (?player-pos ?box-pos ?new-box-pos - position)
    :precondition (and 
        (player-at ?player-pos)
        (box-at box1 ?box-pos)
        (is-clear ?new-box-pos)
        (adjacent ?player-pos ?box-pos)
        (adjacent ?box-pos ?new-box-pos))
    :effect (and
        (not (player-at ?player-pos))
        (not (box-at box1 ?box-pos))
        (player-at ?box-pos)
        (box-at box1 ?new-box-pos))
  )

  (:action push-down
    :parameters (?player-pos ?box-pos ?new-box-pos - position)
    :precondition (and 
        (player-at ?player-pos)
        (box-at box1 ?box-pos)
        (is-clear ?new-box-pos)
        (adjacent ?player-pos ?box-pos)
        (adjacent ?box-pos ?new-box-pos))
    :effect (and
        (not (player-at ?player-pos))
        (not (box-at box1 ?box-pos))
        (player-at ?box-pos)
        (box-at box1 ?new-box-pos))
  )
)