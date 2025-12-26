(define (domain floor-tile)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types robot tile color - object)
  
  (:predicates
    (robot-at ?r - robot ?t - tile)
    (robot-has ?r - robot ?c - color)
    (painted ?t - tile ?c - color)
    (clear ?t - tile) ; Tile is unpainted and unoccupied (available for movement/painting target)
    (available-color ?c - color)
    
    ; Adjacency predicates (T1 is origin, T2 is destination based on movement type)
    (up ?t1 - tile ?t2 - tile)
    (down ?t1 - tile ?t2 - tile)
    (right ?t1 - tile ?t2 - tile)
    (left ?t1 - tile ?t2 - tile)
  )
  
  (:functions 
    (total-cost)
  )

  (:action change-color
    :parameters (?r - robot ?c1 - color ?c2 - color)
    :precondition (and
      (robot-has ?r ?c1)
      (available-color ?c2)
      (not (= ?c1 ?c2))
    )
    :effect (and
      (not (robot-has ?r ?c1))
      (robot-has ?r ?c2)
      (increase (total-cost) 5)
    )
  )

  (:action paint-up
    :parameters (?r - robot ?t_origin - tile ?t_target - tile ?c - color)
    :precondition (and
      (robot-at ?r ?t_origin)
      (robot-has ?r ?c)
      (up ?t_origin ?t_target)
      (clear ?t_target)
    )
    :effect (and
      (painted ?t_target ?c)
      (not (clear ?t_target)) ; Painted tiles are no longer clear/accessible
      (increase (total-cost) 2)
    )
  )

  (:action paint-down
    :parameters (?r - robot ?t_origin - tile ?t_target - tile ?c - color)
    :precondition (and
      (robot-at ?r ?t_origin)
      (robot-has ?r ?c)
      (down ?t_origin ?t_target)
      (clear ?t_target)
    )
    :effect (and
      (painted ?t_target ?c)
      (not (clear ?t_target))
      (increase (total-cost) 2)
    )
  )

  (:action up
    :parameters (?r - robot ?t_from - tile ?t_to - tile)
    :precondition (and
      (robot-at ?r ?t_from)
      (up ?t_from ?t_to)
      (clear ?t_to) ; Must move onto a clear (unpainted/unoccupied) tile
    )
    :effect (and
      (not (robot-at ?r ?t_from))
      (robot-at ?r ?t_to)
      (clear ?t_from) ; Tile left becomes clear
      (not (clear ?t_to)) ; Tile moved onto becomes occupied (not clear)
      (increase (total-cost) 3)
    )
  )

  (:action down
    :parameters (?r - robot ?t_from - tile ?t_to - tile)
    :precondition (and
      (robot-at ?r ?t_from)
      (down ?t_from ?t_to)
      (clear ?t_to)
    )
    :effect (and
      (not (robot-at ?r ?t_from))
      (robot-at ?r ?t_to)
      (clear ?t_from)
      (not (clear ?t_to))
      (increase (total-cost) 1)
    )
  )

  (:action right
    :parameters (?r - robot ?t_from - tile ?t_to - tile)
    :precondition (and
      (robot-at ?r ?t_from)
      (right ?t_from ?t_to)
      (clear ?t_to)
    )
    :effect (and
      (not (robot-at ?r ?t_from))
      (robot-at ?r ?t_to)
      (clear ?t_from)
      (not (clear ?t_to))
      (increase (total-cost) 1)
    )
  )

  (:action left
    :parameters (?r - robot ?t_from - tile ?t_to - tile)
    :precondition (and
      (robot-at ?r ?t_from)
      (left ?t_from ?t_to)
      (clear ?t_to)
    )
    :effect (and
      (not (robot-at ?r ?t_from))
      (robot-at ?r ?t_to)
      (clear ?t_from)
      (not (clear ?t_to))
      (increase (total-cost) 1)
    )
  )
)