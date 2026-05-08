(define (domain hanoi-two-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg place)
  ;; disks and pegs are places (a disk or a peg can be the support of a disk)
  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is immediately on place ?p (disk or peg)
    (clear ?p - place)              ; nothing is immediately on place ?p (p is top of its stack or peg is empty)
    (smaller ?d1 - disk ?d2 - disk) ; disk ?d1 is smaller than disk ?d2 (static)
    (agent1 ?d - disk)              ; agent_1 is allowed to move disk ?d
    (agent2 ?d - disk)              ; agent_2 is allowed to move disk ?d
  )

  ;; Generic moves attributed to agent_1 (may only move disks labeled A..H).
  ;; Move a disk onto a peg (peg must be clear/top)
  (:action agent1-move-to-peg
    :parameters (?d - disk ?from - place ?peg - peg)
    :precondition (and
      (agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (not (clear ?peg))
      (clear ?from)
    )
  )

  ;; Move a disk onto another disk (target disk must be clear and larger)
  (:action agent1-move-to-disk
    :parameters (?d - disk ?from - place ?onto - disk)
    :precondition (and
      (agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?onto)
      (smaller ?d ?onto)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?onto)
      (not (clear ?onto))
      (clear ?from)
    )
  )

  ;; Generic moves attributed to agent_2 (may only move disks labeled I..O).
  (:action agent2-move-to-peg
    :parameters (?d - disk ?from - place ?peg - peg)
    :precondition (and
      (agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (not (clear ?peg))
      (clear ?from)
    )
  )

  (:action agent2-move-to-disk
    :parameters (?d - disk ?from - place ?onto - disk)
    :precondition (and
      (agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?onto)
      (smaller ?d ?onto)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?onto)
      (not (clear ?onto))
      (clear ?from)
    )
  )

  ;; Additionally keep the specific primitive moves proposed by agent_1 as named, grounded actions.
  ;; These are the exact moves proposed (kept attributed to agent_1). Each grounded action has the
  ;; same semantics as the generic agent1 move actions and will fire only when its preconditions match.
  ;; Note: parameters are omitted (grounded actions).
  (:action agent1-move-A-left-right
    :precondition (and (agent1 A) (on A B) (clear A) (clear right))
    :effect (and (not (on A B)) (on A right) (not (clear right)) (clear B))
  )
  (:action agent1-move-B-left-middle
    :precondition (and (agent1 B) (on B C) (clear B) (clear middle))
    :effect (and (not (on B C)) (on B middle) (not (clear middle)) (clear C))
  )
  (:action agent1-move-A-right-middle
    :precondition (and (agent1 A) (on A right) (clear A) (clear middle))
    :effect (and (not (on A right)) (on A middle) (not (clear middle)) (clear right))
  )
  (:action agent1-move-C-left-right
    :precondition (and (agent1 C) (on C D) (clear C) (clear right))
    :effect (and (not (on C D)) (on C right) (not (clear right)) (clear D))
  )
  (:action agent1-move-A-middle-left
    :precondition (and (agent1 A) (on A middle) (clear A) (clear left))
    :effect (and (not (on A middle)) (on A left) (not (clear left)) (clear middle))
  )
  (:action agent1-move-B-middle-right
    :precondition (and (agent1 B) (on B middle) (clear B) (clear right))
    :effect (and (not (on B middle)) (on B right) (not (clear right)) (clear middle))
  )
  (:action agent1-move-A-left-right-2
    :precondition (and (agent1 A) (on A left) (clear A) (clear right))
    :effect (and (not (on A left)) (on A right) (not (clear right)) (clear left))
  )
  (:action agent1-move-D-left-middle
    :precondition (and (agent1 D) (on D E) (clear D) (clear middle))
    :effect (and (not (on D E)) (on D middle) (not (clear middle)) (clear E))
  )
  (:action agent1-move-A-right-middle-2
    :precondition (and (agent1 A) (on A right) (clear A) (clear middle))
    :effect (and (not (on A right)) (on A middle) (not (clear middle)) (clear right))
  )
  (:action agent1-move-B-right-left
    :precondition (and (agent1 B) (on B right) (clear B) (clear left))
    :effect (and (not (on B right)) (on B left) (not (clear left)) (clear right))
  )
  (:action agent1-move-A-middle-left-2
    :precondition (and (agent1 A) (on A middle) (clear A) (clear left))
    :effect (and (not (on A middle)) (on A left) (not (clear left)) (clear middle))
  )
  (:action agent1-move-C-right-middle
    :precondition (and (agent1 C) (on C right) (clear C) (clear middle))
    :effect (and (not (on C right)) (on C middle) (not (clear middle)) (clear right))
  )
  (:action agent1-move-A-left-right-3
    :precondition (and (agent1 A) (on A left) (clear A) (clear right))
    :effect (and (not (on A left)) (on A right) (not (clear right)) (clear left))
  )
  (:action agent1-move-B-left-middle-2
    :precondition (and (agent1 B) (on B C) (clear B) (clear middle))
    :effect (and (not (on B C)) (on B middle) (not (clear middle)) (clear C))
  )
  (:action agent1-move-A-right-middle-3
    :precondition (and (agent1 A) (on A right) (clear A) (clear middle))
    :effect (and (not (on A right)) (on A middle) (not (clear middle)) (clear right))
  )
  (:action agent1-move-E-left-right
    :precondition (and (agent1 E) (on E F) (clear E) (clear right))
    :effect (and (not (on E F)) (on E right) (not (clear right)) (clear F))
  )
  (:action agent1-move-A-middle-left-3
    :precondition (and (agent1 A) (on A middle) (clear A) (clear left))
    :effect (and (not (on A middle)) (on A left) (not (clear left)) (clear middle))
  )
  (:action agent1-move-B-middle-right-2
    :precondition (and (agent1 B) (on B middle) (clear B) (clear right))
    :effect (and (not (on B middle)) (on B right) (not (clear right)) (clear middle))
  )
  (:action agent1-move-A-left-right-4
    :precondition (and (agent1 A) (on A left) (clear A) (clear right))
    :effect (and (not (on A left)) (on A right) (not (clear right)) (clear left))
  )
  (:action agent1-move-C-middle-left
    :precondition (and (agent1 C) (on C middle) (clear C) (clear left))
    :effect (and (not (on C middle)) (on C left) (not (clear left)) (clear middle))
  )
  (:action agent1-move-A-right-left-2
    :precondition (and (agent1 A) (on A right) (clear A) (clear left))
    :effect (and (not (on A right)) (on A left) (not (clear left)) (clear right))
  )
)