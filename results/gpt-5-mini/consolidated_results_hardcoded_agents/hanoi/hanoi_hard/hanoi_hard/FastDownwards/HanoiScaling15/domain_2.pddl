(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg - support
    stage
    support
  )

  (:predicates
    ;; disk directly on a support (either a peg or another disk)
    (on ?d - disk ?s - support)

    ;; support (peg or disk) has nothing directly on it (is the top)
    (clear ?s - support)

    ;; static size ordering: ?a is smaller than ?b
    (smaller ?a - disk ?b - disk)

    ;; discrete ordered stages (successor relation) and current stage marker
    (succ ?t1 - stage ?t2 - stage)
    (current ?t - stage)
  )

  ;; Move a disk that is directly on a peg to an empty peg.
  (:action mover-move-peg-to-peg
    :parameters (?disk - disk ?from - peg ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?disk ?from)      ; disk is directly supported by the source peg
      (clear ?disk)         ; disk is the top disk at its source support
      (clear ?to)           ; destination peg is empty (no top disk)
      (current ?t)          ; exactly one move at the current stage
      (succ ?t ?t2)         ; enforce discrete stage progression
      (not (on ?disk ?to))  ; prevent a no-op move to the same support
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (clear ?from)         ; source support (peg) becomes top (or empty)
      (not (clear ?to))     ; destination no longer empty
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a disk that is directly on another disk to an empty peg.
  (:action mover-move-disk-to-peg
    :parameters (?disk - disk ?from - disk ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?disk ?from)      ; disk directly supported by a disk
      (clear ?disk)         ; disk is the top disk on that support
      (clear ?to)           ; destination peg empty
      (current ?t)
      (succ ?t ?t2)
      (not (on ?disk ?to))  ; avoid moving to the same support
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (clear ?from)         ; the disk that supported ?disk becomes top
      (not (clear ?to))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a disk that is directly on a peg to another disk (stacking),
  ;; allowed only if the moved disk is smaller than the destination top disk.
  (:action mover-move-peg-to-disk
    :parameters (?disk - disk ?from - peg ?top - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?disk ?from)        ; disk directly on source peg
      (clear ?disk)           ; disk is top at its source
      (clear ?top)            ; destination top disk is free
      (smaller ?disk ?top)    ; size constraint: cannot place larger on smaller
      (current ?t)
      (succ ?t ?t2)
      (not (on ?disk ?top))   ; prevent no-op if already on that disk
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?top)
      (clear ?from)
      (not (clear ?top))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a disk that is directly on another disk to another disk (stacking),
  ;; allowed only if the moved disk is smaller than the destination top disk.
  (:action mover-move-disk-to-disk
    :parameters (?disk - disk ?from - disk ?top - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?top)
      (smaller ?disk ?top)
      (current ?t)
      (succ ?t ?t2)
      (not (on ?disk ?top))
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?top)
      (clear ?from)
      (not (clear ?top))
      (not (current ?t))
      (current ?t2)
    )
  )
)