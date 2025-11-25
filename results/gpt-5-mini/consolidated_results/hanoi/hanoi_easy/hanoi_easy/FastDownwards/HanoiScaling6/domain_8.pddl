(define (domain towers-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage operator)

  (:predicates
    (is-operator ?op - operator)
    (on ?d - disk ?s - support)    ;; ?d is directly on support ?s (disk or peg)
    (clear ?s - support)           ;; support has no disk directly on it (disk is top, peg is empty)
    (smaller ?d1 - disk ?d2 - disk) ;; size ordering: ?d1 is smaller than ?d2
    (next ?t1 - stage ?t2 - stage) ;; successor relation between contiguous stages
    (current ?t - stage)           ;; which stage is currently active
  )

  ;; Move a top disk from a support (disk or peg) onto an empty peg.
  (:action move-to-peg
    :parameters (?op - operator ?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (is-operator ?op)
      (on ?d ?from)     ;; ?d is directly on ?from
      (clear ?d)        ;; ?d has no disk on top (is top)
      (clear ?to)       ;; destination peg is empty
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))  ;; destination peg now has a disk on it (not empty)
      (clear ?from)      ;; the support that lost the top disk has no disk directly on it
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from a support onto another top disk that is larger.
  (:action move-to-disk
    :parameters (?op - operator ?d - disk ?from - support ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (is-operator ?op)
      (on ?d ?from)      ;; ?d is directly on ?from
      (clear ?d)         ;; ?d has no disk on top (is top)
      (clear ?to)        ;; destination disk is top of its support
      (smaller ?d ?to)   ;; moved disk must be smaller than destination disk
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))  ;; destination disk now has a disk on top (no longer clear)
      (clear ?from)      ;; support that lost the top disk has no disk directly on it
      (not (current ?t))
      (current ?t2)
    )
  )
)