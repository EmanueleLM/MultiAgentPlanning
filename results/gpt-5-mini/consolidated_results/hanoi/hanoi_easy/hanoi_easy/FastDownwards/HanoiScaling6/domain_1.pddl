(define (domain towers-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage operator)

  (:predicates
    ; operator marker (no name clash with types)
    (is-operator ?op - operator)

    ; disk directly supported by either a disk or a peg
    (on ?d - disk ?s - support)

    ; whether a support (disk or peg) has no disk immediately on it
    (clear ?s - support)

    ; size ordering relation: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ; staging / discrete time objects and ordering
    (stage ?t - stage)
    (next ?t1 - stage ?t2 - stage)
    (current ?t - stage)
  )

  ; Move a top disk from any support (disk or peg) to a peg, advancing one stage
  (:action move-to-peg
    :parameters (?op - operator ?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (is-operator ?op)
      (on ?d ?from)
      (clear ?d)        ; disk is top (no disk above it)
      (clear ?to)       ; destination peg is empty on top
      (current ?t)      ; must be at current stage ?t
      (next ?t ?t2)     ; can only advance to immediate successor stage
    )
    :effect (and
      ; update support relations for the moved disk
      (not (on ?d ?from))
      (on ?d ?to)

      ; destination peg is no longer clear; source support becomes clear
      (not (clear ?to))
      (clear ?from)

      ; advance the global stage marker by one
      (not (current ?t))
      (current ?t2)
    )
  )

  ; Move a top disk from any support to another top disk, obeying the size constraint, advancing one stage
  (:action move-to-disk
    :parameters (?op - operator ?d - disk ?from - support ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (is-operator ?op)
      (on ?d ?from)
      (clear ?d)         ; disk is top
      (clear ?to)        ; destination disk must be top to receive another disk
      (smaller ?d ?to)   ; size constraint: mover must be smaller than destination disk
      (current ?t)       ; staging: current stage
      (next ?t ?t2)      ; must advance to immediate successor
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ; destination disk is no longer clear; source support becomes clear
      (not (clear ?to))
      (clear ?from)

      ; advance the global stage marker by one
      (not (current ?t))
      (current ?t2)
    )
  )
)