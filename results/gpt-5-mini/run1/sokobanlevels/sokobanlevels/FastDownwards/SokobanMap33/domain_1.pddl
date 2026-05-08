(define (domain sokoban_instance)
  (:requirements :strips :typing)
  (:types position player box)
  (:predicates
    (player_at ?pl - player ?p - position)
    (box_at ?b - box ?p - position)
    (goal_position ?p - position)
    (free ?p - position)
    (adj_right ?p - position ?q - position)
    (adj_left ?p - position ?q - position)
  )

  ;; simple step right when destination is free
  (:action move_right
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and
      (player_at ?pl ?from)
      (adj_right ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?to)
      (free ?from)
      (not (free ?to))
    )
  )

  ;; simple step left when destination is free
  (:action move_left
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and
      (player_at ?pl ?from)
      (adj_left ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?to)
      (free ?from)
      (not (free ?to))
    )
  )

  ;; push box right: player at ?from, box at ?boxpos, destination ?box_to must be free.
  (:action push_right
    :parameters (?pl - player ?b - box ?from - position ?boxpos - position ?box_to - position)
    :precondition (and
      (player_at ?pl ?from)
      (box_at ?b ?boxpos)
      (adj_right ?from ?boxpos)
      (adj_right ?boxpos ?box_to)
      (free ?box_to)
    )
    :effect (and
      ;; box moves
      (not (box_at ?b ?boxpos))
      (box_at ?b ?box_to)
      ;; player moves into box previous position
      (not (player_at ?pl ?from))
      (player_at ?pl ?boxpos)
      ;; free flags update
      (free ?from)
      (not (free ?boxpos))
      (not (free ?box_to))
    )
  )

  ;; push box left: player at ?from, box at ?boxpos, destination ?box_to must be free.
  (:action push_left
    :parameters (?pl - player ?b - box ?from - position ?boxpos - position ?box_to - position)
    :precondition (and
      (player_at ?pl ?from)
      (box_at ?b ?boxpos)
      (adj_left ?from ?boxpos)
      (adj_left ?boxpos ?box_to)
      (free ?box_to)
    )
    :effect (and
      ;; box moves
      (not (box_at ?b ?boxpos))
      (box_at ?b ?box_to)
      ;; player moves into box previous position
      (not (player_at ?pl ?from))
      (player_at ?pl ?boxpos)
      ;; free flags update
      (free ?from)
      (not (free ?boxpos))
      (not (free ?box_to))
    )
  )
)