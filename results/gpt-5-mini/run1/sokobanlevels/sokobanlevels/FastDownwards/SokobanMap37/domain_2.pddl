(define (domain sokoban_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types cell)
  (:predicates
    (player_at ?c - cell)
    (box_at ?c - cell)
    (adj ?c1 - cell ?c2 - cell)  ; directed edge from left to right
    (goal ?c - cell)
  )

  ;; move one step right along a forward edge
  (:action move_right
    :parameters (?x - cell ?y - cell)
    :precondition (and
      (player_at ?x)
      (adj ?x ?y)
      (not (box_at ?y))
    )
    :effect (and
      (not (player_at ?x))
      (player_at ?y)
    )
  )

  ;; move one step left using the same forward edge (adj ?x ?y)
  (:action move_left
    :parameters (?x - cell ?y - cell)
    :precondition (and
      (player_at ?y)
      (adj ?x ?y)        ; edge goes x->y, moving left goes y->x
      (not (box_at ?x))
    )
    :effect (and
      (not (player_at ?y))
      (player_at ?x)
    )
  )

  ;; push a box one step right: player at x, box at y, target z
  (:action push_right
    :parameters (?x - cell ?y - cell ?z - cell)
    :precondition (and
      (player_at ?x)
      (box_at ?y)
      (adj ?x ?y)
      (adj ?y ?z)
      (not (box_at ?z))
    )
    :effect (and
      (not (player_at ?x))
      (player_at ?y)
      (not (box_at ?y))
      (box_at ?z)
    )
  )

  ;; push a box one step left using the same forward edges x->y and y->z (x left of y, z right of y)
  ;; player at z pushes box at y into x
  (:action push_left
    :parameters (?x - cell ?y - cell ?z - cell)
    :precondition (and
      (player_at ?z)
      (box_at ?y)
      (adj ?x ?y)
      (adj ?y ?z)
      (not (box_at ?x))
    )
    :effect (and
      (not (player_at ?z))
      (player_at ?y)
      (not (box_at ?y))
      (box_at ?x)
    )
  )
)