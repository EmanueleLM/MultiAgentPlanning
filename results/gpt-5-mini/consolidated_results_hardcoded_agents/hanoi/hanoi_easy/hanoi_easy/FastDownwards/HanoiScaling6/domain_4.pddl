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

  (:action move-to-peg
    :parameters (?op - operator ?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (is-operator ?op)
      (on ?d ?from)
      (clear ?d)        ;; disk is top of its support
      (clear ?to)       ;; destination peg must be empty (top)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action move-to-disk
    :parameters (?op - operator ?d - disk ?from - support ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (is-operator ?op)
      (on ?d ?from)
      (clear ?d)         ;; disk is top of its support
      (clear ?to)        ;; destination disk must be top
      (smaller ?d ?to)   ;; mover must be strictly smaller than destination disk
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current ?t))
      (current ?t2)
    )
  )
)