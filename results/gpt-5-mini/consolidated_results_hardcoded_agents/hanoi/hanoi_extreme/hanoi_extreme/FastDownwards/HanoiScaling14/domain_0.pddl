(define (domain hanoi7)
  ;; Orchestrator-produced PDDL domain for 7-disk Tower of Hanoi
  ;; Assumptions and notes (documented here as comments):
  ;; - We adopt "Option A" from the auditor: any plan-step given as "move X from P to Q"
  ;;   must be expanded before execution into either:
  ;;     * move-to-peg (if peg Q is empty at that step), or
  ;;     * move-to-disk (if peg Q is non-empty; the ?to parameter is the top disk currently on Q).
  ;;   That bookkeeping expansion is a planning/execution-level decision and is not encoded
  ;;   as a permissive shorthand in the domain. The domain therefore contains two distinct
  ;;   action schemas (move-to-peg and move-to-disk) so the planner cannot rely on an
  ;;   underspecified destination.
  ;; - Types: disk and peg are subtypes of object so predicates can accept either kind as supports.
  ;; - We deliberately do NOT include an explicit inequality precondition on ?from and ?to;
  ;;   such a check is optional and has been omitted to remain within the restricted :requirements.
  ;; - All size relations are static and listed in the problem init as (smaller ...) facts.
  ;; - The semantics of clear(?o):
  ;;     * For a disk d: clear(d) means there is no disk directly on d.
  ;;     * For a peg p: clear(p) means the peg currently has no disks (i.e., is empty).
  ;; - Actions only operate on a single top (clear) disk at a time; placing a disk on a disk
  ;;   requires the moved disk to be strictly smaller (enforced by (smaller ?d ?to)).

  (:requirements :strips :typing)
  (:types disk peg - object)

  (:predicates
    ;; disk directly on object (disk or peg)
    (on ?d - disk ?s - object)

    ;; clear for disks and pegs
    (clear ?o - object)

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Action: move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Action: move a top disk onto another disk (target disk must be clear and larger)
  (:action move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)