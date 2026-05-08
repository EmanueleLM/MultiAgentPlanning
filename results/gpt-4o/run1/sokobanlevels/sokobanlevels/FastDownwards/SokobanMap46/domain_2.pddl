(define (domain sokoban)
  (:requirements :strips :typing)
  (:types location movable)
  (:constants 
    player1 - movable
    box1 - movable
    l01 - location
    l50 - location
    l99 - location)
  (:predicates
    (at ?m - movable ?l - location)
    (goal ?l - location)
    (clear ?l - location)
    (adjacent ?l1 ?l2 - location))
  (:action move
    :parameters (?from ?to - location)
    :precondition (and 
      (at player1 ?from)
      (adjacent ?from ?to)
      (clear ?to))
    :effect (and 
      (not (at player1 ?from))
      (at player1 ?to)))
  (:action push
    :parameters (?from ?box ?to - location)
    :precondition (and
      (at player1 ?from)
      (at box1 ?box)
      (adjacent ?from ?box)
      (adjacent ?box ?to)
      (clear ?to))
    :effect (and
      (not (at box1 ?box))
      (at box1 ?to)
      (not (at player1 ?from))
      (at player1 ?box)))
)