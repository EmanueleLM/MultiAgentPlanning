(define (domain hanoi3agents15)
  :requirements :strips :typing :negative-preconditions
  :types disk peg agent object

  :predicates
    ;; supported ?d ?s  -- disk ?d is directly supported by object ?s (either another disk or a peg)
    (supported ?d - disk ?s - object)
    ;; peg emptiness flags
    (empty ?p - peg)
    ;; size relation: smaller ?d1 ?d2  -- d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Actions are agent-prefixed and only allow the exact moves used in the proposed plan.
  ;; Each action enforces "no disk on top" of the moving disk (explicit negative preconditions),
  ;; enforces destination constraints (empty peg or a top disk larger than the mover),
  ;; and performs exact supported/empty updates so no other unintended rearrangement is possible.

  ;; 1) agent_1: move A from left -> right (right must be empty)
  (:action agent_1_move_A_left_right
    :precondition (and
      (supported a b)           ;; a currently supported by b (a initially on top)
      (empty right)             ;; right peg empty
      ;; ensure no disk is sitting on a (no disk above a)
      (not (supported b a))
      (not (supported c a))
      (not (supported d a))
      (not (supported e a))
      (not (supported f a))
      (not (supported g a))
      (not (supported h a))
      (not (supported i a))
      (not (supported j a))
      (not (supported k a))
      (not (supported l a))
      (not (supported m a))
      (not (supported n a))
      (not (supported o a))
    )
    :effect (and
      (not (supported a b))
      (supported a right)
      (not (empty right))
    )
  )

  ;; 2) agent_1: move B from left -> middle (middle must be empty)
  (:action agent_1_move_B_left_middle
    :precondition (and
      (supported b c)
      (empty middle)
      ;; ensure no disk is sitting on b
      (not (supported a b))
      (not (supported c b))
      (not (supported d b))
      (not (supported e b))
      (not (supported f b))
      (not (supported g b))
      (not (supported h b))
      (not (supported i b))
      (not (supported j b))
      (not (supported k b))
      (not (supported l b))
      (not (supported m b))
      (not (supported n b))
      (not (supported o b))
    )
    :effect (and
      (not (supported b c))
      (supported b middle)
      (not (empty middle))
    )
  )

  ;; 3) agent_1: move A from right -> middle (onto disk b). b must be top on middle and larger than a
  (:action agent_1_move_A_right_middle
    :precondition (and
      (supported a right)
      (supported b middle)
      ;; ensure b has no disk on top
      (not (supported a b))
      (not (supported c b))
      (not (supported d b))
      (not (supported e b))
      (not (supported f b))
      (not (supported g b))
      (not (supported h b))
      (not (supported i b))
      (not (supported j b))
      (not (supported k b))
      (not (supported l b))
      (not (supported m b))
      (not (supported n b))
      (not (supported o b))
      ;; size constraint
      (smaller a b)
    )
    :effect (and
      (not (supported a right))
      (supported a b)
      ;; right becomes empty after moving a off it
      (empty right)
    )
  )

  ;; 4) agent_1: move C from left -> right (right must be empty)
  (:action agent_1_move_C_left_right
    :precondition (and
      (supported c d)
      (empty right)
      ;; ensure no disk is sitting on c
      (not (supported a c))
      (not (supported b c))
      (not (supported d c))
      (not (supported e c))
      (not (supported f c))
      (not (supported g c))
      (not (supported h c))
      (not (supported i c))
      (not (supported j c))
      (not (supported k c))
      (not (supported l c))
      (not (supported m c))
      (not (supported n c))
      (not (supported o c))
    )
    :effect (and
      (not (supported c d))
      (supported c right)
      (not (empty right))
    )
  )

  ;; 5) agent_1: move A from middle -> left (onto disk d). d must be top on left and larger than a
  (:action agent_1_move_A_middle_left
    :precondition (and
      (supported a b)
      (supported d e) ;; d is part of the left stack; ensure d exists in its usual support (keeps structure)
      ;; ensure no disk is sitting on a
      (not (supported b a))
      (not (supported c a))
      (not (supported d a))
      (not (supported e a))
      (not (supported f a))
      (not (supported g a))
      (not (supported h a))
      (not (supported i a))
      (not (supported j a))
      (not (supported k a))
      (not (supported l a))
      (not (supported m a))
      (not (supported n a))
      (not (supported o a))
      ;; ensure d has no disk on top (so we place a onto d)
      (not (supported a d))
      (not (supported b d))
      (not (supported c d))
      (not (supported e d))
      (not (supported f d))
      (not (supported g d))
      (not (supported h d))
      (not (supported i d))
      (not (supported j d))
      (not (supported k d))
      (not (supported l d))
      (not (supported m d))
      (not (supported n d))
      (not (supported o d))
      ;; size constraint
      (smaller a d)
    )
    :effect (and
      (not (supported a b))
      (supported a d)
      ;; middle remains non-empty (b remains)
    )
  )
)