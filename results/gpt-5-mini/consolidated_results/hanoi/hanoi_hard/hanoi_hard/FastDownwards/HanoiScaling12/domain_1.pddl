(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage - object)

  (:predicates
    ;; type markers
    (disk ?d - disk)
    (peg ?p - peg)
    (stage ?s - stage)

    ;; stage progression
    (next ?s1 - stage ?s2 - stage)
    (at-stage ?s - stage)

    ;; disk support relation: disk is directly on an object (disk, peg)
    (on ?d - disk ?s - object)

    ;; top-of-object: true when nothing is on top of the object (object = disk or peg)
    (clear ?o - object)

    ;; size-order: (smaller X Y) means disk X strictly smaller than disk Y
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg, advancing from one stage to the next.
  (:action move-to-peg
    :parameters (?d - disk ?from - object ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?snext)
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
      (not (at-stage ?s))
      (at-stage ?snext)
    )
  )

  ;; Move a top disk onto another top disk (allowed only if moving disk is smaller),
  ;; advancing from one stage to the next.
  (:action move-onto-disk
    :parameters (?d - disk ?from - object ?to - disk ?s - stage ?snext - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?snext)
      (on ?d ?from)        ;; ?d is directly on ?from
      (clear ?d)           ;; ?d is top of its stack
      (clear ?to)          ;; target disk is top of its stack
      (smaller ?d ?to)     ;; size constraint: cannot place larger on smaller
      (not (on ?d ?to))    ;; disallow no-op
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)        ;; whatever was under ?d becomes top
      (not (clear ?to))    ;; target disk is no longer top
      (not (at-stage ?s))
      (at-stage ?snext)
    )
  )
)