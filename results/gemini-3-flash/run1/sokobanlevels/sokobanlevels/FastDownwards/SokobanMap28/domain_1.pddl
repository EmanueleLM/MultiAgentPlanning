(define (domain sokoban)
  (:requirements :strips :typing)
  (:types
    location direction
  )
  (:predicates
    (at-player ?l - location)
    (at-box ?l - location)
    (clear ?l - location)
    (adj-dir ?l1 - location ?l2 - location ?d - direction)
  )

  (:action move
    :parameters (?from - location ?to - location ?dir - direction)
    :precondition (and
      (at-player ?from)
      (clear ?to)
      (adj-dir ?from ?to ?dir)
    )
    :effect (and
      (not (at-player ?from))
      (at-player ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action push
    :parameters (?p_from - location ?b_from - location ?b_to - location ?dir - direction)
    :precondition (and
      (at-player ?p_from)
      (at-box ?b_from)
      (clear ?b_to)
      (adj-dir ?p_from ?b_from ?dir)
      (adj-dir ?b_from ?b_to ?dir)
    )
    :effect (and
      (not (at-player ?p_from))
      (at-player ?b_from)
      (not (at-box ?b_from))
      (at-box ?b_to)
      (clear ?p_from)
      (not (clear ?b_to))
    )
  )
)