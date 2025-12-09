(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk directly on peg
    (on-disk ?d - disk ?below - disk) ; disk directly on top of another disk
    (top ?d - disk)                    ; disk is top of its current stack
    (empty ?p - peg)                   ; peg currently has no disks
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is strictly smaller than d2

    (next ?s1 - stage ?s2 - stage)     ; temporal successor relation between stages
    (used-stage ?s - stage)            ; stage marker that progresses exactly one step per action
  )

  ;; Move a top disk that is currently the bottom (directly on a peg) to another empty peg.
  ;; This consumes the current stage marker and advances it to the successor stage,
  ;; enforcing a single action per stage and contiguous stage progression.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (used-stage ?s)
      (next ?s ?s2)
      (top ?d)
      (on-peg ?d ?from)
      (empty ?to)
      (not (used-stage ?s2))
    )
    :effect (and
      ;; advance stage marker
      (not (used-stage ?s))
      (used-stage ?s2)

      ;; relocate disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; peg occupancy updates
      (not (empty ?to))
      (empty ?from)
      ;; top ?d remains true (it is top at destination)
    )
  )

  ;; Move a top disk that is currently on top of another disk onto an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (used-stage ?s)
      (next ?s ?s2)
      (top ?d)
      (on-disk ?d ?below)
      (empty ?to)
      (not (used-stage ?s2))
    )
    :effect (and
      ;; advance stage marker
      (not (used-stage ?s))
      (used-stage ?s2)

      ;; relocate disk
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; peg occupancy updates
      (not (empty ?to))

      ;; the disk that was directly below becomes the new top of its stack
      (top ?below)
      ;; top ?d remains true at destination
    )
  )

  ;; Move a top disk that is currently the bottom (on a peg) onto another top disk (target must be larger).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?v - disk ?s - stage ?s2 - stage)
    :precondition (and
      (used-stage ?s)
      (next ?s ?s2)
      (top ?d)
      (on-peg ?d ?from)
      (top ?v)
      (smaller ?d ?v)
      (not (used-stage ?s2))
    )
    :effect (and
      ;; advance stage marker
      (not (used-stage ?s))
      (used-stage ?s2)

      ;; relocate disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?v)

      ;; peg occupancy updates
      (empty ?from)

      ;; target disk is no longer top
      (not (top ?v))
      ;; top ?d remains true at destination
    )
  )

  ;; Move a top disk that is currently on top of another disk onto another top disk (target must be larger).
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?v - disk ?s - stage ?s2 - stage)
    :precondition (and
      (used-stage ?s)
      (next ?s ?s2)
      (top ?d)
      (on-disk ?d ?below)
      (top ?v)
      (smaller ?d ?v)
      (not (used-stage ?s2))
    )
    :effect (and
      ;; advance stage marker
      (not (used-stage ?s))
      (used-stage ?s2)

      ;; relocate disk
      (not (on-disk ?d ?below))
      (on-disk ?d ?v)

      ;; the previous below-disk becomes top of its stack
      (top ?below)

      ;; target disk is no longer top
      (not (top ?v))
      ;; top ?d remains true at destination
    )
  )
)