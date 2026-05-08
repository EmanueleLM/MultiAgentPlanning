(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    movable
    cell
  )
  (:predicates
    (at ?m - movable ?c - cell)
    (clear ?c - cell)
    (adjacent ?c1 - cell ?c2 - cell)
    (is_goal ?c - cell)
  )
  (:action move-player-only
    :parameters (?from - cell ?to - cell)
    :precondition (and (at player ?from) (clear ?to) (adjacent ?from ?to))
    :effect (and (not (at player ?from)) (at player ?to))
  )
  (:action push-box
    :parameters (?player-from - cell ?box-from - cell ?box-to - cell)
    :precondition (and (at player ?player-from) (at box1 ?box-from) (clear ?box-to)
                       (adjacent ?player-from ?box-from) (adjacent ?box-from ?box-to))
    :effect (and (not (at player ?player-from)) (at player ?box-from)
                 (not (at box1 ?box-from)) (at box1 ?box-to)
                 (not (clear ?box-to)) (clear ?box-from))
  )
)