(define (domain sokoban)
  (:requirements :strips :typing)
  (:types player box position)

  (:predicates
    (at ?e - (either player box) ?p - position)
    (adjacent ?p1 - position ?p2 - position)
    (empty ?p - position)
    (goal ?p - position)
  )

  (:action move
    :parameters (?p - player ?from - position ?to - position)
    :precondition (and (at ?p ?from) (adjacent ?from ?to) (empty ?to))
    :effect (and (not (at ?p ?from)) (at ?p ?to))
  )

  (:action push
    :parameters (?p - player ?b - box ?player_from - position ?box_from - position ?box_to - position)
    :precondition (and (at ?p ?player_from) (at ?b ?box_from)
                       (adjacent ?player_from ?box_from) (adjacent ?box_from ?box_to)
                       (empty ?box_to))
    :effect (and (not (at ?p ?player_from)) (not (at ?b ?box_from))
                 (at ?p ?box_from) (at ?b ?box_to))
  )
)