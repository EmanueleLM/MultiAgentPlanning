(define (domain sokoban_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box position)
  (:predicates
    (at_player ?p - position)
    (at_box ?b - box ?p - position)
    (goal ?p - position)
    (adj ?p - position ?q - position)
  )

  (:action move
    :parameters (?from - position ?to - position)
    :precondition (and
      (at_player ?from)
      (adj ?from ?to)
      (not (at_box box_1 ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action push
    :parameters (?player_from - position ?box_from - position ?box_to - position)
    :precondition (and
      (at_player ?player_from)
      (at_box box_1 ?box_from)
      (adj ?player_from ?box_from)
      (adj ?box_from ?box_to)
      (not (at_box box_1 ?box_to))
    )
    :effect (and
      (not (at_player ?player_from))
      (at_player ?box_from)
      (not (at_box box_1 ?box_from))
      (at_box box_1 ?box_to)
    )
  )
)