(define (domain sokoban-map1)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    player
    box
    location
  )
  (:predicates
    (at_player ?l - location)
    (at_box ?b - box ?l - location)
    (is_goal ?l - location)
    (is_wall ?l - location)
    (is_free ?l - location) ; A location is free if no player and no box is on it
    (adj_left ?from ?to - location)
    (adj_right ?from ?to - location)
    (adj_up ?from ?to - location)
    (adj_down ?from ?to - location)
  )

  (:functions (total-cost))

  ;; Player movement actions
  (:action move_left
    :parameters (?p - player ?from ?to - location)
    :precondition (and
      (at_player ?from)
      (adj_left ?from ?to)
      (is_free ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (is_free ?from)
      (not (is_free ?to))
      (increase (total-cost) 1)
    )
  )

  (:action move_right
    :parameters (?p - player ?from ?to - location)
    :precondition (and
      (at_player ?from)
      (adj_right ?from ?to)
      (is_free ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (is_free ?from)
      (not (is_free ?to))
      (increase (total-cost) 1)
    )
  )

  (:action move_up
    :parameters (?p - player ?from ?to - location)
    :precondition (and
      (at_player ?from)
      (adj_up ?from ?to)
      (is_free ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (is_free ?from)
      (not (is_free ?to))
      (increase (total-cost) 1)
    )
  )

  (:action move_down
    :parameters (?p - player ?from ?to - location)
    :precondition (and
      (at_player ?from)
      (adj_down ?from ?to)
      (is_free ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (is_free ?from)
      (not (is_free ?to))
      (increase (total-cost) 1)
    )
  )

  ;; Player pushing box actions
  (:action push_left
    :parameters (?p - player ?b - box ?player_loc ?box_loc ?new_box_loc - location)
    :precondition (and
      (at_player ?player_loc)
      (at_box ?b ?box_loc)
      (adj_left ?player_loc ?box_loc)     ; Player is to the right of the box
      (adj_left ?box_loc ?new_box_loc)    ; Box moves left
      (is_free ?new_box_loc)              ; New box location must be empty
    )
    :effect (and
      (not (at_player ?player_loc))
      (at_player ?box_loc)                ; Player moves to old box location
      (not (at_box ?b ?box_loc))
      (at_box ?b ?new_box_loc)            ; Box moves to new location
      (is_free ?player_loc)               ; Old player location becomes free
      (not (is_free ?new_box_loc))        ; New box location becomes occupied
      (increase (total-cost) 1)
    )
  )

  (:action push_right
    :parameters (?p - player ?b - box ?player_loc ?box_loc ?new_box_loc - location)
    :precondition (and
      (at_player ?player_loc)
      (at_box ?b ?box_loc)
      (adj_right ?player_loc ?box_loc)    ; Player is to the left of the box
      (adj_right ?box_loc ?new_box_loc)   ; Box moves right
      (is_free ?new_box_loc)
    )
    :effect (and
      (not (at_player ?player_loc))
      (at_player ?box_loc)
      (not (at_box ?b ?box_loc))
      (at_box ?b ?new_box_loc)
      (is_free ?player_loc)
      (not (is_free ?new_box_loc))
      (increase (total-cost) 1)
    )
  )

  (:action push_up
    :parameters (?p - player ?b - box ?player_loc ?box_loc ?new_box_loc - location)
    :precondition (and
      (at_player ?player_loc)
      (at_box ?b ?box_loc)
      (adj_up ?player_loc ?box_loc)       ; Player is below the box
      (adj_up ?box_loc ?new_box_loc)      ; Box moves up
      (is_free ?new_box_loc)
    )
    :effect (and
      (not (at_player ?player_loc))
      (at_player ?box_loc)
      (not (at_box ?b ?box_loc))
      (at_box ?b ?new_box_loc)
      (is_free ?player_loc)
      (not (is_free ?new_box_loc))
      (increase (total-cost) 1)
    )
  )

  (:action push_down
    :parameters (?p - player ?b - box ?player_loc ?box_loc ?new_box_loc - location)
    :precondition (and
      (at_player ?player_loc)
      (at_box ?b ?box_loc)
      (adj_down ?player_loc ?box_loc)     ; Player is above the box
      (adj_down ?box_loc ?new_box_loc)    ; Box moves down
      (is_free ?new_box_loc)
    )
    :effect (and
      (not (at_player ?player_loc))
      (at_player ?box_loc)
      (not (at_box ?b ?box_loc))
      (at_box ?b ?new_box_loc)
      (is_free ?player_loc)
      (not (is_free ?new_box_loc))
      (increase (total-cost) 1)
    )
  )
)