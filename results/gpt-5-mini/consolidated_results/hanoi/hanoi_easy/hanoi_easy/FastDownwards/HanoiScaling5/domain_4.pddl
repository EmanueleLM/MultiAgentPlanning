(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk is directly on a peg
    (on-peg ?d - disk ?p - peg)
    ;; disk is directly on another disk
    (on-disk ?d - disk ?below - disk)
    ;; top disk of a peg
    (top ?p - peg ?d - disk)
    ;; peg is empty (no disks)
    (top-peg-empty ?p - peg)
    ;; disk has no disk on top of it
    (clear ?d - disk)
    ;; size ordering: smaller ?d1 ?d2 means d1 smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; step/time bookkeeping
    (current-step ?s - step)
    (succ ?s1 - step ?s2 - step)
  )

  ;; Move a top disk that is directly on the source peg to an empty destination peg.
  (:action move-peg-to-empty
    :parameters (?s - step ?snext - step ?src - peg ?dst - peg ?d - disk)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (top ?src ?d)
      (on-peg ?d ?src)
      (top-peg-empty ?dst)
      (clear ?d)
    )
    :effect (and
      ;; relocate disk from src-peg to dst-peg
      (not (on-peg ?d ?src))
      (on-peg ?d ?dst)
      ;; update source peg: becomes empty
      (not (top ?src ?d))
      (top-peg-empty ?src)
      ;; update destination peg: no longer empty; new top is moved disk
      (not (top-peg-empty ?dst))
      (top ?dst ?d)
      ;; moved disk is now top and therefore clear
      (clear ?d)
      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk that is directly on the source peg onto the top disk of a non-empty destination peg.
  (:action move-peg-to-disk
    :parameters (?s - step ?snext - step ?src - peg ?dst - peg ?d - disk ?dsttop - disk)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (top ?src ?d)
      (on-peg ?d ?src)
      (top ?dst ?dsttop)
      (clear ?d)
      (smaller ?d ?dsttop)
    )
    :effect (and
      ;; relocate disk onto the current top disk of destination
      (not (on-peg ?d ?src))
      (on-disk ?d ?dsttop)
      ;; source peg becomes empty
      (not (top ?src ?d))
      (top-peg-empty ?src)
      ;; update destination top: previous top is no longer top, moved disk becomes new top
      (not (top ?dst ?dsttop))
      (top ?dst ?d)
      ;; the previous dst top now has a disk on it, so it is not clear
      (not (clear ?dsttop))
      ;; moved disk is now top at destination and therefore clear
      (clear ?d)
      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk that is supported by another disk (on-disk) from its source peg to an empty destination peg.
  (:action move-disk-to-empty
    :parameters (?s - step ?snext - step ?src - peg ?dst - peg ?d - disk ?below - disk)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (top ?src ?d)
      (on-disk ?d ?below)
      (top-peg-empty ?dst)
      (clear ?d)
    )
    :effect (and
      ;; relocate disk from on top of ?below to destination peg
      (not (on-disk ?d ?below))
      (on-peg ?d ?dst)
      ;; update source peg top: new top is the supporting disk ?below
      (not (top ?src ?d))
      (top ?src ?below)
      ;; destination peg is no longer empty; new top is moved disk
      (not (top-peg-empty ?dst))
      (top ?dst ?d)
      ;; after removing ?d, the supporting disk becomes clear
      (clear ?below)
      ;; moved disk is now top at destination and therefore clear
      (clear ?d)
      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk that is supported by another disk (on-disk) onto the top disk of a non-empty destination peg.
  (:action move-disk-to-disk
    :parameters (?s - step ?snext - step ?src - peg ?dst - peg ?d - disk ?below - disk ?dsttop - disk)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (top ?src ?d)
      (on-disk ?d ?below)
      (top ?dst ?dsttop)
      (clear ?d)
      (smaller ?d ?dsttop)
    )
    :effect (and
      ;; relocate disk onto the current top disk of destination
      (not (on-disk ?d ?below))
      (on-disk ?d ?dsttop)
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
      ;; moved disk is now top at destination and therefore clear
      (clear ?d)
      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )
)