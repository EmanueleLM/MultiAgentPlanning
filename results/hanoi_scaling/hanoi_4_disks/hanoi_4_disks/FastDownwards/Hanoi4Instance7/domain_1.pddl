(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk d is located on peg p (somewhere in that peg's stack)
    (on ?d - disk ?p - peg)

    ;; ?d is the top disk of peg ?p
    (top ?d - disk ?p - peg)

    ;; ?d is the bottom disk of peg ?p (no disk below it)
    (bottom ?d - disk ?p - peg)

    ;; peg is empty (no disks)
    (empty ?p - peg)

    ;; ?d1 is immediately above ?d2 on the same peg
    (above ?d1 - disk ?d2 - disk)

    ;; ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk that has a disk below it (so source remains non-empty)
  ;; to an empty destination peg.
  (:action move-with-below-to-empty
    :parameters (?d - disk ?b - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (above ?d ?b)        ;; disk b is immediately below d on source
      (empty ?to)          ;; destination empty
    )
    :effect (and
      ;; relocate d
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update top markers
      (not (top ?d ?from))
      (top ?d ?to)

      ;; source: b becomes new top, remove adjacency d->b
      (top ?b ?from)
      (not (above ?d ?b))

      ;; destination no longer empty; d is both top and bottom there
      (not (empty ?to))
      (bottom ?d ?to)
    )
  )

  ;; Move a top disk that has a disk below it to a non-empty destination peg.
  (:action move-with-below-to-nonempty
    :parameters (?d - disk ?b - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (above ?d ?b)        ;; d has a disk b directly below it at source
      (top ?t ?to)         ;; t is the current top disk at destination
      (smaller ?d ?t)      ;; size constraint: d must be smaller than dest top
    )
    :effect (and
      ;; relocate d
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update top markers
      (not (top ?d ?from))
      (top ?d ?to)

      ;; destination: previous top is no longer top; it becomes immediately below d
      (not (top ?t ?to))
      (above ?d ?t)

      ;; source updates: disk below becomes the new top; remove adjacency d->b
      (top ?b ?from)
      (not (above ?d ?b))
    )
  )

  ;; Move a top disk that is also the bottom disk (only disk on its peg)
  ;; to an empty destination peg.
  (:action move-only-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (bottom ?d ?from)    ;; d is sole disk on source
      (empty ?to)          ;; destination empty
    )
    :effect (and
      ;; relocate d
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update top markers
      (not (top ?d ?from))
      (top ?d ?to)

      ;; source becomes empty and loses bottom marker
      (empty ?from)
      (not (bottom ?d ?from))

      ;; destination now non-empty; d is bottom there
      (not (empty ?to))
      (bottom ?d ?to)
    )
  )

  ;; Move a top disk that is also the bottom disk (only disk on its peg)
  ;; to a non-empty destination peg.
  (:action move-only-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (on ?d ?from)
      (top ?d ?from)
      (bottom ?d ?from)    ;; d is sole disk on source
      (top ?t ?to)         ;; t is the current top at destination (so destination non-empty)
      (smaller ?d ?t)      ;; size ordering constraint
    )
    :effect (and
      ;; relocate d
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update top markers
      (not (top ?d ?from))
      (top ?d ?to)

      ;; destination updates: previous top is no longer top and becomes below d
      (not (top ?t ?to))
      (above ?d ?t)

      ;; source becomes empty and loses bottom marker
      (empty ?from)
      (not (bottom ?d ?from))
    )
  )
)