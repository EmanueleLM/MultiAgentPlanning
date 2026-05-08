(define (domain sokobanmap5_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    box
    location
  )

  (:predicates
    (at ?obj - (either agent box) ?l - location) ; Fixed: (or agent box) changed to (either agent box)
    (is_goal ?l - location)
    (is_wall ?l - location)
    (adj_up ?from ?to - location)
    (adj_down ?from ?to - location)
    (adj_left ?from ?to - location)
    (adj_right ?from ?to - location)
  )

  ; Player moves actions
  (define (action move_up_player)
    :parameters (?p - agent ?from ?to - location)
    :precondition (and
      (at ?p ?from)
      (adj_up ?from ?to)
      (not (is_wall ?to))
      (not (at box1 ?to)) ; Player cannot move onto a box
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
    )
  )

  (define (action move_down_player)
    :parameters (?p - agent ?from ?to - location)
    :precondition (and
      (at ?p ?from)
      (adj_down ?from ?to)
      (not (is_wall ?to))
      (not (at box1 ?to)) ; Player cannot move onto a box
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
    )
  )

  (define (action move_left_player)
    :parameters (?p - agent ?from ?to - location)
    :precondition (and
      (at ?p ?from)
      (adj_left ?from ?to)
      (not (is_wall ?to))
      (not (at box1 ?to)) ; Player cannot move onto a box
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
    )
  )

  (define (action move_right_player)
    :parameters (?p - agent ?from ?to - location)
    :precondition (and
      (at ?p ?from)
      (adj_right ?from ?to)
      (not (is_wall ?to))
      (not (at box1 ?to)) ; Player cannot move onto a box
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
    )
  )

  ; Push box actions
  (define (action push_up_box)
    :parameters (?p - agent ?b - box ?player_from ?box_from ?box_to - location)
    :precondition (and
      (at ?p ?player_from)
      (at ?b ?box_from)
      (adj_up ?player_from ?box_from)  ; Player is below box
      (adj_up ?box_from ?box_to)      ; Box pushes up to box_to
      (not (is_wall ?box_to))
      (not (at ?p ?box_to))            ; Added: Box cannot be pushed onto the player (must be an "empty space")
    )
    :effect (and
      (not (at ?p ?player_from))
      (at ?p ?box_from)
      (not (at ?b ?box_from))
      (at ?b ?box_to)
    )
  )

  (define (action push_down_box)
    :parameters (?p - agent ?b - box ?player_from ?box_from ?box_to - location)
    :precondition (and
      (at ?p ?player_from)
      (at ?b ?box_from)
      (adj_down ?player_from ?box_from) ; Player is above box
      (adj_down ?box_from ?box_to)     ; Box pushes down to box_to
      (not (is_wall ?box_to))
      (not (at ?p ?box_to))            ; Added: Box cannot be pushed onto the player (must be an "empty space")
    )
    :effect (and
      (not (at ?p ?player_from))
      (at ?p ?box_from)
      (not (at ?b ?box_from))
      (at ?b ?box_to)
    )
  )

  (define (action push_left_box)
    :parameters (?p - agent ?b - box ?player_from ?box_from ?box_to - location)
    :precondition (and
      (at ?p ?player_from)
      (at ?b ?box_from)
      (adj_left ?player_from ?box_from)  ; Player is right of box
      (adj_left ?box_from ?box_to)       ; Box pushes left to box_to
      (not (is_wall ?box_to))
      (not (at ?p ?box_to))             ; Added: Box cannot be pushed onto the player (must be an "empty space")
    )
    :effect (and
      (not (at ?p ?player_from))
      (at ?p ?box_from)
      (not (at ?b ?box_from))
      (at ?b ?box_to)
    )
  )

  (define (action push_right_box)
    :parameters (?p - agent ?b - box ?player_from ?box_from ?box_to - location)
    :precondition (and
      (at ?p ?player_from)
      (at ?b ?box_from)
      (adj_right ?player_from ?box_from) ; Player is left of box
      (adj_right ?box_from ?box_to)      ; Box pushes right to box_to
      (not (is_wall ?box_to))
      (not (at ?p ?box_to))             ; Added: Box cannot be pushed onto the player (must be an "empty space")
    )
    :effect (and
      (not (at ?p ?player_from))
      (at ?p ?box_from)
      (not (at ?b ?box_from))
      (at ?b ?box_to)
    )
  )
)