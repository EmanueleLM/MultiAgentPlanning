(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity location)
  (:predicates
    (player-at ?l - location)
    (box-at ?l - location)
    (goal-at ?l - location)
    (adjacent ?l1 ?l2 - location)
    (empty ?l - location))
  (:action move-player
    :parameters (?from ?to - location)
    :precondition (and
      (player-at ?from)
      (empty ?to)
      (adjacent ?from ?to))
    :effect (and
      (not (player-at ?from))
      (player-at ?to)
      (not (empty ?to))
      (empty ?from)))
  (:action push-box
    :parameters (?player-pos ?box-pos ?new-box-pos - location)
    :precondition (and
      (player-at ?player-pos)
      (box-at ?box-pos)
      (empty ?new-box-pos)
      (adjacent ?player-pos ?box-pos)
      (adjacent ?box-pos ?new-box-pos))
    :effect (and
      (not (box-at ?box-pos))
      (box-at ?new-box-pos)
      (player-at ?box-pos)
      (not (player-at ?player-pos))
      (empty ?player-pos)
      (not (empty ?new-box-pos))))
  )