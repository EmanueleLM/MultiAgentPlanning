(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types location)
  (:predicates
    (at-player ?l - location)
    (at-box ?l - location)
    (adjacent ?l1 - location ?l2 - location)
    (clear ?l - location)
    (goal ?l - location)
  )
  
  (:action move
    :parameters (?from ?to - location)
    :precondition (and
      (at-player ?from)
      (adjacent ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (at-player ?from))
      (at-player ?to)
    )
  )

  (:action push
    :parameters (?from ?box ?to - location)
    :precondition (and
      (at-player ?from)
      (at-box ?box)
      (adjacent ?from ?box)
      (adjacent ?box ?to)
      (clear ?to)
    )
    :effect (and
      (not (at-player ?from))
      (not (at-box ?box))
      (at-player ?box)
      (at-box ?to)
    )
  )
)