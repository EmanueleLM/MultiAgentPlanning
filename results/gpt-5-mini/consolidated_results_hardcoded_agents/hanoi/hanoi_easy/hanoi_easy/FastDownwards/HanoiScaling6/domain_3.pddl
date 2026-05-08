(define (domain towers-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage operator)

  (:predicates
    ;; single operator token to serialize moves
    (is-operator ?op - operator)

    ;; disk directly supported by either a disk or a peg (support)
    (on ?d - disk ?s - support)

    ;; whether a support (disk or peg) has no disk immediately on it (i.e., is top)
    (clear ?s - support)

    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; discrete stage successor relation and current marker
    (next ?t1 - stage ?t2 - stage)
    (current ?t - stage)
  )

  ;; Move the top disk from a support (disk or peg) to an empty peg, advancing one stage.
  (:action move-to-peg
    :parameters (?op - operator ?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (is-operator ?op)
      (on ?d ?from)
      (clear ?d)        ;; disk is top of its support
      (clear ?to)       ;; destination peg must be empty (top)
      (current ?t)      ;; at current stage
      (next ?t ?t2)     ;; must advance to immediate successor stage
    )
    :effect (and
      ;; relocate disk d from source to destination peg
      (not (on ?d ?from))
      (on ?d ?to)

      ;; destination peg no longer clear; source support becomes clear
      (not (clear ?to))
      (clear ?from)

      ;; advance global stage marker by one (enforce contiguous single-step progression)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move the top disk from a support (disk or peg) onto another disk, obeying size ordering, advancing one stage.
  (:action move-to-disk
    :parameters (?op - operator ?d - disk ?from - support ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (is-operator ?op)
      (on ?d ?from)
      (clear ?d)         ;; disk is top of its support
      (clear ?to)        ;; destination disk must be top (no disk on it)
      (smaller ?d ?to)   ;; mover must be strictly smaller than destination disk
      (current ?t)       ;; at current stage
      (next ?t ?t2)      ;; must advance to immediate successor stage
    )
    :effect (and
      ;; relocate disk d from source to be on top of destination disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; destination disk no longer clear; source support becomes clear
      (not (clear ?to))
      (clear ?from)

      ;; advance global stage marker by one
      (not (current ?t))
      (current ?t2)
    )
  )
)