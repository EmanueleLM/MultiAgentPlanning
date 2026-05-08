(define (domain towers-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage operator)

  (:predicates
    ; operator marker
    (is-operator ?op - operator)

    ; disk directly supported by either a disk or a peg (support)
    (on ?d - disk ?s - support)

    ; whether a support (disk or peg) has no disk immediately on it (i.e., is top)
    (clear ?s - support)

    ; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ; staging / discrete time successor relation and current marker
    (next ?t1 - stage ?t2 - stage)
    (current ?t - stage)
  )

  ; Move a top disk from any support (disk or peg) to an empty peg, advancing one stage
  (:action move-to-peg
    :parameters (?op - operator ?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (is-operator ?op)
      (on ?d ?from)
      (clear ?d)        ; disk is top (no disk above it)
      (clear ?to)       ; destination peg must be top (empty on top)
      (current ?t)      ; at current stage ?t
      (next ?t ?t2)     ; advance to immediate successor stage
    )
    :effect (and
      ; moved disk no longer on source support, now on destination peg
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
      (smaller ?d ?to)   ; mover must be smaller than destination disk
      (current ?t)       ; at current stage
      (next ?t ?t2)      ; advance to immediate successor
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