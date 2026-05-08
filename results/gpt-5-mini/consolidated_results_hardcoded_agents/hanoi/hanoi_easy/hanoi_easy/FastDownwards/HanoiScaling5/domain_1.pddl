(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step - object)

  (:predicates
    ;; disk supported by either a peg or another disk
    (on ?d - disk ?support - object)
    ;; top disk currently on a peg
    (top ?peg - peg ?d - disk)
    ;; peg currently empty (no disks)
    (top-peg-empty ?peg - peg)
    ;; a disk has no disk on top of it
    (clear ?d - disk)
    ;; size ordering: (smaller d1 d2) means d1 is smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; explicit step/time bookkeeping
    (current-step ?s - step)
    (succ ?s - step ?s2 - step)
  )

  ;; Move a top disk ?d that is supported by another disk ?below from src to an empty destination peg dst.
  (:action move-disk-supported-to-empty
    :parameters (?src - peg ?dst - peg ?d - disk ?below - disk ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (top ?src ?d)
      (on ?d ?below)
      (top-peg-empty ?dst)
      (clear ?d)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?below))
      (on ?d ?dst)
      ;; update source peg top: new top is the disk that supported ?d
      (not (top ?src ?d))
      (top ?src ?below)
      ;; update destination peg top: no longer empty, top is the moved disk
      (not (top-peg-empty ?dst))
      (top ?dst ?d)
      ;; after removing ?d, the supporting disk becomes clear
      (clear ?below)
      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk ?d that is supported by another disk ?below from src onto another disk ?dsttop on dst (non-empty).
  (:action move-disk-supported-to-nonempty
    :parameters (?src - peg ?dst - peg ?d - disk ?below - disk ?dsttop - disk ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (top ?src ?d)
      (on ?d ?below)
      (top ?dst ?dsttop)
      (clear ?d)
      (smaller ?d ?dsttop)
    )
    :effect (and
      ;; relocate disk onto the current top disk of destination
      (not (on ?d ?below))
      (on ?d ?dsttop)
      ;; update source peg top to the supporting disk
      (not (top ?src ?d))
      (top ?src ?below)
      ;; update destination top: previous top is no longer top, moved disk becomes new top
      (not (top ?dst ?dsttop))
      (top ?dst ?d)
      ;; the previous dst top now has a disk on it, so it is not clear
      (not (clear ?dsttop))
      ;; after removing ?d, the supporting disk becomes clear
      (clear ?below)
      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk ?d that is directly on the source peg ?src to an empty destination peg ?dst.
  (:action move-peg-supported-to-empty
    :parameters (?src - peg ?dst - peg ?d - disk ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (top ?src ?d)
      (on ?d ?src)
      (top-peg-empty ?dst)
      (clear ?d)
    )
    :effect (and
      ;; relocate disk from src-peg to dst-peg
      (not (on ?d ?src))
      (on ?d ?dst)
      ;; source peg becomes empty
      (not (top ?src ?d))
      (top-peg-empty ?src)
      ;; destination peg is no longer empty; new top is moved disk
      (not (top-peg-empty ?dst))
      (top ?dst ?d)
      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk ?d that is directly on the source peg ?src onto another disk ?dsttop on dst (non-empty).
  (:action move-peg-supported-to-nonempty
    :parameters (?src - peg ?dst - peg ?d - disk ?dsttop - disk ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (top ?src ?d)
      (on ?d ?src)
      (top ?dst ?dsttop)
      (clear ?d)
      (smaller ?d ?dsttop)
    )
    :effect (and
      ;; relocate disk onto the current top disk of destination
      (not (on ?d ?src))
      (on ?d ?dsttop)
      ;; source peg becomes empty
      (not (top ?src ?d))
      (top-peg-empty ?src)
      ;; update destination top: previous top is no longer top, moved disk becomes new top
      (not (top ?dst ?dsttop))
      (top ?dst ?d)
      ;; the previous dst top now has a disk on it, so it is not clear
      (not (clear ?dsttop))
      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )
)