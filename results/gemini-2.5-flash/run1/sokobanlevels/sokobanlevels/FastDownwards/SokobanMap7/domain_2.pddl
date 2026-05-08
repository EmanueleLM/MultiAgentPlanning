(define (domain sokoban_map7)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location
    agent
    box
  )
  (:predicates
    (at_player ?l - location)
    (at_box ?b - box ?l - location)
    (is_goal ?l - location)
    (is_wall ?l - location)
    (connected_up ?l1 ?l2 - location)
    (connected_down ?l1 ?l2 - location)
    (connected_left ?l1 ?l2 - location)
    (connected_right ?l1 ?l2 - location)
  )

  ;; Player Move Actions
  (:action move_player_up
    :parameters (?p - agent ?from ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (connected_up ?from ?to)
      (not (is_wall ?to))
      (not (at_box box1 ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action move_player_down
    :parameters (?p - agent ?from ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (connected_down ?from ?to)
      (not (is_wall ?to))
      (not (at_box box1 ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action move_player_left
    :parameters (?p - agent ?from ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (connected_left ?from ?to)
      (not (is_wall ?to))
      (not (at_box box1 ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  (:action move_player_right
    :parameters (?p - agent ?from ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (connected_right ?from ?to)
      (not (is_wall ?to))
      (not (at_box box1 ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
    )
  )

  ;; Player Push Box Actions
  (:action push_box_up
    :parameters (?p - agent ?b - box ?player_at ?box_at ?box_to - location)
    :precondition (and
      (at_player ?p ?player_at)
      (at_box ?b ?box_at)
      (connected_up ?player_at ?box_at) ; Player below box
      (connected_up ?box_at ?box_to)   ; Box moves up
      (not (is_wall ?box_to))
      (not (at_box ?b ?box_to))        ; Target must not have another box
    )
    :effect (and
      (not (at_player ?p ?player_at))
      (at_player ?p ?box_at)
      (not (at_box ?b ?box_at))
      (at_box ?b ?box_to)
    )
  )

  (:action push_box_down
    :parameters (?p - agent ?b - box ?player_at ?box_at ?box_to - location)
    :precondition (and
      (at_player ?p ?player_at)
      (at_box ?b ?box_at)
      (connected_down ?player_at ?box_at) ; Player above box
      (connected_down ?box_at ?box_to)   ; Box moves down
      (not (is_wall ?box_to))
      (not (at_box ?b ?box_to))
    )
    :effect (and
      (not (at_player ?p ?player_at))
      (at_player ?p ?box_at)
      (not (at_box ?b ?box_at))
      (at_box ?b ?box_to)
    )
  )

  (:action push_box_left
    :parameters (?p - agent ?b - box ?player_at ?box_at ?box_to - location)
    :precondition (and
      (at_player ?p ?player_at)
      (at_box ?b ?box_at)
      (connected_left ?player_at ?box_at) ; Player right of box
      (connected_left ?box_at ?box_to)   ; Box moves left
      (not (is_wall ?box_to))
      (not (at_box ?b ?box_to))
    )
    :effect (and
      (not (at_player ?p ?player_at))
      (at_player ?p ?box_at)
      (not (at_box ?b ?box_at))
      (at_box ?b ?box_to)
    )
  )

  (:action push_box_right
    :parameters (?p - agent ?b - box ?player_at ?box_at ?box_to - location)
    :precondition (and
      (at_player ?p ?player_at)
      (at_box ?b ?box_at)
      (connected_right ?player_at ?box_at) ; Player left of box
      (connected_right ?box_at ?box_to)   ; Box moves right
      (not (is_wall ?box_to))
      (not (at_box ?b ?box_to))
    )
    :effect (and
      (not (at_player ?p ?player_at))
      (at_player ?p ?box_at)
      (not (at_box ?b ?box_at))
      (at_box ?b ?box_to)
    )
  )
)