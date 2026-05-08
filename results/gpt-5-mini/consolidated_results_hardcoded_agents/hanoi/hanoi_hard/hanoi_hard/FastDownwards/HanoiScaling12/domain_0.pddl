(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; types as predicates for clarity / verification
    (disk ?d - disk)
    (peg ?p - peg)

    ;; disk support relation: disk is directly on an object (disk or peg)
    (on ?d - disk ?s - object)

    ;; top-of-object: true when there is nothing on top of the object (object = disk or peg)
    (clear ?o - object)

    ;; size-order: (smaller X Y) means disk X is strictly smaller than disk Y
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a disk onto an empty peg (peg must be clear).
  (:action move-to-empty-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)        ;; ?d is directly on ?from
      (clear ?d)           ;; ?d is top of its stack
      (clear ?to)          ;; target peg is empty (top)
      (not (on ?d ?to))    ;; disallow no-op moving to same support
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)        ;; whatever was under ?d becomes top
      (not (clear ?to))    ;; peg now has something on it
      ;; ?d remains clear (top) — preserved by absence of deleting clear ?d
    )
  )

  ;; Move a disk onto another disk (allowed only if moving disk is smaller).
  (:action move-onto-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)         ;; ?d is directly on ?from
      (clear ?d)            ;; ?d is top of its stack
      (clear ?to)           ;; target disk is top of its stack
      (smaller ?d ?to)      ;; size constraint: cannot place larger on smaller
      (not (on ?d ?to))     ;; disallow no-op
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)         ;; whatever was under ?d becomes top
      (not (clear ?to))     ;; target disk is no longer top
      ;; ?d remains clear (top)
    )
  )
)