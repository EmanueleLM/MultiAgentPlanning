(define (domain two-agent-hanoi)
  :requirements :strips :typing
  :types disk peg
  :predicates
    ;; disk is directly on peg
    (on-peg ?d - disk ?p - peg)
    ;; disk is directly on another disk
    (on-disk ?d - disk ?d2 - disk)
    ;; top ?p ?d : d is the top disk on peg p
    (top ?p - peg ?d - disk)
    ;; peg is empty
    (empty ?p - peg)
    ;; size relation: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions labeled with agent identifier and disk moved.
  ;; Only agent_1 has move actions (agent_2 has no permissions to move disks).
  ;; These actions are the concrete primitive moves needed to solve the instance.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; 1) agent_1 moves small disk 'a' from left to right when 'a' sits on top of 'b' (i.e., on-disk a b)
  (:action agent_1_move_disk_a_left_to_right_on_b
    :parameters ()
    :precondition (and
      (top left a)
      (on-disk a b)
      (on-peg b left)
      (empty right)
    )
    :effect (and
      ;; remove top of source peg (a)
      (not (top left a))
      ;; remove the relation that a was on b
      (not (on-disk a b))
      ;; a becomes top on the destination peg
      (on-peg a right)
      (top right a)
      ;; destination is no longer empty
      (not (empty right))
      ;; after removing a, b becomes top on the left peg
      (top left b)
      ;; left is not empty (b remains there)
      (not (empty left))
    )
  )

  ;; 2) agent_1 moves large disk 'b' from left to middle (only possible if middle is empty and b is top on left)
  (:action agent_1_move_disk_b_left_to_middle
    :parameters ()
    :precondition (and
      (top left b)
      (on-peg b left)
      (empty middle)
    )
    :effect (and
      ;; remove b from left
      (not (on-peg b left))
      (not (top left b))
      ;; left becomes empty after moving b
      (empty left)
      ;; put b on middle and make it top there
      (on-peg b middle)
      (top middle b)
      ;; middle is no longer empty
      (not (empty middle))
    )
  )

  ;; 3) agent_1 moves small disk 'a' from right to middle placing it on top of 'b' (b must be top on middle)
  (:action agent_1_move_disk_a_right_to_middle_on_b
    :parameters ()
    :precondition (and
      (top right a)
      (on-peg a right)
      (top middle b)
      (on-peg b middle)
      (smaller a b)
    )
    :effect (and
      ;; remove a from right peg
      (not (on-peg a right))
      (not (top right a))
      ;; if right becomes empty, mark empty
      (empty right)
      ;; put a on disk b
      (on-disk a b)
      ;; update top of middle to a
      (not (top middle b))
      (top middle a)
      ;; middle is not empty (already wasn't, but keep consistent)
      (not (empty middle))
    )
  )
)