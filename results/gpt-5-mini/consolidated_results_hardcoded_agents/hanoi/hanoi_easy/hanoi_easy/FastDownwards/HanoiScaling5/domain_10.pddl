(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; position relations
    (on-peg ?d - disk ?p - peg)       ;; disk directly on a peg (no disk below)
    (on-disk ?d - disk ?below - disk) ;; disk directly on another disk

    ;; top-of-peg relations
    (top ?p - peg ?d - disk)          ;; disk is the top disk of a peg
    (top-peg-empty ?p - peg)         ;; peg is empty (no top disk)

    ;; size ordering (static relation that can be propagated by an action)
    (smaller ?d1 - disk ?d2 - disk)   ;; d1 is smaller than d2
  )

  ;; Propagate transitive smaller relations:
  ;; if X < Y and Y < Z and X < Z is not yet asserted, add X < Z.
  ;; This lets the problem specify only immediate neighbor comparisons in :init
  ;; while still ensuring the planner can obtain the full transitive ordering.
  (:action propagate-smaller
    :parameters (?x - disk ?y - disk ?z - disk)
    :precondition (and
      (smaller ?x ?y)
      (smaller ?y ?z)
      (not (smaller ?x ?z))
    )
    :effect (smaller ?x ?z)
  )

  ;; Move a top disk that is the only disk on its source peg to an empty destination peg.
  (:action move-peg-to-empty
    :parameters (?src - peg ?dst - peg ?d - disk)
    :precondition (and
      (top ?src ?d)
      (on-peg ?d ?src)
      (top-peg-empty ?dst)
    )
    :effect (and
      ;; remove old location on source peg
      (not (on-peg ?d ?src))
      (not (top ?src ?d))
      ;; source becomes empty
      (top-peg-empty ?src)
      ;; place disk on destination peg and update destination top status
      (on-peg ?d ?dst)
      (not (top-peg-empty ?dst))
      (top ?dst ?d)
    )
  )

  ;; Move a top disk that is the only disk on its source peg onto the top disk of a non-empty destination peg.
  (:action move-peg-to-disk
    :parameters (?src - peg ?dst - peg ?d - disk ?dsttop - disk)
    :precondition (and
      (top ?src ?d)
      (on-peg ?d ?src)
      (top ?dst ?dsttop)
      (smaller ?d ?dsttop)
    )
    :effect (and
      ;; remove old on-peg relation on source
      (not (on-peg ?d ?src))
      (not (top ?src ?d))
      ;; source becomes empty
      (top-peg-empty ?src)
      ;; place on top of destination disk
      (on-disk ?d ?dsttop)
      (not (top ?dst ?dsttop))
      (top ?dst ?d)
    )
  )

  ;; Move a top disk that sits on another disk to an empty destination peg.
  (:action move-disk-to-empty
    :parameters (?src - peg ?dst - peg ?d - disk ?below - disk)
    :precondition (and
      (top ?src ?d)
      (on-disk ?d ?below)
      (top-peg-empty ?dst)
    )
    :effect (and
      ;; remove old on-disk relation for moved disk
      (not (on-disk ?d ?below))
      (not (top ?src ?d))
      ;; the disk below becomes the new top of source
      (top ?src ?below)
      ;; place moved disk on destination peg
      (on-peg ?d ?dst)
      (not (top-peg-empty ?dst))
      (top ?dst ?d)
    )
  )

  ;; Move a top disk that sits on another disk onto the top disk of a non-empty destination peg.
  (:action move-disk-to-disk
    :parameters (?src - peg ?dst - peg ?d - disk ?below - disk ?dsttop - disk)
    :precondition (and
      (top ?src ?d)
      (on-disk ?d ?below)
      (top ?dst ?dsttop)
      (smaller ?d ?dsttop)
    )
    :effect (and
      ;; remove old on-disk relation and update source top
      (not (on-disk ?d ?below))
      (not (top ?src ?d))
      (top ?src ?below)
      ;; place on destination disk
      (on-disk ?d ?dsttop)
      (not (top ?dst ?dsttop))
      (top ?dst ?d)
    )
  )
)