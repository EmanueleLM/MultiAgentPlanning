(define (domain sokoban)
  (:requirements :strips :typing)
  (:types agent movable position goal_position)
  (:predicates
    (at ?m - movable ?p - position)
    (clear ?p - position)
    (box_at_goal)
    (adjacent ?p1 - position ?p2 - position)
  )

  (:action move-agent
    :parameters (?p1 - position ?p2 - position)
    :precondition (and 
      (at player ?p1)
      (clear ?p2)
      (adjacent ?p1 ?p2)
    )
    :effect (and
      (not (at player ?p1))
      (at player ?p2)
      (not (clear ?p2))
      (clear ?p1)
    )
  )

  (:action push-box
    :parameters (?p1 - position ?p2 - position ?p3 - position)
    :precondition (and
      (at player ?p1)
      (at box ?p2)
      (adjacent ?p1 ?p2)
      (clear ?p3)
      (adjacent ?p2 ?p3)
    )
    :effect (and
      (not (at player ?p1))
      (at player ?p2)
      (not (at box ?p2))
      (at box ?p3)
      (not (clear ?p3))
      (clear ?p1)
    )
  )
)