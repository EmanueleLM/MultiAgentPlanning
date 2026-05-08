(define (domain sokoban-map1)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    player
    box
    location
  )
  (:predicates
    (at_player ?p - player ?l - location)
    (at_box ?b - box ?l - location)
    (is_goal ?l - location)
    (is_wall ?l - location)
    (adj_left ?from ?to - location)
    (adj_right ?from ?to - location)
    (adj_up ?from ?to - location)
    (adj_down ?from ?to - location)
  )

  (:functions (total-cost))

  ;; Player movement actions
  ;; Removed ?b - box parameter as it's not directly involved in player's empty-space movement.
  ;; Explicitly checking against box1.
  (:action move_left
    :parameters (?p - player ?from ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (adj_left ?from ?to)
      (not (is_wall ?to))
      (not (at_box box1 ?to)) ; Target location must not contain box1
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
      (increase (total-cost) 1)
    )
  )

  (:action move_right
    :parameters (?p - player ?from ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (adj_right ?from ?to)
      (not (is_wall ?to))
      (not (at_box box1 ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
      (increase (total-cost) 1)
    )
  )

  (:action move_up
    :parameters (?p - player ?from ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (adj_up ?from ?to)
      (not (is_wall ?to))
      (not (at_box box1 ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
      (increase (total-cost) 1)
    )
  )

  (:action move_down
    :parameters (?p - player ?from ?to - location)
    :precondition (and
      (at_player ?p ?from)
      (adj_down ?from ?to)
      (not (is_wall ?to))
      (not (at_box box1 ?to))
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
      (increase (total-cost) 1)
    )
  )

  ;; Player pushing box actions (parameters remain as they involve the box directly)
  (:action push_left
    :parameters (?p - player ?b - box ?player_loc ?box_loc ?new_box_loc - location)
    :precondition (and
      (at_player ?p ?player_loc)
      (at_box ?b ?box_loc)
      (adj_right ?player_loc ?box_loc)    ; Player is to the right of the box, pushing it left
      (adj_left ?box_loc ?new_box_loc)    ; Box moves left
      (not (is_wall ?new_box_loc))        ; New box location must not be a wall
      (not (at_box ?b ?new_box_loc))      ; New box location must not have another box
    )
    :effect (and
      (not (at_player ?p ?player_loc))
      (at_player ?p ?box_loc)             ; Player moves to old box location
      (not (at_box ?b ?box_loc))
      (at_box ?b ?new_box_loc)            ; Box moves to new location
      (increase (total-cost) 1)
    )
  )

  (:action push_right
    :parameters (?p - player ?b - box ?player_loc ?box_loc ?new_box_loc - location)
    :precondition (and
      (at_player ?p ?player_loc)
      (at_box ?b ?box_loc)
      (adj_left ?player_loc ?box_loc)     ; Player is to the left of the box, pushing it right
      (adj_right ?box_loc ?new_box_loc)   ; Box moves right
      (not (is_wall ?new_box_loc))
      (not (at_box ?b ?new_box_loc))
    )
    :effect (and
      (not (at_player ?p ?player_loc))
      (at_player ?p ?box_loc)
      (not (at_box ?b ?box_loc))
      (at_box ?b ?new_box_loc)
      (increase (total-cost) 1)
    )
  )

  (:action push_up
    :parameters (?p - player ?b - box ?player_loc ?box_loc ?new_box_loc - location)
    :precondition (and
      (at_player ?p ?player_loc)
      (at_box ?b ?box_loc)
      (adj_down ?player_loc ?box_loc)     ; Player is below the box, pushing it up
      (adj_up ?box_loc ?new_box_loc)      ; Box moves up
      (not (is_wall ?new_box_loc))
      (not (at_box ?b ?new_box_loc))
    )
    :effect (and
      (not (at_player ?p ?player_loc))
      (at_player ?p ?box_loc)
      (not (at_box ?b ?box_loc))
      (at_box ?b ?new_box_loc)
      (increase (total-cost) 1)
    )
  )

  (:action push_down
    :parameters (?p - player ?b - box ?player_loc ?box_loc ?new_box_loc - location)
    :precondition (and
      (at_player ?p ?player_loc)
      (at_box ?b ?box_loc)
      (adj_up ?player_loc ?box_loc)       ; Player is above the box, pushing it down
      (adj_down ?box_loc ?new_box_loc)    ; Box moves down
      (not (is_wall ?new_box_loc))
      (not (at_box ?b ?new_box_loc))
    )
    :effect (and
      (not (at_player ?p ?player_loc))
      (at_player ?p ?box_loc)
      (not (at_box ?b ?box_loc))
      (at_box ?b ?new_box_loc)
      (increase (total-cost) 1)
    )
  )
)