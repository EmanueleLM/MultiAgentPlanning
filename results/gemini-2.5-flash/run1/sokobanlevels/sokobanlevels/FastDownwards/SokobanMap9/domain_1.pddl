(define (domain sokoban-map9)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location
    player
    box
  )
  (:predicates
    (at ?obj - (player | box) ?loc - location)
    (is_goal ?loc - location)
    (is_wall ?loc - location)
    (is_up ?from ?to - location)    ; ?to is immediately above ?from
    (is_down ?from ?to - location)  ; ?to is immediately below ?from
  )
  (:functions
    (total-cost)
  )

  ;; Player movement actions (without pushing)
  (action move-player-up
    :parameters (?p - player ?from ?to - location)
    :precondition (and
      (at ?p ?from)
      (is_up ?from ?to)
      (not (is_wall ?to))
      (not (exists (?b - box) (at ?b ?to))) ; ?to must not have a box
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
      (increase (total-cost) 1)
    )
  )

  (action move-player-down
    :parameters (?p - player ?from ?to - location)
    :precondition (and
      (at ?p ?from)
      (is_down ?from ?to)
      (not (is_wall ?to))
      (not (exists (?b - box) (at ?b ?to))) ; ?to must not have a box
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
      (increase (total-cost) 1)
    )
  )

  ;; Box pushing actions
  ;; Push box up: Player below box, pushes it up.
  ;; P: player_loc, B: box_loc, T: target_loc
  ;; P --is_up--> B --is_up--> T
  (action push-box-up
    :parameters (?p - player ?b - box ?player_loc ?box_loc ?target_loc - location)
    :precondition (and
      (at ?p ?player_loc)
      (at ?b ?box_loc)
      (is_up ?player_loc ?box_loc)   ; player is directly below box
      (is_up ?box_loc ?target_loc)   ; box can move up to target
      (not (is_wall ?target_loc))    ; target is not a wall
      (not (exists (?other_b - box) (and (not (= ?other_b ?b)) (at ?other_b ?target_loc)))) ; target must not have another box
      (not (at ?p ?target_loc))      ; player cannot be at target_loc
    )
    :effect (and
      (not (at ?p ?player_loc))      ; player moves to box_loc
      (at ?p ?box_loc)
      (not (at ?b ?box_loc))         ; box moves to target_loc
      (at ?b ?target_loc)
      (increase (total-cost) 1)
    )
  )

  ;; Push box down: Player above box, pushes it down.
  ;; T: target_loc, B: box_loc, P: player_loc
  ;; T <--is_down-- B <--is_down-- P
  (action push-box-down
    :parameters (?p - player ?b - box ?player_loc ?box_loc ?target_loc - location)
    :precondition (and
      (at ?p ?player_loc)
      (at ?b ?box_loc)
      (is_down ?player_loc ?box_loc) ; player is directly above box
      (is_down ?box_loc ?target_loc) ; box can move down to target
      (not (is_wall ?target_loc))    ; target is not a wall
      (not (exists (?other_b - box) (and (not (= ?other_b ?b)) (at ?other_b ?target_loc)))) ; target must not have another box
      (not (at ?p ?target_loc))      ; player cannot be at target_loc
    )
    :effect (and
      (not (at ?p ?player_loc))      ; player moves to box_loc
      (at ?p ?box_loc)
      (not (at ?b ?box_loc))         ; box moves to target_loc
      (at ?b ?target_loc)
      (increase (total-cost) 1)
    )
  )
)