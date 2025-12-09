(define (domain hanoi-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  ;; Types:
  ;;  - place: supertype for pegs and disks (a disk can be "on" a place)
  ;;  - peg, disk are subtypes of place
  ;;  - stage models discrete time steps; a single (current ?t) stage marker moves forward
  (:types place stage peg disk - place)

  (:predicates
    ;; disk ?d is directly on place ?p (place = peg or disk)
    (on ?d - disk ?p - place)

    ;; place (peg or disk) currently has nothing on top
    (clear ?p - place)

    ;; static size ordering: ?x is strictly smaller than ?y
    (smaller ?x - disk ?y - disk)

    ;; current active stage/time marker (exactly one current stage is maintained by actions)
    (current ?t - stage)

    ;; successor relation between stages (ordered discrete time steps)
    (next ?t1 - stage ?t2 - stage)
  )

  ;; Move a top disk from its current support (?below) onto an empty peg (?to).
  ;; Preconditions require the disk to be the top element at the source and the destination peg to be empty.
  ;; Effects update direct support relations and top/clear flags and advance the current stage marker.
  (:action move-to-peg
    :parameters (?d - disk ?below - place ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (next ?t ?t2)

      ;; disk ?d must be directly on ?below and be the top disk there
      (on ?d ?below)
      (clear ?d)

      ;; destination peg must be empty (no top disk)
      (clear ?to)

      ;; prevent no-op/self moves
      (not (= ?below ?to))
    )
    :effect (and
      ;; relocate the disk's direct support
      (not (on ?d ?below))
      (on ?d ?to)

      ;; source becomes clear (it no longer has ?d on top)
      (clear ?below)

      ;; destination is no longer clear (now has ?d on top)
      (not (clear ?to))

      ;; moved disk is top at its destination (nothing on it)
      (clear ?d)

      ;; advance the global stage marker (ensures discrete ordered progression)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from its current support (?below) onto another top disk (?top).
  ;; Enforces size ordering: only a smaller disk may be placed on a larger one.
  (:action move-onto-disk
    :parameters (?d - disk ?below - place ?top - disk ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (next ?t ?t2)

      ;; source/top conditions
      (on ?d ?below)
      (clear ?d)

      ;; destination top disk must be the top element
      (clear ?top)

      ;; size constraint: moving disk must be strictly smaller than destination top
      (smaller ?d ?top)

      ;; prevent moving onto itself or onto its own support
      (not (= ?d ?top))
      (not (= ?below ?top))
    )
    :effect (and
      ;; relocate disk to be directly on the destination disk ?top
      (not (on ?d ?below))
      (on ?d ?top)

      ;; source becomes clear (it no longer has ?d on top)
      (clear ?below)

      ;; the former top ?top is no longer clear (it now has ?d on top)
      (not (clear ?top))

      ;; moved disk is top at its destination
      (clear ?d)

      ;; advance the global stage marker
      (not (current ?t))
      (current ?t2)
    )
  )
)