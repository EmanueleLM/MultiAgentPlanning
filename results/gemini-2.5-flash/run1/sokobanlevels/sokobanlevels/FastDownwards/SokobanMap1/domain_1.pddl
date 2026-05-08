(define (domain sokoban_domain)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    cell - object
  )
  (:predicates
    (at_player ?p - object ?l - cell)
    (at_box ?b - object ?l - cell)
    (is_goal ?l - cell)
    (is_wall ?l - cell)
    (clear ?l - cell) ; A cell is clear if it's not a wall and not occupied by player or box
    (adjacent ?l1 - cell ?l2 - cell)
  )
  (:functions (total-cost))

  ;; Player moves to an empty adjacent cell
  (:action move_player
    :parameters (?p - object ?from - cell ?to - cell)
    :precondition (and
      (at_player ?p ?from)
      (adjacent ?from ?to)
      (clear ?to) ; Target cell must be clear (implies not a wall, not occupied by box/player)
    )
    :effect (and
      (not (at_player ?p ?from))
      (at_player ?p ?to)
      (clear ?from) ; Old player spot becomes clear
      (not (clear ?to)) ; New player spot is no longer clear
      (increase (total-cost) 1)
    )
  )

  ;; Player pushes a box
  (:action push_box
    :parameters (?p - object ?b - object ?player_from - cell ?box_from - cell ?box_to - cell)
    :precondition (and
      (at_player ?p ?player_from)
      (at_box ?b ?box_from)
      (adjacent ?player_from ?box_from) ; Player next to box
      (adjacent ?box_from ?box_to)     ; Box can be pushed to ?box_to
      (clear ?box_to)                 ; Target cell for box must be clear
    )
    :effect (and
      (not (at_player ?p ?player_from))
      (at_player ?p ?box_from) ; Player moves to box's old spot

      (not (at_box ?b ?box_from))
      (at_box ?b ?box_to) ; Box moves to new spot

      (clear ?player_from) ; Player's original spot becomes clear
      (not (clear ?box_from)) ; Box's original spot (now player's spot) is not clear
      (not (clear ?box_to)) ; Box's new spot is not clear
      (increase (total-cost) 1)
    )
  )
)