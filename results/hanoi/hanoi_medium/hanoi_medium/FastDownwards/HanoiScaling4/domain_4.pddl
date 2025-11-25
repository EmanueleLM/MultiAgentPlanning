(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk directly on a peg (bottom-most support)
    (on-disk ?d - disk ?u - disk)      ; disk directly on another disk
    (top ?p - peg ?d - disk)           ; ?d is the top disk on peg ?p
    (empty ?p - peg)                   ; peg ?p has no disks
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2
    (scheduled ?s - step ?d - disk ?from - peg ?to - peg) ; scheduled move at step
    (ready ?s - step)                  ; step is ready to execute
    (next ?s1 - step ?s2 - step)       ; ordering of steps
    (moved ?s - step)                  ; step has been executed
  )

  ;; Move when the top disk is directly on the source peg and destination is empty
  (:action mover-move-onpeg-to-empty
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
      ;; move disk from source peg to destination peg (destination was empty)
      (not (on-peg ?d ?src))
      (on-peg ?d ?dst)

      ;; update top relations: source becomes empty (no underlying disk)
      (not (top ?src ?d))
      (empty ?src)

      ;; destination is no longer empty, d becomes top there
      (not (empty ?dst))
      (top ?dst ?d)

      ;; step bookkeeping
      (not (ready ?s))
      (moved ?s)
      (ready ?next)
    )
  )

  ;; Move when the top disk is directly on the source peg and destination has a top disk
  (:action mover-move-onpeg-to-ondisk
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
      ;; detach from source peg and attach on top of dstTop
      (not (on-peg ?d ?src))
      (on-disk ?d ?dstTop)

      ;; source becomes empty
      (not (top ?src ?d))
      (empty ?src)

      ;; update destination top: dstTop is no longer top, d becomes top
      (not (top ?dst ?dstTop))
      (top ?dst ?d)

      ;; step bookkeeping
      (not (ready ?s))
      (moved ?s)
      (ready ?next)
    )
  )

  ;; Move when the top disk is on top of another disk at source and destination is empty
  (:action mover-move-ondisk-to-empty
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
      ;; detach d from underlying disk and place on empty destination peg
      (not (on-disk ?d ?under))
      (on-peg ?d ?dst)

      ;; update top at source: underlying disk becomes the new top
      (not (top ?src ?d))
      (top ?src ?under)

      ;; destination is no longer empty and d is top there
      (not (empty ?dst))
      (top ?dst ?d)

      ;; step bookkeeping
      (not (ready ?s))
      (moved ?s)
      (ready ?next)
    )
  )

  ;; Move when the top disk is on top of another disk at source and destination has a top disk
  (:action mover-move-ondisk-to-ondisk
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
      ;; detach from under and attach on top of dstTop
      (not (on-disk ?d ?under))
      (on-disk ?d ?dstTop)

      ;; update top at source: underlying disk becomes top
      (not (top ?src ?d))
      (top ?src ?under)

      ;; update top at destination
      (not (top ?dst ?dstTop))
      (top ?dst ?d)

      ;; step bookkeeping
      (not (ready ?s))
      (moved ?s)
      (ready ?next)
    )
  )
)