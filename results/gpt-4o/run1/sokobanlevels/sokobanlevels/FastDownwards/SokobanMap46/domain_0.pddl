(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types location movable static)
  (:constants 
    player1 - movable
    box1 - movable
    goal1 - static
    l01 l50 l98 l99 - location)
  (:predicates
    (at ?m - movable ?l - location)
    (goal ?l - location)
    (clear ?l - location)
    (adjacent ?l1 - location ?l2 - location))
  (:action move
    :parameters (?l1 ?l2 - location)
    :precondition (and 
      (at player1 ?l1)
      (adjacent ?l1 ?l2)
      (clear ?l2))
    :effect (and 
      (not (at player1 ?l1))
      (at player1 ?l2)))
  (:action push
    :parameters (?l1 ?l2 ?l3 - location)
    :precondition (and
      (at player1 ?l1)
      (at box1 ?l2)
      (adjacent ?l1 ?l2)
      (adjacent ?l2 ?l3)
      (clear ?l3))
    :effect (and
      (not (at box1 ?l2))
      (at box1 ?l3)
      (not (at player1 ?l1))
      (at player1 ?l2))))