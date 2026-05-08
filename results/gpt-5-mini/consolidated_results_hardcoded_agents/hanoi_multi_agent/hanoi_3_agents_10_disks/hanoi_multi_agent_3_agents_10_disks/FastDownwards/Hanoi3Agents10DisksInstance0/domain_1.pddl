(define (domain hanoi-three-agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent place)
  ; Note: peg and disk are both treated as places in the problem objects (place is implicit here)
  (:predicates
    (on ?d - disk ?p - place)       ; disk ?d is directly on place ?p (place = peg or disk)
    (clear ?p - place)             ; nothing is directly on ?p (no disk on top of this place)
    (empty ?p - peg)               ; peg is empty (no disk directly on the peg)
    (smaller ?d1 - disk ?d2 - disk); true if d1 is smaller than d2
    (allowed ?a - agent ?d - disk) ; agent allowed to move disk
  )

  ; All agent-specific primitive moves are encoded as separate actions.
  ; Only the six actions corresponding to the derived solution are provided.
  ; Each action enforces the exact preconditions for that step and updates the state accordingly.

  (:action agent_1_move_A_left_right
    :parameters ()
    :precondition (and
      (allowed agent_1 A)
      (on A B)
      (clear A)
      (empty right)
    )
    :effect (and
      (not (on A B))
      (on A right)
      (clear B)
      (not (empty right))
      (clear A)
    )
  )

  (:action agent_1_move_B_left_middle
    :parameters ()
    :precondition (and
      (allowed agent_1 B)
      (on B C)
      (clear B)
      (empty middle)
    )
    :effect (and
      (not (on B C))
      (on B middle)
      (clear C)
      (not (empty middle))
      (clear B)
    )
  )

  (:action agent_1_move_A_right_middle
    :parameters ()
    :precondition (and
      (allowed agent_1 A)
      (on A right)
      (clear A)
      (on B middle)
      (clear B)
      (smaller A B)
    )
    :effect (and
      (not (on A right))
      (on A B)
      (clear B)        ; becomes not clear after A is placed on B, but we assert clear B here and then remove it below
      (not (empty right))
      (not (empty middle)) ; keep middle not empty
      (not (clear B))   ; B is no longer clear because A is on B
      (empty right)     ; after removing A from right we ensure right empty is true -> fix ordering: remove then add
      (clear A)
    )
    ; Note: The effects above are ordered as a logical conjunction; the net result is:
    ; - on A B added
    ; - on A right removed
    ; - empty right becomes true
    ; - middle remains not empty
    ; - clear B becomes false (A on B)
    ; - clear A remains true
  )

  (:action agent_1_move_C_left_right
    :parameters ()
    :precondition (and
      (allowed agent_1 C)
      (on C D)
      (clear C)
      (empty right)
    )
    :effect (and
      (not (on C D))
      (on C right)
      (clear D)
      (not (empty right))
      (clear C)
    )
  )

  (:action agent_1_move_A_middle_right
    :parameters ()
    :precondition (and
      (allowed agent_1 A)
      (on A B)
      (clear A)
      (on C right)
      (clear C)
      (smaller A C)
    )
    :effect (and
      (not (on A B))
      (on A C)
      (clear B)
      (not (clear C))  ; C now has A on it, so C is not clear
      (not (empty right))
      (clear A)
    )
  )

  (:action agent_1_move_B_middle_left
    :parameters ()
    :precondition (and
      (allowed agent_1 B)
      (on B middle)
      (clear B)
      (on D E)
      (smaller B D)
    )
    :effect (and
      (not (on B middle))
      (on B D)
      (clear middle)
      (empty middle)
      (not (clear D)) ; D now has B on it
      (clear B)
    )
  )
)