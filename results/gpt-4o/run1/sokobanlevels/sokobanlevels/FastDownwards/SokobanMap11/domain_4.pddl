(define (domain sokoban)
  (:requirements :strips :typing)
  (:types player box goal position)
  (:predicates
    (at_player ?p - position)
    (at_box ?b - box ?p - position)
    (goal ?p - position)
    (adjacent ?p1 ?p2 - position)
    (clear ?p - position)
  )

  (:action move
    :parameters (?from ?to - position ?pl - player)
    :precondition (and
      (at_player ?from)
      (adjacent ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action push
    :parameters (?from ?to ?box_pos - position ?pl - player ?b - box)
    :precondition (and
      (at_player ?from)
      (adjacent ?from ?box_pos)
      (adjacent ?box_pos ?to)
      (at_box ?b ?box_pos)
      (clear ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?box_pos)
      (not (at_box ?b ?box_pos))
      (at_box ?b ?to)
    )
  )
)