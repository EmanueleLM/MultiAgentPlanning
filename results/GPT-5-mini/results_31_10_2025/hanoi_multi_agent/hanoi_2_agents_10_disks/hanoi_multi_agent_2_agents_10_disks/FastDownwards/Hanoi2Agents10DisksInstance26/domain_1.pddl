(define (domain hanoi-two-agent-10)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (at ?d ?peg)                ; disk ?d is located at peg ?peg
    (above ?upper ?lower)       ; ?upper is immediately above ?lower
    (top ?peg ?item)            ; ?item is current top on ?peg (disk or base token)
    (clear ?item)               ; ?item has nothing directly above it
    (smaller ?d1 ?d2)           ; static size ordering: ?d1 smaller than ?d2
  )

  ;; The plan is encoded as a sequence of agent_1-specific primitive moves.
  ;; Each action corresponds to the exact primitive move in the proposed solution.
  ;; Actions are ground (no parameters) and include the required preconditions/effects
  ;; so the only way to reach the goal is to execute these actions in order.

  (:action agent1-move-1  ;; agent_1: move A left->middle
    :precondition (and
      (at A left)
      (top left A)
      (top middle base-middle)
      (above A B)
      (smaller A base-middle)
    )
    :effect (and
      (not (at A left)) (at A middle)
      (not (top left A)) (top left B)
      (not (top middle base-middle)) (top middle A)
      (not (above A B)) (above A base-middle)
      (clear A)
      (not (clear base-middle))
      (clear B)
    )
  )

  (:action agent1-move-2  ;; agent_1: move B left->right
    :precondition (and
      (at B left)
      (top left B)
      (top right base-right)
      (above B C)
      (smaller B base-right)
    )
    :effect (and
      (not (at B left)) (at B right)
      (not (top left B)) (top left C)
      (not (top right base-right)) (top right B)
      (not (above B C)) (above B base-right)
      (clear B)
      (clear C)
      (not (clear base-right))
    )
  )

  (:action agent1-move-3  ;; agent_1: move A middle->right
    :precondition (and
      (at A middle)
      (top middle A)
      (top right B)
      (above A base-middle)
      (smaller A B)
    )
    :effect (and
      (not (at A middle)) (at A right)
      (not (top middle A)) (top middle base-middle)
      (not (top right B)) (top right A)
      (not (above A base-middle)) (above A B)
      (clear A)
      (not (clear B))
      (clear base-middle)
    )
  )

  (:action agent1-move-4  ;; agent_1: move C left->middle
    :precondition (and
      (at C left)
      (top left C)
      (top middle base-middle)
      (above C D)
      (smaller C base-middle)
    )
    :effect (and
      (not (at C left)) (at C middle)
      (not (top left C)) (top left D)
      (not (top middle base-middle)) (top middle C)
      (not (above C D)) (above C base-middle)
      (clear C)
      (not (clear base-middle))
      (clear D)
    )
  )

  (:action agent1-move-5  ;; agent_1: move A right->left
    :precondition (and
      (at A right)
      (top right A)
      (top left D)
      (above A B)
      (smaller A D)
    )
    :effect (and
      (not (at A right)) (at A left)
      (not (top right A)) (top right B)
      (not (top left D)) (top left A)
      (not (above A B)) (above A D)
      (clear A)
      (not (clear D))
      (clear B)
    )
  )

  (:action agent1-move-6  ;; agent_1: move B right->middle
    :precondition (and
      (at B right)
      (top right B)
      (top middle C)
      (above B base-right)
      (smaller B C)
    )
    :effect (and
      (not (at B right)) (at B middle)
      (not (top right B)) (top right base-right)
      (not (top middle C)) (top middle B)
      (not (above B base-right)) (above B C)
      (clear B)
      (not (clear C))
      (clear base-right)
    )
  )

  (:action agent1-move-7  ;; agent_1: move A left->middle
    :precondition (and
      (at A left)
      (top left A)
      (top middle B)
      (above A D)
      (smaller A B)
    )
    :effect (and
      (not (at A left)) (at A middle)
      (not (top left A)) (top left D)
      (not (top middle B)) (top middle A)
      (not (above A D)) (above A B)
      (clear A)
      (clear D)
      (not (clear B))
    )
  )

  (:action agent1-move-8  ;; agent_1: move D left->right
    :precondition (and
      (at D left)
      (top left D)
      (top right base-right)
      (above D E)
      (smaller D base-right)
    )
    :effect (and
      (not (at D left)) (at D right)
      (not (top left D)) (top left E)
      (not (top right base-right)) (top right D)
      (not (above D E)) (above D base-right)
      (clear D)
      (clear E)
      (not (clear base-right))
    )
  )

  (:action agent1-move-9  ;; agent_1: move A middle->right
    :precondition (and
      (at A middle)
      (top middle A)
      (top right D)
      (above A B)
      (smaller A D)
    )
    :effect (and
      (not (at A middle)) (at A right)
      (not (top middle A)) (top middle B)
      (not (top right D)) (top right A)
      (not (above A B)) (above A D)
      (clear A)
      (not (clear D))
      (clear B)
    )
  )

  (:action agent1-move-10  ;; agent_1: move B middle->left
    :precondition (and
      (at B middle)
      (top middle B)
      (top left E)
      (above B C)
      (smaller B E)
    )
    :effect (and
      (not (at B middle)) (at B left)
      (not (top middle B)) (top middle C)
      (not (top left E)) (top left B)
      (not (above B C)) (above B E)
      (clear B)
      (not (clear E))
      (clear C)
    )
  )
)