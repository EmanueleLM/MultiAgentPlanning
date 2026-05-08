(define (domain sokoban-map12)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location)
  (:predicates
    (is_player ?l - location)
    (is_box ?l - location)
    (is_goal ?l - location)
    (is_wall ?l - location)
    (connected_north ?l1 ?l2 - location)
    (connected_south ?l1 ?l2 - location)
    (connected_east ?l1 ?l2 - location)
    (connected_west ?l1 ?l2 - location)
  )

  (:functions
    (total-cost)
  )

  ;; Player movement actions
  (:action move_north
    :parameters (?from ?to - location)
    :precondition (and
      (is_player ?from)
      (connected_north ?from ?to)
      (not (is_wall ?to))
      (not (is_box ?to))
    )
    :effect (and
      (not (is_player ?from))
      (is_player ?to)
      (increase (total-cost) 1)
    )
  )

  (:action move_south
    :parameters (?from ?to - location)
    :precondition (and
      (is_player ?from)
      (connected_south ?from ?to)
      (not (is_wall ?to))
      (not (is_box ?to))
    )
    :effect (and
      (not (is_player ?from))
      (is_player ?to)
      (increase (total-cost) 1)
    )
  )

  (:action move_east
    :parameters (?from ?to - location)
    :precondition (and
      (is_player ?from)
      (connected_east ?from ?to)
      (not (is_wall ?to))
      (not (is_box ?to))
    )
    :effect (and
      (not (is_player ?from))
      (is_player ?to)
      (increase (total-cost) 1)
    )
  )

  (:action move_west
    :parameters (?from ?to - location)
    :precondition (and
      (is_player ?from)
      (connected_west ?from ?to)
      (not (is_wall ?to))
      (not (is_box ?to))
    )
    :effect (and
      (not (is_player ?from))
      (is_player ?to)
      (increase (total-cost) 1)
    )
  )

  ;; Box pushing actions
  (:action push_north
    :parameters (?player_from ?box_from ?box_to - location)
    :precondition (and
      (is_player ?player_from)
      (connected_north ?player_from ?box_from) ; player is south of box
      (is_box ?box_from)
      (connected_north ?box_from ?box_to) ; box's target is north of box
      (not (is_wall ?box_to))
      (not (is_box ?box_to))
    )
    :effect (and
      (not (is_player ?player_from))
      (is_player ?box_from)
      (not (is_box ?box_from))
      (is_box ?box_to)
      (increase (total-cost) 1)
    )
  )

  (:action push_south
    :parameters (?player_from ?box_from ?box_to - location)
    :precondition (and
      (is_player ?player_from)
      (connected_south ?player_from ?box_from) ; player is north of box
      (is_box ?box_from)
      (connected_south ?box_from ?box_to) ; box's target is south of box
      (not (is_wall ?box_to))
      (not (is_box ?box_to))
    )
    :effect (and
      (not (is_player ?player_from))
      (is_player ?box_from)
      (not (is_box ?box_from))
      (is_box ?box_to)
      (increase (total-cost) 1)
    )
  )

  (:action push_east
    :parameters (?player_from ?box_from ?box_to - location)
    :precondition (and
      (is_player ?player_from)
      (connected_east ?player_from ?box_from) ; player is west of box
      (is_box ?box_from)
      (connected_east ?box_from ?box_to) ; box's target is east of box
      (not (is_wall ?box_to))
      (not (is_box ?box_to))
    )
    :effect (and
      (not (is_player ?player_from))
      (is_player ?box_from)
      (not (is_box ?box_from))
      (is_box ?box_to)
      (increase (total-cost) 1)
    )
  )

  (:action push_west
    :parameters (?player_from ?box_from ?box_to - location)
    :precondition (and
      (is_player ?player_from)
      (connected_west ?player_from ?box_from) ; player is east of box
      (is_box ?box_from)
      (connected_west ?box_from ?box_to) ; box's target is west of box
      (not (is_wall ?box_to))
      (not (is_box ?box_to))
    )
    :effect (and
      (not (is_player ?player_from))
      (is_player ?box_from)
      (not (is_box ?box_from))
      (is_box ?box_to)
      (increase (total-cost) 1)
    )
  )
)