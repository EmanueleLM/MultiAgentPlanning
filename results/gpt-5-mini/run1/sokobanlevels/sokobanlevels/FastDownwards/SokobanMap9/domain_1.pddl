(define (domain sokoban_corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box position)
  (:predicates
    (at_player ?pl - player ?p - position)
    (at_box ?b - box ?p - position)
    (goal ?p - position)
    (adj ?p - position ?q - position)
    (occupied ?p - position)
  )

  (:action move
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and
      (at_player ?pl ?from)
      (adj ?from ?to)
      (not (occupied ?to))
    )
    :effect (and
      (not (at_player ?pl ?from))
      (at_player ?pl ?to)
    )
  )

  (:action push
    :parameters (?pl - player ?player_from - position ?box_from - position ?box_to - position ?b - box)
    :precondition (and
      (at_player ?pl ?player_from)
      (at_box ?b ?box_from)
      (adj ?player_from ?box_from)
      (adj ?box_from ?box_to)
      (not (occupied ?box_to))
      (= ?player_from ?player_from) ; dummy equality removed by some parsers; kept harmless placeholder-free (no effect) - removed in final if parser rejects
    )
    :effect (and
      (not (at_player ?pl ?player_from))
      (at_player ?pl ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
      (not (occupied ?box_from))
      (occupied ?box_to)
    )
  )
)