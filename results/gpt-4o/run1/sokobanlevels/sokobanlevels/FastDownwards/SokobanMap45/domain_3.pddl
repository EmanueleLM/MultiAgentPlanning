(define (domain sokoban)
  (:requirements :strips :typing)
  (:types location)
  (:predicates
    (player-at ?l - location)
    (box-at ?l - location)
    (goal-at ?l - location)
    (adjacent ?l1 ?l2 - location)
    (clear ?l - location))
  (:action move
    :parameters (?from ?to - location)
    :precondition (and
      (player-at ?from)
      (clear ?to)
      (adjacent ?from ?to))
    :effect (and
      (not (player-at ?from))
      (player-at ?to)
      (clear ?from)
      (not (clear ?to))))
  (:action push
    :parameters (?player ?box ?new-box - location)
    :precondition (and
      (player-at ?player)
      (box-at ?box)
      (clear ?new-box)
      (adjacent ?player ?box)
      (adjacent ?box ?new-box))
    :effect (and
      (not (box-at ?box))
      (box-at ?new-box)
      (player-at ?box)
      (not (player-at ?player))
      (clear ?player)
      (not (clear ?new-box))))
)