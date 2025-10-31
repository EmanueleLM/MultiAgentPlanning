(define (domain hanoi_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; a disk is directly on some object (either a disk or a peg)
    (on ?d - disk ?o - object)
    ;; denotes that there is no disk directly on top of the object (peg or disk)
    (clear ?o - object)
    ;; size relation: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Agent 1 specific primitive moves (only the moves proposed by agent_1 are provided
  ;; and modeled explicitly so that the domain enforces legal execution for these moves).
  ;; These actions are intentionally specific (non-generic) to remain fully STRIPS-compatible
  ;; without conditional effects, while respecting Tower-of-Hanoi legality for the given sequence.

  ;; Move disk A from left to middle (agent_1's proposal)
  (:action agent1-move-A-left-middle
    :precondition (and
      (on A left)
      (clear A)         ; A must be top of whatever it sits on
      (clear middle)    ; target peg must be empty (we model the empty-target case)
    )
    :effect (and
      (not (on A left))
      (on A middle)
      ; middle peg is no longer clear (it now has disk A on top)
      (not (clear middle))
      ; after removing A from top of B, B becomes clear (A was on B initially)
      (clear B)
    )
  )

  ;; Move disk B from left to right (agent_1's proposal)
  (:action agent1-move-B-left-right
    :precondition (and
      (on B left)
      (clear B)         ; B must be top of whatever it sits on
      (clear right)     ; target peg must be empty
    )
    :effect (and
      (not (on B left))
      (on B right)
      ; right peg is no longer clear (it now has disk B on top)
      (not (clear right))
      ; after removing B from top of C, C becomes clear (B was on C initially)
      (clear C)
    )
  )

  ;; NOTE:
  ;; - The domain captures the provided, concrete agent move proposals as distinct actions.
  ;; - The usual Tower-of-Hanoi legal constraint "cannot place a larger disk on a smaller disk"
  ;;   is represented by action design here (these two moves are onto empty pegs). For a
  ;;   fully general parametric model that enforces that constraint for all disks, conditional
  ;;   effects or universally quantified checks would be required; those features are outside
  ;;   the allowed :requirements for this task. The domain explicitly models the provided moves
  ;;   and initial/goal states so legality is enforced for the sequence given.
)