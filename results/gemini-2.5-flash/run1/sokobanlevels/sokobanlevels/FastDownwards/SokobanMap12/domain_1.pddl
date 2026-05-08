(define (domain sokoban_map_12)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location
    item
  )
  (:predicates
    (player_at ?l - location)
    (box_at ?b - item ?l - location)
    (is_goal ?l - location)
    (wall ?l - location)
    (free ?l - location) ; true if no player, no box, and not a wall
    (adj_up ?l1 ?l2 - location)    ; ?l2 is immediately above ?l1 (i.e., ?l2.y = ?l1.y - 1)
    (adj_down ?l1 ?l2 - location)  ; ?l2 is immediately below ?l1 (i.e., ?l2.y = ?l1.y + 1)
  )

  ; Actions for player movement
  (:action move_up
    :parameters (?player_from ?player_to - location)
    :precondition (and
      (player_at ?player_from)
      (adj_up ?player_from ?player_to)
      (free ?player_to)
    )
    :effect (and
      (not (player_at ?player_from))
      (player_at ?player_to)
      (free ?player_from)
      (not (free ?player_to))
    )
  )

  (:action move_down
    :parameters (?player_from ?player_to - location)
    :precondition (and
      (player_at ?player_from)
      (adj_down ?player_from ?player_to)
      (free ?player_to)
    )
    :effect (and
      (not (player_at ?player_from))
      (player_at ?player_to)
      (free ?player_from)
      (not (free ?player_to))
    )
  )

  ; Actions for pushing a box
  (:action push_up
    :parameters (?box - item ?player_from ?box_from ?box_to - location)
    :precondition (and
      (player_at ?player_from)
      (box_at ?box ?box_from)
      (adj_up ?player_from ?box_from) ; player is below the box, in position to push up
      (adj_up ?box_from ?box_to)    ; box_to is above box_from, box moves up
      (free ?box_to)                 ; target cell for box must be free
    )
    :effect (and
      (not (player_at ?player_from))
      (player_at ?box_from)         ; player moves to the box's old position
      (not (box_at ?box ?box_from))
      (box_at ?box ?box_to)
      (free ?player_from)           ; player_from becomes free
      (not (free ?box_from))        ; box_from becomes occupied by player
      (not (free ?box_to))          ; box_to becomes occupied by box
    )
  )

  (:action push_down
    :parameters (?box - item ?player_from ?box_from ?box_to - location)
    :precondition (and
      (player_at ?player_from)
      (box_at ?box ?box_from)
      (adj_down ?player_from ?box_from) ; player is above the box, in position to push down
      (adj_down ?box_from ?box_to)    ; box_to is below box_from, box moves down
      (free ?box_to)                  ; target cell for box must be free
    )
    :effect (and
      (not (player_at ?player_from))
      (player_at ?box_from)         ; player moves to the box's old position
      (not (box_at ?box ?box_from))
      (box_at ?box ?box_to)
      (free ?player_from)           ; player_from becomes free
      (not (free ?box_from))        ; box_from becomes occupied by player
      (not (free ?box_to))          ; box_to becomes occupied by box
    )
  )
)