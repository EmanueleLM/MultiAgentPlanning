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
    (connected ?c1 ?c2 - cell)
    (box-on-goal ?b - box_type)
  )

  (:functions (total-cost))

  ;; Action: move_player
  (action move-player
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (at-player ?from)
      (connected ?from ?to)
      (not (is-wall ?to))
      (not (at-box box1 ?to)) ;; Simplified for single box
    )
    :effect (and
      (not (at-player ?from))
      (at-player ?to)
      (increase (total-cost) 1)
    )
  )

  ;; Action: push_box (variant 1: from non-goal to non-goal)
  (action push-box-nongoal-to-nongoal
    :parameters (?player_pos - cell ?box_pos - cell ?target_box_pos - cell ?box - box_type)
    :precondition (and
      (at-player ?player_pos)
      (at-box ?box ?box_pos)
      (connected ?player_pos ?box_pos)
      (connected ?box_pos ?target_box_pos)
      (not (is-wall ?target_box_pos))
      (not (at-box ?box ?target_box_pos)) ;; Ensures target is empty of this box
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

  ;; Action: push_box (variant 2: from goal to non-goal)
  (action push-box-goal-to-nongoal
    :parameters (?player_pos - cell ?box_pos - cell ?target_box_pos - cell ?box - box_type)
    :precondition (and
      (at-player ?player_pos)
      (at-box ?box ?box_pos)
      (connected ?player_pos ?box_pos)
      (connected ?box_pos ?target_box_pos)
      (not (is-wall ?target_box_pos))
      (not (at-box ?box ?target_box_pos))
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

  ;; Action: push_box (variant 3: from non-goal to goal)
  (action push-box-nongoal-to-goal
    :parameters (?player_pos - cell ?box_pos - cell ?target_box_pos - cell ?box - box_type)
    :precondition (and
      (at-player ?player_pos)
      (at-box ?box ?box_pos)
      (connected ?player_pos ?box_pos)
      (connected ?box_pos ?target_box_pos)
      (not (is-wall ?target_box_pos))
      (not (at-box ?box ?target_box_pos))
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

  ;; Action: push_box (variant 4: from goal to goal)
  (action push-box-goal-to-goal
    :parameters (?player_pos - cell ?box_pos - cell ?target_box_pos - cell ?box - box_type)
    :precondition (and
      (at-player ?player_pos)
      (at-box ?box ?box_pos)
      (connected ?player_pos ?box_pos)
      (connected ?box_pos ?target_box_pos)
      (not (is-wall ?target_box_pos))
      (not (at-box ?box ?target_box_pos))
      (is-goal ?box_pos)
      (is-goal ?target_box_pos)
      (box-on-goal ?box)
    )
    :effect (and
      (not (at-player ?player_pos))
      (at-player ?box_pos)
      (not (at-box ?box ?box_pos))
      (at-box ?box ?target_box_pos)
      (increase (total-cost) 1)
    )
  )
)