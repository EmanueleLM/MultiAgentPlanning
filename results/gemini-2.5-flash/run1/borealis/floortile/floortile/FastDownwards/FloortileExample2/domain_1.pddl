(define (domain floor-tile)
  (:requirements :typing :action-costs :negative-preconditions) ; Added :negative-preconditions for (not (= ?oldc ?newc))
  (:types robot tile color - object)
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (available-color ?c - color)
    (clear ?t - tile) ; A tile is clear if no robot is on it and it's not painted.
    (painted ?t - tile ?c - color) ; A tile has been painted with a specific color.

    ; Connectivity predicates
    (up ?from - tile ?to - tile)
    (down ?from - tile ?to - tile)
    (right ?from - tile ?to - tile)
    (left ?from - tile ?to - tile)
  )
  (:functions (total-cost))

  (:action change-color
    :parameters (?r - robot ?oldc - color ?newc - color)
    :precondition (and
      (robot-has ?r ?oldc)
      (available-color ?newc)
      (not (= ?oldc ?newc)) ; Must change to a different color
    )
    :effect (and
      (not (robot-has ?r ?oldc))
      (robot-has ?r ?newc)
      (increase (total-cost) 5)
    )
  )

  (:action paint-up
    :parameters (?r - robot ?robot_pos - tile ?target_tile - tile ?c - color)
    :precondition (and
      (robot-at ?r ?robot_pos)
      (robot-has ?r ?c)
      (up ?robot_pos ?target_tile) ; ?target_tile is above ?robot_pos
      (clear ?target_tile) ; Target tile must be clear (unoccupied and unpainted)
      (not (painted ?target_tile ?c)) ; Cannot paint if already painted this color
      (not (exists (?any_color - color) (painted ?target_tile ?any_color))) ; Cannot paint if already painted any color
    )
    :effect (and
      (not (clear ?target_tile)) ; Painted tile is no longer clear
      (painted ?target_tile ?c)
      (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?robot_pos - tile ?target_tile - tile ?c - color)
    :precondition (and
      (robot-at ?r ?robot_pos)
      (robot-has ?r ?c)
      (down ?robot_pos ?target_tile) ; ?target_tile is below ?robot_pos
      (clear ?target_tile) ; Target tile must be clear (unoccupied and unpainted)
      (not (painted ?target_tile ?c)) ; Cannot paint if already painted this color
      (not (exists (?any_color - color) (painted ?target_tile ?any_color))) ; Cannot paint if already painted any color
    )
    :effect (and
      (not (clear ?target_tile)) ; Painted tile is no longer clear
      (painted ?target_tile ?c)
      (increase (total-cost) 2)
    )
  )

  (:action up
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (up ?from ?to)
      (clear ?to) ; Target tile must be clear to move onto
      (not (exists (?any_color - color) (painted ?to ?any_color))) ; Cannot move onto a painted tile
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (clear ?from) ; Old tile becomes clear
      (not (clear ?to)) ; New tile becomes occupied (not clear)
      (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (down ?from ?to)
      (clear ?to) ; Target tile must be clear to move onto
      (not (exists (?any_color - color) (painted ?to ?any_color))) ; Cannot move onto a painted tile
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (clear ?from) ; Old tile becomes clear
      (not (clear ?to)) ; New tile becomes occupied (not clear)
      (increase (total-cost) 1)
    )
  )

  (:action right
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (right ?from ?to)
      (clear ?to) ; Target tile must be clear to move onto
      (not (exists (?any_color - color) (painted ?to ?any_color))) ; Cannot move onto a painted tile
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (clear ?from) ; Old tile becomes clear
      (not (clear ?to)) ; New tile becomes occupied (not clear)
      (increase (total-cost) 1)
    )
  )

  (:action left
    :parameters (?r - robot ?from - tile ?to - tile)
    :precondition (and
      (robot-at ?r ?from)
      (left ?from ?to)
      (clear ?to) ; Target tile must be clear to move onto
      (not (exists (?any_color - color) (painted ?to ?any_color))) ; Cannot move onto a painted tile
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (clear ?from) ; Old tile becomes clear
      (not (clear ?to)) ; New tile becomes occupied (not clear)
      (increase (total-cost) 1)
    )
  )
)