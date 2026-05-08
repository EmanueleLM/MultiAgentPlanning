(define (domain sokoban_map25)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    cell
    player_type
    box_type
  )
  (:constants
    player1 - player_type
    box1 - box_type
  )
  (:predicates
    (at-player ?c - cell)
    (at-box ?b - box_type ?c - cell)
    (is-goal ?c - cell)
    (is-wall ?c - cell)
    (adj_up ?c1 ?c2 - cell)    ; ?c2 is immediately above ?c1 (e.g., c_2_1 is above c_3_1)
    (adj_down ?c1 ?c2 - cell)  ; ?c2 is immediately below ?c1 (e.g., c_3_1 is below c_2_1)
    (box-on-goal ?b - box_type)
  )

  (:functions (total-cost))

  ;; Player movement actions
  (:action move-up
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (at-player ?from)
      (adj_up ?from ?to) ; ?to is above ?from
      (not (is-wall ?to))
      (not (at-box box1 ?to))
    )
    :effect (and
      (not (at-player ?from))
      (at-player ?to)
      (increase (total-cost) 1)
    )
  )

  (:action move-down
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (at-player ?from)
      (adj_down ?from ?to) ; ?to is below ?from
      (not (is-wall ?to))
      (not (at-box box1 ?to))
    )
    :effect (and
      (not (at-player ?from))
      (at-player ?to)
      (increase (total-cost) 1)
    )
  )

  ;; Push box up actions (player below box, box moves up)
  (:action push-box-up-nongoal-to-nongoal
    :parameters (?player_pos - cell ?box_pos - cell ?target_box_pos - cell ?box - box_type)
    :precondition (and
      (at-player ?player_pos)
      (at-box ?box ?box_pos)
      (adj_down ?player_pos ?box_pos) ; Player is below the box
      (adj_up ?box_pos ?target_box_pos)   ; Box moves up
      (not (is-wall ?target_box_pos))
      (not (at-box ?box ?target_box_pos)) ; Target must be empty
      (not (is-goal ?box_pos))
      (not (is-goal ?target_box_pos))
      (not (box-on-goal ?box))
    )
    :effect (and
      (not (at-player ?player_pos))
      (at-player ?box_pos)
      (not (at-box ?box ?box_pos))
      (at-box ?box ?target_box_pos)
      (increase (total-cost) 1)
    )
  )

  (:action push-box-up-nongoal-to-goal
    :parameters (?player_pos - cell ?box_pos - cell ?target_box_pos - cell ?box - box_type)
    :precondition (and
      (at-player ?player_pos)
      (at-box ?box ?box_pos)
      (adj_down ?player_pos ?box_pos) ; Player is below the box
      (adj_up ?box_pos ?target_box_pos)   ; Box moves up
      (not (is-wall ?target_box_pos))
      (not (at-box ?box ?target_box_pos)) ; Target must be empty
      (not (is-goal ?box_pos))
      (is-goal ?target_box_pos)
      (not (box-on-goal ?box))
    )
    :effect (and
      (not (at-player ?player_pos))
      (at-player ?box_pos)
      (not (at-box ?box ?box_pos))
      (at-box ?box ?target_box_pos)
      (box-on-goal ?box)
      (increase (total-cost) 1)
    )
  )

  (:action push-box-up-goal-to-nongoal
    :parameters (?player_pos - cell ?box_pos - cell ?target_box_pos - cell ?box - box_type)
    :precondition (and
      (at-player ?player_pos)
      (at-box ?box ?box_pos)
      (adj_down ?player_pos ?box_pos) ; Player is below the box
      (adj_up ?box_pos ?target_box_pos)   ; Box moves up
      (not (is-wall ?target_box_pos))
      (not (at-box ?box ?target_box_pos)) ; Target must be empty
      (is-goal ?box_pos)
      (not (is-goal ?target_box_pos))
      (box-on-goal ?box)
    )
    :effect (and
      (not (at-player ?player_pos))
      (at-player ?box_pos)
      (not (at-box ?box ?box_pos))
      (at-box ?box ?target_box_pos)
      (not (box-on-goal ?box))
      (increase (total-cost) 1)
    )
  )

  ;; Push box down actions (player above box, box moves down)
  (:action push-box-down-nongoal-to-nongoal
    :parameters (?player_pos - cell ?box_pos - cell ?target_box_pos - cell ?box - box_type)
    :precondition (and
      (at-player ?player_pos)
      (at-box ?box ?box_pos)
      (adj_up ?player_pos ?box_pos)   ; Player is above the box
      (adj_down ?box_pos ?target_box_pos) ; Box moves down
      (not (is-wall ?target_box_pos))
      (not (at-box ?box ?target_box_pos)) ; Target must be empty
      (not (is-goal ?box_pos))
      (not (is-goal ?target_box_pos))
      (not (box-on-goal ?box))
    )
    :effect (and
      (not (at-player ?player_pos))
      (at-player ?box_pos)
      (not (at-box ?box ?box_pos))
      (at-box ?box ?target_box_pos)
      (increase (total-cost) 1)
    )
  )

  (:action push-box-down-nongoal-to-goal
    :parameters (?player_pos - cell ?box_pos - cell ?target_box_pos - cell ?box - box_type)
    :precondition (and
      (at-player ?player_pos)
      (at-box ?box ?box_pos)
      (adj_up ?player_pos ?box_pos)   ; Player is above the box
      (adj_down ?box_pos ?target_box_pos) ; Box moves down
      (not (is-wall ?target_box_pos))
      (not (at-box ?box ?target_box_pos)) ; Target must be empty
      (not (is-goal ?box_pos))
      (is-goal ?target_box_pos)
      (not (box-on-goal ?box))
    )
    :effect (and
      (not (at-player ?player_pos))
      (at-player ?box_pos)
      (not (at-box ?box ?box_pos))
      (at-box ?box ?target_box_pos)
      (box-on-goal ?box)
      (increase (total-cost) 1)
    )
  )

  (:action push-box-down-goal-to-nongoal
    :parameters (?player_pos - cell ?box_pos - cell ?target_box_pos - cell ?box - box_type)
    :precondition (and
      (at-player ?player_pos)
      (at-box ?box ?box_pos)
      (adj_up ?player_pos ?box_pos)   ; Player is above the box
      (adj_down ?box_pos ?target_box_pos) ; Box moves down
      (not (is-wall ?target_box_pos))
      (not (at-box ?box ?target_box_pos)) ; Target must be empty
      (is-goal ?box_pos)
      (not (is-goal ?target_box_pos))
      (box-on-goal ?box)
    )
    :effect (and
      (not (at-player ?player_pos))
      (at-player ?box_pos)
      (not (at-box ?box ?box_pos))
      (at-box ?box ?target_box_pos)
      (not (box-on-goal ?box))
      (increase (total-cost) 1)
    )
  )
)