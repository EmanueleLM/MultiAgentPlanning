(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support step)
  (:predicates
    (on ?d - disk ?s - support)            ; disc directly on support (peg or another disk)
    (top ?p - peg ?d - disk)              ; top disk on a peg
    (empty ?p - peg)                      ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)       ; d1 is smaller than d2
    (scheduled ?st - step ?d - disk ?from - peg ?to - peg) ; scheduled move at step
    (ready ?st - step)                    ; step is ready to execute
    (next ?st1 - step ?st2 - step)        ; ordering of steps
    (moved ?st - step)                    ; step has been executed
    (audited)                             ; auditor has validated final state
  )

  ;; Move where source top disk sits directly on the source peg, destination peg is empty
  (:action mover-move-srcPeg-under-peg-to-empty
    :parameters (?s - step ?next - step ?d - disk ?src - peg ?dst - peg)
    :precondition (and
      (scheduled ?s ?d ?src ?dst)
      (ready ?s)
      (top ?src ?d)
      (on ?d ?src)
      (empty ?dst)
      (next ?s ?next)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (not (top ?src ?d))
      (top ?dst ?d)
      (empty ?src)
      (not (empty ?dst))
      (not (ready ?s))
      (moved ?s)
      (ready ?next)
    )
  )

  ;; Move where source top disk sits directly on the source peg, destination peg non-empty (has top disk)
  (:action mover-move-srcPeg-under-peg-to-nonempty
    :parameters (?s - step ?next - step ?d - disk ?src - peg ?dst - peg ?dstTop - disk)
    :precondition (and
      (scheduled ?s ?d ?src ?dst)
      (ready ?s)
      (top ?src ?d)
      (on ?d ?src)
      (top ?dst ?dstTop)
      (smaller ?d ?dstTop)
      (next ?s ?next)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dstTop)
      (not (top ?src ?d))
      (not (top ?dst ?dstTop))
      (top ?dst ?d)
      (not (ready ?s))
      (moved ?s)
      (ready ?next)
    )
  )

  ;; Move where source top disk sits on another disk, destination peg is empty
  (:action mover-move-srcDisk-under-to-empty
    :parameters (?s - step ?next - step ?d - disk ?src - peg ?dst - peg ?under - disk)
    :precondition (and
      (scheduled ?s ?d ?src ?dst)
      (ready ?s)
      (top ?src ?d)
      (on ?d ?under)
      (empty ?dst)
      (next ?s ?next)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?dst)
      (not (top ?src ?d))
      (top ?dst ?d)
      (top ?src ?under)
      (not (empty ?dst))
      (not (ready ?s))
      (moved ?s)
      (ready ?next)
    )
  )

  ;; Move where source top disk sits on another disk, destination peg non-empty
  (:action mover-move-srcDisk-under-to-nonempty
    :parameters (?s - step ?next - step ?d - disk ?src - peg ?dst - peg ?under - disk ?dstTop - disk)
    :precondition (and
      (scheduled ?s ?d ?src ?dst)
      (ready ?s)
      (top ?src ?d)
      (on ?d ?under)
      (top ?dst ?dstTop)
      (smaller ?d ?dstTop)
      (next ?s ?next)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?dstTop)
      (not (top ?src ?d))
      (top ?src ?under)
      (not (top ?dst ?dstTop))
      (top ?dst ?d)
      (not (ready ?s))
      (moved ?s)
      (ready ?next)
    )
  )

  ;; Auditor validates the entire sequence and the final configuration
  (:action auditor-validate
    :parameters (?s - step)
    :precondition (and
      (ready ?s)
      ;; all scheduled move steps must be executed
      (moved s1) (moved s2) (moved s3) (moved s4) (moved s5)
      (moved s6) (moved s7) (moved s8) (moved s9) (moved s10)
      (moved s11) (moved s12) (moved s13) (moved s14) (moved s15)
      (moved s16) (moved s17) (moved s18) (moved s19) (moved s20)
      (moved s21) (moved s22) (moved s23) (moved s24) (moved s25)
      (moved s26) (moved s27) (moved s28) (moved s29) (moved s30)
      (moved s31)
      ;; final configuration: middle peg holds A (top), B, C, D, E (bottom)
      (on A B) (on B C) (on C D) (on D E) (on E middle)
      (top middle A)
      ;; left and right pegs empty as required
      (empty left)
      (empty right)
    )
    :effect (and
      (audited)
    )
  )
)