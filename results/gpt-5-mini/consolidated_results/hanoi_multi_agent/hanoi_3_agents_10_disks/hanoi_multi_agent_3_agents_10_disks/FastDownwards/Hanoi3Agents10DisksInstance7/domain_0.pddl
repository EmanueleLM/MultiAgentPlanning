(define (domain hanoi_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk directly on peg
    (on-disk ?d - disk ?under - disk) ; disk directly on another disk
    (top ?d - disk ?p - peg)          ; disk is top disk on peg
    (empty ?p - peg)                  ; peg currently empty
    (clear ?d - disk)                 ; disk has no disk on top
    (can_move ?a - agent ?d - disk)   ; agent can move this disk
    (larger ?d1 - disk ?d2 - disk)    ; d1 is strictly larger than d2
  )

  ; Action 1: agent_1 moves A from left to middle (middle is empty)
  (:action agent_1_move_A_left_middle
    :parameters ()
    :precondition (and
      (can_move agent_1 A)
      (top A left)
      (empty middle)
    )
    :effect (and
      ; remove A from being on top of left (i.e., remove its on-disk relation)
      (not (on-disk A B))
      ; place A on middle peg
      (on-peg A middle)
      ; update top facts: A no longer top on left, B becomes top on left
      (not (top A left))
      (top B left)
      ; middle is no longer empty
      (not (empty middle))
      ; after removing A, B becomes clear (no disk on top)
      (clear B)
      ; A remains clear (top on its new peg)
      (clear A)
    )
  )

  ; Action 2: agent_1 moves B from left to right (right is empty)
  (:action agent_1_move_B_left_right
    :parameters ()
    :precondition (and
      (can_move agent_1 B)
      (top B left)
      (empty right)
    )
    :effect (and
      ; remove B from being on the left stack
      (not (on-disk B C))
      ; place B on right peg
      (on-peg B right)
      ; update top facts: B no longer top on left, C becomes top on left
      (not (top B left))
      (top C left)
      ; right is no longer empty
      (not (empty right))
      ; after removing B, C is clear (becomes top with no disk on it)
      (clear C)
      ; B is clear (top on right)
      (clear B)
    )
  )

  ; Action 3: agent_1 moves A from middle back to left (placing A on top of C)
  (:action agent_1_move_A_middle_left
    :parameters ()
    :precondition (and
      (can_move agent_1 A)
      (top A middle)
      (top C left)
      (larger C A)
    )
    :effect (and
      ; remove A from middle peg
      (not (on-peg A middle))
      ; place A on top of C (on-disk relation)
      (on-disk A C)
      ; update top facts: A becomes top on left, C is no longer top
      (not (top C left))
      (top A left)
      ; middle becomes empty again
      (empty middle)
      ; C is no longer clear (has A on top)
      (not (clear C))
      ; A is clear (top on left)
      (clear A)
    )
  )
)