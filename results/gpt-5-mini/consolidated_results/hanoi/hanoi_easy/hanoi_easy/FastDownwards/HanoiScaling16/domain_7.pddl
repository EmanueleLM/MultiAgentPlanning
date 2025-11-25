(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)      ;; disk ?d directly on peg ?p (i.e., bottom/sole disk)
    (on-disk ?d - disk ?d2 - disk)  ;; disk ?d directly on disk ?d2
    (clear-peg ?p - peg)            ;; peg ?p has no disks
    (clear-disk ?d - disk)          ;; disk ?d has no disk on top (is top)
    (smaller ?d1 - disk ?d2 - disk) ;; ?d1 is smaller than ?d2
    (current ?s - step)             ;; current stage
    (succ ?s1 - step ?s2 - step)    ;; successor relation between stages
  )

  ;; Move a top disk that is currently the sole disk on a peg to an empty peg.
  (:action move-peg-to-peg
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?next - step)
    :precondition (and
                    (current ?s)
                    (on-peg ?d ?from)
                    (clear-disk ?d)    ;; disk is top
                    (clear-peg ?to)    ;; destination peg empty
                    (succ ?s ?next)
                  )
    :effect (and
              (not (on-peg ?d ?from))
              (on-peg ?d ?to)
              (not (clear-peg ?to))
              (clear-peg ?from)
              ;; moved disk remains top
              (clear-disk ?d)
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
                    (clear-disk ?d)     ;; disk is top
                    (clear-disk ?tod)   ;; target disk is top
                    (smaller ?d ?tod)   ;; size ordering
                    (succ ?s ?next)
                  )
    :effect (and
              (not (on-peg ?d ?from))
              (on-disk ?d ?tod)
              (not (clear-disk ?tod)) ;; target no longer top
              (clear-peg ?from)
              ;; moved disk is top at new location
              (clear-disk ?d)
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
              (not (on-disk ?d ?fromd))
              (on-peg ?d ?to)
              (not (clear-peg ?to))
              ;; the disk below becomes top
              (clear-disk ?fromd)
              ;; moved disk is top at its new location
              (clear-disk ?d)
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
              (not (on-disk ?d ?fromd))
              (on-disk ?d ?tod)
              (not (clear-disk ?tod)) ;; target no longer top
              ;; the disk below becomes top
              (clear-disk ?fromd)
              ;; moved disk is top at its new location
              (clear-disk ?d)
              (not (current ?s))
              (current ?next)
            )
  )
)