(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk directly on a peg
    (on-disk ?d - disk ?u - disk)      ; disk directly on another disk
    (top ?p - peg ?d - disk)           ; ?d is the top disk on peg ?p
    (empty ?p - peg)                   ; peg ?p has no disks
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2
    (scheduled ?st - step ?d - disk ?from - peg ?to - peg) ; scheduled move at step
    (ready ?st - step)                 ; step is ready to execute
    (next ?st1 - step ?st2 - step)     ; ordering of steps
    (moved ?st - step)                 ; step has been executed
  )

  ;; Move: source peg's top disk is directly on the peg, destination peg empty
  (:action mover-move-srcPeg-to-empty
    :parameters (?s - step ?next - step ?d - disk ?src - peg ?dst - peg)
    :precondition (and
      (scheduled ?s ?d ?src ?dst)
      (ready ?s)
      (top ?src ?d)
      (on-peg ?d ?src)
      (empty ?dst)
      (next ?s ?next)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (on-peg ?d ?dst)
      (not (top ?src ?d))
      (top ?dst ?d)
      (empty ?src)
      (not (empty ?dst))
      (not (ready ?s))
      (moved ?s)
      (ready ?next)
    )
  )

  ;; Move: source peg's top disk is directly on the peg, destination peg non-empty (onto top disk)
  (:action mover-move-srcPeg-to-nonempty
    :parameters (?s - step ?next - step ?d - disk ?src - peg ?dst - peg ?dstTop - disk)
    :precondition (and
      (scheduled ?s ?d ?src ?dst)
      (ready ?s)
      (top ?src ?d)
      (on-peg ?d ?src)
      (top ?dst ?dstTop)
      (smaller ?d ?dstTop)
      (next ?s ?next)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (on-disk ?d ?dstTop)
      (not (top ?src ?d))
      (not (top ?dst ?dstTop))
      (top ?dst ?d)
      (empty ?src)
      (not (ready ?s))
      (moved ?s)
      (ready ?next)
    )
  )

  ;; Move: source peg's top disk sits on another disk, destination peg empty
  (:action mover-move-srcDisk-to-empty
    :parameters (?s - step ?next - step ?d - disk ?src - peg ?dst - peg ?under - disk)
    :precondition (and
      (scheduled ?s ?d ?src ?dst)
      (ready ?s)
      (top ?src ?d)
      (on-disk ?d ?under)
      (empty ?dst)
      (next ?s ?next)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-peg ?d ?dst)
      (not (top ?src ?d))
      (top ?src ?under)
      (top ?dst ?d)
      (not (empty ?dst))
      (not (ready ?s))
      (moved ?s)
      (ready ?next)
    )
  )

  ;; Move: source peg's top disk sits on another disk, destination peg non-empty (onto top disk)
  (:action mover-move-srcDisk-to-nonempty
    :parameters (?s - step ?next - step ?d - disk ?src - peg ?dst - peg ?under - disk ?dstTop - disk)
    :precondition (and
      (scheduled ?s ?d ?src ?dst)
      (ready ?s)
      (top ?src ?d)
      (on-disk ?d ?under)
      (top ?dst ?dstTop)
      (smaller ?d ?dstTop)
      (next ?s ?next)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-disk ?d ?dstTop)
      (not (top ?src ?d))
      (top ?src ?under)
      (not (top ?dst ?dstTop))
      (top ?dst ?d)
      (not (ready ?s))
      (moved ?s)
      (ready ?next)
    )
  )
)