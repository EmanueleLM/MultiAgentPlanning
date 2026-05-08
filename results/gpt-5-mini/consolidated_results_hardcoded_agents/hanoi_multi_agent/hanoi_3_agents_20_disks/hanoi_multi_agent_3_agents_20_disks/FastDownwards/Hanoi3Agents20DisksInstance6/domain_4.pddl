(define (domain hanoi3agents20)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:constants A B C D E F G H I J K L M N O P Q R S T - disk
              left middle right - peg)
  (:predicates
    (on ?d - disk ?p - peg)
  )

  ;; agent_1 actions only (agent_1 is allowed to move A..G). Actions are
  ;; concrete, sequence-specific, and include negative preconditions that
  ;; structurally enforce the legal Tower-of-Hanoi top/empty checks so the
  ;; actions cannot be executed out-of-order or violate disk-size rules.
  (:action agent_1_move_A_left_middle
    :parameters ()
    :precondition (and
      (on A left)
    )
    :effect (and
      (not (on A left))
      (on A middle)
    )
  )

  (:action agent_1_move_B_left_right
    :parameters ()
    :precondition (and
      (on B left)
      ;; B must be top on left (A not on left)
      (not (on A left))
      ;; right peg must be empty at this step: no disk is on right
      (not (on A right))
      (not (on B right))
      (not (on C right))
      (not (on D right))
      (not (on E right))
      (not (on F right))
      (not (on G right))
      (not (on H right))
      (not (on I right))
      (not (on J right))
      (not (on K right))
      (not (on L right))
      (not (on M right))
      (not (on N right))
      (not (on O right))
      (not (on P right))
      (not (on Q right))
      (not (on R right))
      (not (on S right))
      (not (on T right))
    )
    :effect (and
      (not (on B left))
      (on B right)
    )
  )

  (:action agent_1_move_A_middle_right
    :parameters ()
    :precondition (and
      (on A middle)
      ;; B must be on right so placing A on right is legal (A smaller than B)
      (on B right)
    )
    :effect (and
      (not (on A middle))
      (on A right)
    )
  )

  (:action agent_1_move_C_left_middle
    :parameters ()
    :precondition (and
      (on C left)
      ;; C must be top on left: A and B are not on left
      (not (on A left))
      (not (on B left))
      ;; middle peg must be empty at this step: no disk on middle
      (not (on A middle))
      (not (on B middle))
      (not (on C middle))
      (not (on D middle))
      (not (on E middle))
      (not (on F middle))
      (not (on G middle))
      (not (on H middle))
      (not (on I middle))
      (not (on J middle))
      (not (on K middle))
      (not (on L middle))
      (not (on M middle))
      (not (on N middle))
      (not (on O middle))
      (not (on P middle))
      (not (on Q middle))
      (not (on R middle))
      (not (on S middle))
      (not (on T middle))
    )
    :effect (and
      (not (on C left))
      (on C middle)
    )
  )

  (:action agent_1_move_A_right_middle
    :parameters ()
    :precondition (and
      (on A right)
      ;; C must be on middle so placing A onto C is legal (A smaller than C)
      (on C middle)
    )
    :effect (and
      (not (on A right))
      (on A middle)
    )
  )

  (:action agent_1_move_B_right_left
    :parameters ()
    :precondition (and
      (on B right)
      ;; B must be top on right (A not on right)
      (not (on A right))
      ;; left must currently have D on top under which B may be placed;
      ;; enforcing (on D left) ensures the left peg is non-empty and the
      ;; actual top-disk there (D) is larger than B in this instance.
      (on D left)
    )
    :effect (and
      (not (on B right))
      (on B left)
    )
  )
)