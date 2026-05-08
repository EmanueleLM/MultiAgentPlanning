(define (domain sokobanmap13)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    character
    player_type - character
    box_type - character
    location
  )
  (:constants
    box1 - box_type
  )
  (:predicates
    (at_player ?l - location)
    (at_box ?b - box_type ?l - location)
    (is_goal_pos ?l - location)
    (connected_down ?l1 ?l2 - location)
    (connected_up ?l1 ?l2 - location)
    (connected_left ?l1 ?l2 - location)
    (connected_right ?l1 ?l2 - location)
  )

  ;; Player Movement Actions
  (:action move_player_down
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_player ?from)
      (connected_down ?from ?to)
      (not (at_box box1 ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action move_player_up
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_player ?from)
      (connected_up ?from ?to)
      (not (at_box box1 ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action move_player_left
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_player ?from)
      (connected_left ?from ?to)
      (not (at_box box1 ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  (:action move_player_right
    :parameters (?from - location ?to - location)
    :precondition (and
      (at_player ?from)
      (connected_right ?from ?to)
      (not (at_box box1 ?to))
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
    )
  )

  ;; Box Pushing Actions
  (:action push_box_down
    :parameters (?b - box_type ?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?player_from)
      (at_box ?b ?box_from)
      (connected_down ?player_from ?box_from)
      (connected_down ?box_from ?box_to)
      (not (at_player ?box_to))
      (not (at_box ?b ?box_to))
    )
    :effect (and
      (not (at_player ?player_from))
      (at_player ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
    )
  )

  (:action push_box_up
    :parameters (?b - box_type ?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?player_from)
      (at_box ?b ?box_from)
      (connected_up ?player_from ?box_from)
      (connected_up ?box_from ?box_to)
      (not (at_player ?box_to))
      (not (at_box ?b ?box_to))
    )
    :effect (and
      (not (at_player ?player_from))
      (at_player ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
    )
  )

  (:action push_box_left
    :parameters (?b - box_type ?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?player_from)
      (at_box ?b ?box_from)
      (connected_left ?player_from ?box_from)
      (connected_left ?box_from ?box_to)
      (not (at_player ?box_to))
      (not (at_box ?b ?box_to))
    )
    :effect (and
      (not (at_player ?player_from))
      (at_player ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
    )
  )

  (:action push_box_right
    :parameters (?b - box_type ?player_from - location ?box_from - location ?box_to - location)
    :precondition (and
      (at_player ?player_from)
      (at_box ?b ?box_from)
      (connected_right ?player_from ?box_from)
      (connected_right ?box_from ?box_to)
      (not (at_player ?box_to))
      (not (at_box ?b ?box_to))
    )
    :effect (and
      (not (at_player ?player_from))
      (at_player ?box_from)
      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to)
    )
  )
)