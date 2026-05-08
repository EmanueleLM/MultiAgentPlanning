(define (domain towers-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage operator)

  (:predicates
    (is-operator ?op - operator)
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?d1 - disk ?d2 - disk)
    (next ?t1 - stage ?t2 - stage)
    (current ?t - stage)
  )

  ;; Move a top disk from a support (disk or peg) onto an empty peg.
  (:action move-to-peg
    :parameters (?op - operator ?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (is-operator ?op)
      (on ?d ?from)
      (clear ?d)         ;; ?d must be the top disk on its source support
      (clear ?to)        ;; destination peg must be empty
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))  ;; peg now has a top disk
      (clear ?from)      ;; source support becomes clear (no disk directly on it)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from a support onto another top disk that is larger.
  (:action move-to-disk
    :parameters (?op - operator ?d - disk ?from - support ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (is-operator ?op)
      (on ?d ?from)
      (clear ?d)         ;; ?d must be the top disk on its source support
      (clear ?to)        ;; destination disk must be the top disk on its support
      (smaller ?d ?to)   ;; size ordering: moved disk must be smaller than destination disk
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))  ;; destination disk now has a disk on top, so not clear
      (clear ?from)      ;; source support becomes clear
      (not (current ?t))
      (current ?t2)
    )
  )
)