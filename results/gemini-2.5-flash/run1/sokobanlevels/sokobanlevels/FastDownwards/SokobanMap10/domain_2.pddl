(define (domain sokoban_map10)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    location - object
  )
  (:predicates
    (is_player_at ?l - location)
    (is_box_at ?l - location)
    (is_goal_at ?l - location)
    (is_wall_at ?l - location)
    (connected ?l1 ?l2 - location)
  )
  (:functions
    (total-cost)
  )

  (:action move_player
    :parameters (?from ?to - location)
    :precondition (and
      (is_player_at ?from)
      (connected ?from ?to)
      (not (is_wall_at ?to))
      (not (is_box_at ?to))
    )
    :effect (and
      (not (is_player_at ?from))
      (is_player_at ?to)
      (increase (total-cost) 1)
    )
  )

  (:action push_box
    :parameters (?player_pre_push_loc ?box_pre_push_loc ?box_post_push_loc - location)
    :precondition (and
      (is_player_at ?player_pre_push_loc)
      (is_box_at ?box_pre_push_loc)
      (connected ?player_pre_push_loc ?box_pre_push_loc)
      (connected ?box_pre_push_loc ?box_post_push_loc)
      (not (is_wall_at ?box_post_push_loc))
      (not (is_box_at ?box_post_push_loc))
    )
    :effect (and
      (not (is_player_at ?player_pre_push_loc))
      (not (is_box_at ?box_pre_push_loc))
      (is_player_at ?box_pre_push_loc)
      (is_box_at ?box_post_push_loc)
      (increase (total-cost) 1)
    )
  )
)