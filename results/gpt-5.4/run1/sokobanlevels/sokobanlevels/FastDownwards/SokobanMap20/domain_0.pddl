(define (domain sokoban_vertical_corridor)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    player box position
  )

  (:predicates
    (at_player ?pl - player ?pos - position)
    (at_box ?b - box ?pos - position)
    (adj_up ?from - position ?to - position)
    (adj_down ?from - position ?to - position)
    (goal_pos ?pos - position)
  )

  (:action move_up
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and
      (at_player ?pl ?from)
      (adj_up ?from ?to)
      (not (at_box box_1 ?to))
    )
    :effect (and
      (not (at_player ?pl ?from))
      (at_player ?pl ?to)
    )
  )

  (:action move_down
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and
      (at_player ?pl ?from)
      (adj_down ?from ?to)
      (not (at_box box_1 ?to))
    )
    :effect (and
      (not (at_player ?pl ?from))
      (at_player ?pl ?to)
    )
  )

  (:action push_up
    :parameters (?pl - player ?b - box ?player_pos - position ?box_pos - position ?dest - position)
    :precondition (and
      (at_player ?pl ?player_pos)
      (at_box ?b ?box_pos)
      (adj_up ?player_pos ?box_pos)
      (adj_up ?box_pos ?dest)
      (not (at_box ?b ?dest))
    )
    :effect (and
      (not (at_player ?pl ?player_pos))
      (at_player ?pl ?box_pos)
      (not (at_box ?b ?box_pos))
      (at_box ?b ?dest)
    )
  )

  (:action push_down
    :parameters (?pl - player ?b - box ?player_pos - position ?box_pos - position ?dest - position)
    :precondition (and
      (at_player ?pl ?player_pos)
      (at_box ?b ?box_pos)
      (adj_down ?player_pos ?box_pos)
      (adj_down ?box_pos ?dest)
      (not (at_box ?b ?dest))
    )
    :effect (and
      (not (at_player ?pl ?player_pos))
      (at_player ?pl ?box_pos)
      (not (at_box ?b ?box_pos))
      (at_box ?b ?dest)
    )
  )
)