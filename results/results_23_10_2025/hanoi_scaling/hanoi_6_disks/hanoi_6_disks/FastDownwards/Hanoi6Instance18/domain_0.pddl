(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk)
  (:predicates
    ;; disk is directly on (either a disk or a peg)
    (on ?d - disk ?x - (either disk peg))
    ;; top-of-stack predicate: true for pegs (when empty) or disks (when nothing on them)
    (clear ?x - (either disk peg))
    ;; static size relation: (smaller x y) means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)
  )

  ;; Move a disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)        ;; peg must be empty to use this action
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)      ;; the support becomes clear after removing ?d
      (not (clear ?to))  ;; the peg is no longer empty
      (clear ?d)         ;; ?d remains clear (nothing on top of it)
    )
  )

  ;; Move a disk onto another disk (target disk must be larger)
  (:action move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)        ;; target disk must be the top disk of its peg/stack
      (smaller ?d ?to)   ;; cannot place larger on smaller: moving disk must be smaller
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)      ;; the support becomes clear after removing ?d
      (not (clear ?to))  ;; target disk is no longer clear (has ?d on top)
      (clear ?d)         ;; ?d remains clear (nothing on top of it)
    )
  )
)