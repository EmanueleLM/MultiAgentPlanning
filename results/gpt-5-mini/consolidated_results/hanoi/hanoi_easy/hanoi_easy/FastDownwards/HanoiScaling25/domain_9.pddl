(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)

  (:types disk peg stage)

  (:predicates
    ;; disk directly on a peg or on another disk
    (on ?d - disk ?s - (either disk peg))
    ;; support (disk or peg) has nothing on top of it
    (clear ?s - (either disk peg))
    ;; discrete stage bookkeeping
    (current ?t - stage)
    (next ?t1 - stage ?t2 - stage)
    ;; size ordering
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg, advancing to the successor stage.
  (:action move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on ?d ?from)       ;; ?d is directly on ?from
      (clear ?d)          ;; ?d is the top disk on its support
      (clear ?to)         ;; target peg has nothing on top
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear flags:
      (not (clear ?to))   ;; target peg no longer clear
      (clear ?from)       ;; previous support becomes clear (now top)
      (clear ?d)          ;; moved disk is top at its new location

      ;; advance stage
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk onto another top disk (must be smaller), advancing stage.
  (:action move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on ?d ?from)        ;; ?d is directly on ?from
      (clear ?d)           ;; ?d is the top disk on its support
      (clear ?to)          ;; target disk is top on its support
      (smaller ?d ?to)     ;; size constraint
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear flags:
      (not (clear ?to))   ;; target disk now has something on it
      (clear ?from)       ;; previous support becomes clear
      (clear ?d)          ;; moved disk is top at its new location

      ;; advance stage
      (not (current ?t))
      (current ?t2)
    )
  )
)