(define (domain sokoban_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types position player box)
  (:predicates
    (player_at ?pl - player ?p - position)
    (box_at ?b - box ?p - position)
    (goal_position ?p - position)
    (adj_right ?p - position ?q - position)
    (adj_left ?p - position ?q - position)
    (adj_up ?p - position ?q - position)
    (adj_down ?p - position ?q - position)
  )

  ;; Move right: step into an adjacent right cell if it does not contain the box.
  (:action move_right
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and
      (player_at ?pl ?from)
      (adj_right ?from ?to)
      (not (box_at box1 ?to))
      (not (player_at ?pl ?to))
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?to)
    )
  )

  ;; Move left: step into an adjacent left cell if it does not contain the box.
  (:action move_left
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and
      (player_at ?pl ?from)
      (adj_left ?from ?to)
      (not (box_at box1 ?to))
      (not (player_at ?pl ?to))
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?to)
    )
  )

  ;; Move up (not applicable in this instance because no adj_up facts are in init).
  (:action move_up
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and
      (player_at ?pl ?from)
      (adj_up ?from ?to)
      (not (box_at box1 ?to))
      (not (player_at ?pl ?to))
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?to)
    )
  )

  ;; Move down (not applicable in this instance because no adj_down facts are in init).
  (:action move_down
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and
      (player_at ?pl ?from)
      (adj_down ?from ?to)
      (not (box_at box1 ?to))
      (not (player_at ?pl ?to))
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?to)
    )
  )

  ;; Push right: player to left of box pushes it one cell right; player moves into box's former cell.
  (:action push_right
    :parameters (?pl - player ?p_from - position ?boxpos - position ?box_to - position)
    :precondition (and
      (player_at ?pl ?p_from)
      (box_at box1 ?boxpos)
      (adj_right ?p_from ?boxpos)
      (adj_right ?boxpos ?box_to)
      (not (box_at box1 ?box_to))
      (not (player_at ?pl ?box_to))
    )
    :effect (and
      (not (box_at box1 ?boxpos))
      (box_at box1 ?box_to)
      (not (player_at ?pl ?p_from))
      (player_at ?pl ?boxpos)
    )
  )

  ;; Push left: player to right of box pushes it one cell left; player moves into box's former cell.
  (:action push_left
    :parameters (?pl - player ?p_from - position ?boxpos - position ?box_to - position)
    :precondition (and
      (player_at ?pl ?p_from)
      (box_at box1 ?boxpos)
      (adj_left ?p_from ?boxpos)
      (adj_left ?boxpos ?box_to)
      (not (box_at box1 ?box_to))
      (not (player_at ?pl ?box_to))
    )
    :effect (and
      (not (box_at box1 ?boxpos))
      (box_at box1 ?box_to)
      (not (player_at ?pl ?p_from))
      (player_at ?pl ?boxpos)
    )
  )

  ;; Push up (not applicable here).
  (:action push_up
    :parameters (?pl - player ?p_from - position ?boxpos - position ?box_to - position)
    :precondition (and
      (player_at ?pl ?p_from)
      (box_at box1 ?boxpos)
      (adj_up ?p_from ?boxpos)
      (adj_up ?boxpos ?box_to)
      (not (box_at box1 ?box_to))
      (not (player_at ?pl ?box_to))
    )
    :effect (and
      (not (box_at box1 ?boxpos))
      (box_at box1 ?box_to)
      (not (player_at ?pl ?p_from))
      (player_at ?pl ?boxpos)
    )
  )

  ;; Push down (not applicable here).
  (:action push_down
    :parameters (?pl - player ?p_from - position ?boxpos - position ?box_to - position)
    :precondition (and
      (player_at ?pl ?p_from)
      (box_at box1 ?boxpos)
      (adj_down ?p_from ?boxpos)
      (adj_down ?boxpos ?box_to)
      (not (box_at box1 ?box_to))
      (not (player_at ?pl ?box_to))
    )
    :effect (and
      (not (box_at box1 ?boxpos))
      (box_at box1 ?box_to)
      (not (player_at ?pl ?p_from))
      (player_at ?pl ?boxpos)
    )
  )
)