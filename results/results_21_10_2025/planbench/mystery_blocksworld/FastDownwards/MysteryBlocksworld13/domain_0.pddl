(define (domain block-move)
  (:requirements :strips :typing)
  (:types robot box location)

  (:predicates
    (at ?r - robot ?loc - location)
    (box_at ?b - box ?loc - location)
    (connected ?from - location ?to - location)
  )

  (:action move
    :parameters (?r - robot ?from - location ?to - location)
    :precondition (and (at ?r ?from) (connected ?from ?to))
    :effect (and (at ?r ?to) (not (at ?r ?from)))
  )

  (:action push
    :parameters (?r - robot ?b - box ?from - location ?to - location)
    :precondition (and (at ?r ?from) (box_at ?b ?from) (connected ?from ?to))
    :effect (and
              (box_at ?b ?to)
              (not (box_at ?b ?from))
              (at ?r ?to)
              (not (at ?r ?from))
            )
  )
)