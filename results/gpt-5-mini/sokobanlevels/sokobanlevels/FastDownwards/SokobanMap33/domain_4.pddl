(define (domain sokoban_1d_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box cell)

  (:constants
    box_box1 - box
  )

  (:predicates
    (player_at ?pl - player ?c - cell)
    (box_at ?b - box ?c - cell)
    (goal_cell ?c - cell)
    (floor_cell ?c - cell)
    (adj_right ?left - cell ?right - cell)
    (adj_left ?right - cell ?left - cell)
  )

  ;; simple move to the right (no push)
  (:action move_right
    :parameters (?pl - player ?from - cell ?to - cell)
    :precondition (and
      (player_at ?pl ?from)
      (floor_cell ?to)
      (adj_right ?from ?to)
      (not (box_at box_box1 ?to))
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?to)
    )
  )

  ;; simple move to the left (no push)
  (:action move_left
    :parameters (?pl - player ?from - cell ?to - cell)
    :precondition (and
      (player_at ?pl ?from)
      (floor_cell ?to)
      (adj_left ?from ?to)
      (not (box_at box_box1 ?to))
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?to)
    )
  )

  ;; push the single box one cell to the right
  (:action push_right
    :parameters (?pl - player ?from - cell ?boxcell - cell ?to - cell)
    :precondition (and
      (player_at ?pl ?from)
      (box_at box_box1 ?boxcell)
      (adj_right ?from ?boxcell)
      (adj_right ?boxcell ?to)
      (floor_cell ?to)
      (not (box_at box_box1 ?to))
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?boxcell)
      (not (box_at box_box1 ?boxcell))
      (box_at box_box1 ?to)
    )
  )

  ;; push the single box one cell to the left
  (:action push_left
    :parameters (?pl - player ?from - cell ?boxcell - cell ?to - cell)
    :precondition (and
      (player_at ?pl ?from)
      (box_at box_box1 ?boxcell)
      (adj_left ?from ?boxcell)
      (adj_left ?boxcell ?to)
      (floor_cell ?to)
      (not (box_at box_box1 ?to))
    )
    :effect (and
      (not (player_at ?pl ?from))
      (player_at ?pl ?boxcell)
      (not (box_at box_box1 ?boxcell))
      (box_at box_box1 ?to)
    )
  )

)