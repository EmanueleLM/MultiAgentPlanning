(define (domain sokoban-domain)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location)
  (:predicates
    (at_player ?l - location)
    (at_box ?l - location)
    (is_goal ?l - location)
    (clear ?l - location) ; Indicates that a location is empty (no player, no box)
    (right_of ?l1 ?l2 - location) ; ?l2 is immediately to the right of ?l1
    (left_of ?l1 ?l2 - location)  ; ?l2 is immediately to the left of ?l1
  )

  (:functions
    (total_cost) - number
  )

  ;; Action for player to move right into a clear adjacent cell
  (:action move_player_right
    :parameters (?from ?to - location)
    :precondition (and
      (at_player ?from)
      (clear ?to)
      (right_of ?from ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (not (clear ?to))
      (clear ?from)
      (increase (total_cost) 1)
    )
  )

  ;; Action for player to move left into a clear adjacent cell
  (:action move_player_left
    :parameters (?from ?to - location)
    :precondition (and
      (at_player ?from)
      (clear ?to)
      (left_of ?from ?to)
    )
    :effect (and
      (not (at_player ?from))
      (at_player ?to)
      (not (clear ?to))
      (clear ?from)
      (increase (total_cost) 1)
    )
  )

  ;; Action for player to push a box to the right
  (:action push_box_right
    :parameters (?p_loc ?b_loc ?t_loc - location) ; player_location, box_location, target_location_for_box
    :precondition (and
      (at_player ?p_loc)
      (at_box ?b_loc)
      (clear ?t_loc)
      (right_of ?p_loc ?b_loc) ; player is to the left of the box
      (right_of ?b_loc ?t_loc) ; box can be pushed right to target
    )
    :effect (and
      (not (at_player ?p_loc))
      (not (at_box ?b_loc))
      (not (clear ?t_loc))
      (at_player ?b_loc) ; player moves to where the box was
      (at_box ?t_loc)    ; box moves to the target location
      (clear ?p_loc)     ; player's old spot is now clear
      (increase (total_cost) 1)
    )
  )

  ;; Action for player to push a box to the left
  (:action push_box_left
    :parameters (?p_loc ?b_loc ?t_loc - location) ; player_location, box_location, target_location_for_box
    :precondition (and
      (at_player ?p_loc)
      (at_box ?b_loc)
      (clear ?t_loc)
      (left_of ?p_loc ?b_loc) ; player is to the right of the box
      (left_of ?b_loc ?t_loc) ; box can be pushed left to target
    )
    :effect (and
      (not (at_player ?p_loc))
      (not (at_box ?b_loc))
      (not (clear ?t_loc))
      (at_player ?b_loc) ; player moves to where the box was
      (at_box ?t_loc)    ; box moves to the target location
      (clear ?p_loc)     ; player's old spot is now clear
      (increase (total_cost) 1)
    )
  )
)