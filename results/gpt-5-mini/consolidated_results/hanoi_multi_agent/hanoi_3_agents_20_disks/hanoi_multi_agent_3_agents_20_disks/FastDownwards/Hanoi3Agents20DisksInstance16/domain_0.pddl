(define (domain hanoi_three_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support agent) ;; disk and peg are subtypes of support
  (:predicates
    (top ?s - support ?d - disk)        ;; ?d is directly on support ?s (support is peg or disk)
    (no-child ?s - support)             ;; support ?s has no disk directly on it
    (permitted ?a - agent ?d - disk)    ;; agent ?a is permitted to move disk ?d
    (smaller ?d1 - disk ?d2 - disk)     ;; ?d1 is smaller than ?d2 (can be placed on ?d2)
  )

  ;; Move a top disk that has a disk directly beneath it, onto an empty peg.
  (:action move-with-below-to-empty
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?beneath - disk)
    :precondition (and
      (top ?from ?d)
      (top ?d ?beneath)
      (no-child ?to)
      (permitted ?a ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (top ?d ?beneath))
      (top ?from ?beneath)    ;; the disk that was beneath now becomes the top of the source support
      (top ?to ?d)            ;; moved disk becomes top of destination peg
      (not (no-child ?to))
      (no-child ?d)           ;; moved disk now has no child directly beneath it
    )
  )

  ;; Move a top disk that has a disk directly beneath it, onto another disk (non-empty peg).
  (:action move-with-below-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?beneath - disk ?dstTop - disk)
    :precondition (and
      (top ?from ?d)
      (top ?d ?beneath)
      (top ?to ?dstTop)
      (smaller ?d ?dstTop)
      (permitted ?a ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (not (top ?d ?beneath))
      (top ?from ?beneath)    ;; beneath becomes top of source
      (not (top ?to ?dstTop))
      (top ?to ?d)            ;; moved disk becomes top on destination
      (top ?d ?dstTop)        ;; previous top of destination now is directly on moved disk
      (not (no-child ?d))     ;; moved disk now has a child beneath it
    )
  )

  ;; Move a top disk that has no disk beneath it (it was the only disk on its support), to an empty peg.
  (:action move-no-below-to-empty
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?from ?d)
      (no-child ?d)
      (no-child ?to)
      (permitted ?a ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (no-child ?from)       ;; source becomes empty
      (top ?to ?d)           ;; moved disk becomes top of destination peg
      (not (no-child ?to))
      ;; moved disk still has no child (no-child ?d remains true)
    )
  )

  ;; Move a top disk that has no disk beneath it, onto another disk (non-empty peg).
  (:action move-no-below-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?dstTop - disk)
    :precondition (and
      (top ?from ?d)
      (no-child ?d)
      (top ?to ?dstTop)
      (smaller ?d ?dstTop)
      (permitted ?a ?d)
    )
    :effect (and
      (not (top ?from ?d))
      (no-child ?from)       ;; source becomes empty
      (not (top ?to ?dstTop))
      (top ?to ?d)           ;; moved disk becomes top of destination peg
      (top ?d ?dstTop)       ;; previous top now is directly on moved disk
      (not (no-child ?d))    ;; moved disk now has a child beneath it
    )
  )
)