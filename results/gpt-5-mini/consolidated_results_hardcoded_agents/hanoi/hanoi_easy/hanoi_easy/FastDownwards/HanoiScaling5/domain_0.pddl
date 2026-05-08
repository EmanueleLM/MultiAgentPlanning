(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; disk on a place (peg or disk)
    (on ?d - disk ?p - object)
    ;; top disk currently on a peg
    (top ?peg - peg ?d - disk)
    ;; peg currently empty (no disks)
    (top-peg-empty ?peg - peg)
    ;; a disk has no disk on top of it
    (clear ?d - disk)
    ;; size ordering: (smaller d1 d2) means d1 is smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Case 1: the moving disk ?d is top of ?src and is directly supported by another disk ?below.
  ;; Destination ?dst is an empty peg.
  (:action move-src-with-below-to-empty
    :parameters (?src - peg ?dst - peg ?d - disk ?below - disk)
    :precondition (and
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
    )
  )

  ;; Case 2: the moving disk ?d is top of ?src and is supported by a disk ?below.
  ;; Destination ?dst has top disk ?dsttop (non-empty); requires size constraint.
  (:action move-src-with-below-to-nonempty
    :parameters (?src - peg ?dst - peg ?d - disk ?below - disk ?dsttop - disk)
    :precondition (and
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
    )
  )

  ;; Case 3: the moving disk ?d is top of ?src and is directly supported by the peg ?src (i.e., it sits on the peg).
  ;; Destination ?dst is empty.
  (:action move-src-with-peg-support-to-empty
    :parameters (?src - peg ?dst - peg ?d - disk)
    :precondition (and
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
    )
  )

  ;; Case 4: the moving disk ?d is top of ?src and is supported by the peg ?src.
  ;; Destination ?dst has top disk ?dsttop (non-empty); requires size constraint.
  (:action move-src-with-peg-support-to-nonempty
    :parameters (?src - peg ?dst - peg ?d - disk ?dsttop - disk)
    :precondition (and
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
    )
  )
)