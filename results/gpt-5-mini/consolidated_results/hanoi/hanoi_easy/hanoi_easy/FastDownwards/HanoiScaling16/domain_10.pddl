(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)       ; disk is directly on a peg (bottom/sole disk)
    (on-disk ?d - disk ?d2 - disk)    ; disk is directly on another disk
    (clear-peg ?p - peg)              ; peg has no disks
    (clear-disk ?d - disk)            ; disk has no disk on top (is top of its stack)
    (smaller ?d1 - disk ?d2 - disk)   ; size ordering: d1 is smaller than d2
    (current ?s - step)               ; current stage
    (succ ?s1 - step ?s2 - step)      ; successor relation between stages
  )

  ;; Move a top disk that is the sole disk on a peg to an empty other peg.
  (:action move-peg-to-peg
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?next - step)
    :precondition (and
                    (current ?s)
                    (on-peg ?d ?from)
                    (clear-disk ?d)    ;; disk is top (and therefore sole on peg)
                    (clear-peg ?to)    ;; destination peg empty
                    (succ ?s ?next)
                  )
    :effect (and
              (not (on-peg ?d ?from))
              (on-peg ?d ?to)

              ;; source peg becomes empty; destination peg becomes non-empty
              (clear-peg ?from)
              (not (clear-peg ?to))

              ;; moved disk is top at its new location
              (clear-disk ?d)

              ;; advance stage marker
              (not (current ?s))
              (current ?next)
            )
  )

  ;; Move a top disk that is the sole disk on a peg onto another disk (target disk must be top and larger).
  (:action move-peg-to-disk
    :parameters (?s - step ?d - disk ?from - peg ?tod - disk ?next - step)
    :precondition (and
                    (current ?s)
                    (on-peg ?d ?from)
                    (clear-disk ?d)     ;; disk is top (sole)
                    (clear-disk ?tod)   ;; target disk is top
                    (smaller ?d ?tod)   ;; size ordering
                    (succ ?s ?next)
                  )
    :effect (and
              ;; move support from peg to another disk
              (not (on-peg ?d ?from))
              (on-disk ?d ?tod)

              ;; source peg becomes empty
              (clear-peg ?from)

              ;; target disk no longer top; moved disk becomes top
              (not (clear-disk ?tod))
              (clear-disk ?d)

              ;; advance stage marker
              (not (current ?s))
              (current ?next)
            )
  )

  ;; Move a top disk that is on top of another disk to an empty peg.
  (:action move-disk-to-peg
    :parameters (?s - step ?d - disk ?fromd - disk ?to - peg ?next - step)
    :precondition (and
                    (current ?s)
                    (on-disk ?d ?fromd)
                    (clear-disk ?d)    ;; disk is top
                    (clear-peg ?to)    ;; destination peg empty
                    (succ ?s ?next)
                  )
    :effect (and
              ;; move support from disk to peg
              (not (on-disk ?d ?fromd))
              (on-peg ?d ?to)

              ;; destination peg is no longer empty
              (not (clear-peg ?to))

              ;; the disk below becomes top
              (clear-disk ?fromd)

              ;; moved disk is top at its new location
              (clear-disk ?d)

              ;; advance stage marker
              (not (current ?s))
              (current ?next)
            )
  )

  ;; Move a top disk that is on another disk onto another disk (target must be top and larger).
  (:action move-disk-to-disk
    :parameters (?s - step ?d - disk ?fromd - disk ?tod - disk ?next - step)
    :precondition (and
                    (current ?s)
                    (on-disk ?d ?fromd)
                    (clear-disk ?d)     ;; disk is top
                    (clear-disk ?tod)   ;; target disk is top
                    (smaller ?d ?tod)   ;; size ordering
                    (succ ?s ?next)
                  )
    :effect (and
              ;; reattach moved disk onto target disk
              (not (on-disk ?d ?fromd))
              (on-disk ?d ?tod)

              ;; target disk no longer top; the disk below becomes top
              (not (clear-disk ?tod))
              (clear-disk ?fromd)

              ;; moved disk is top at its new location
              (clear-disk ?d)

              ;; advance stage marker
              (not (current ?s))
              (current ?next)
            )
  )
)