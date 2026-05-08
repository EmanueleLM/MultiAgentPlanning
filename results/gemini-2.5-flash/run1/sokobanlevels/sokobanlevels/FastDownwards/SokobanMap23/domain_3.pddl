(define (domain sokoban-sokobanmap23)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types player box location - object)
  (:predicates
    (player_at ?p - player ?l - location)
    (box_at ?b - box ?l - location)
    (is_goal ?l - location)
    (is_clear ?l - location) ; true if no player, no box
    (adj_up ?l1 ?l2 - location)
    (adj_down ?l1 ?l2 - location)
  )

  (:functions
    (total-cost)
  )

  ; Player moves into an empty adjacent location
  (:action move-player-up
    :parameters (?p - player ?from ?to - location)
    :precondition (and (player_at ?p ?from)
                       (adj_up ?from ?to)
                       (is_clear ?to))
    :effect (and (not (player_at ?p ?from))
                 (player_at ?p ?to)
                 (is_clear ?from)
                 (not (is_clear ?to))
                 (increase (total-cost) 1)))

  (:action move-player-down
    :parameters (?p - player ?from ?to - location)
    :precondition (and (player_at ?p ?from)
                       (adj_down ?from ?to)
                       (is_clear ?to))
    :effect (and (not (player_at ?p ?from))
                 (player_at ?p ?to)
                 (is_clear ?from)
                 (not (is_clear ?to))
                 (increase (total-cost) 1)))

  ; Player pushes a box into an adjacent empty location
  (:action push-box-up
    :parameters (?p - player ?b - box ?from_player ?from_box ?to_box - location)
    :precondition (and (player_at ?p ?from_player)
                       (box_at ?b ?from_box)
                       (adj_up ?from_player ?from_box) ; Player is immediately below the box
                       (adj_up ?from_box ?to_box)     ; Box can be pushed to the location above it
                       (is_clear ?to_box))            ; The target location for the box must be empty
    :effect (and (not (player_at ?p ?from_player)) ; Player leaves their original spot
                 (player_at ?p ?from_box)         ; Player moves to the box's original spot
                 (not (box_at ?b ?from_box))      ; Box leaves its original spot
                 (box_at ?b ?to_box)              ; Box moves to its new spot
                 (is_clear ?from_player)          ; Player's original spot becomes clear
                 (not (is_clear ?from_box))       ; Box's original spot (now player's spot) is no longer clear
                 (not (is_clear ?to_box))         ; Box's new spot is no longer clear
                 (increase (total-cost) 1)))

  (:action push-box-down
    :parameters (?p - player ?b - box ?from_player ?from_box ?to_box - location)
    :precondition (and (player_at ?p ?from_player)
                       (box_at ?b ?from_box)
                       (adj_down ?from_player ?from_box) ; Player is immediately above the box
                       (adj_down ?from_box ?to_box)     ; Box can be pushed to the location below it
                       (is_clear ?to_box))            ; The target location for the box must be empty
    :effect (and (not (player_at ?p ?from_player))
                 (player_at ?p ?from_box)
                 (not (box_at ?b ?from_box))
                 (box_at ?b ?to_box)
                 (is_clear ?from_player)
                 (not (is_clear ?from_box))
                 (not (is_clear ?to_box))
                 (increase (total-cost) 1)))
)