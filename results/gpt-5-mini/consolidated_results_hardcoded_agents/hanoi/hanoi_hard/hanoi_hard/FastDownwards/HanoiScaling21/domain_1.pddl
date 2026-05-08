(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg - place
    place
  )

  (:predicates
    ;; a disk is located directly on a place (either a peg or another disk)
    (on ?d - disk ?p - place)
    ;; a place (peg or disk) has nothing on top of it (is top)
    (clear ?p - place)
    ;; static ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Actions attributable to the mover agent (prefix "mover-")
  ;; Move a top disk onto an empty peg
  (:action mover-move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)        ;; ?d is currently directly on ?from
      (clear ?d)           ;; ?d is top of its stack (nothing above)
      (clear ?to)          ;; target peg is empty at top
      (not (on ?d ?to))    ;; trivial prevention of no-op (not already on target)
    )
    :effect (and
      (not (on ?d ?from))  ;; remove old location
      (on ?d ?to)          ;; set new location
      (not (clear ?to))    ;; target is no longer clear (occupied by ?d)
      (clear ?from)        ;; the place below becomes clear (peg or disk)
    )
  )

  ;; Move a top disk onto another disk (enforce size ordering)
  (:action mover-move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)        ;; ?d is currently directly on ?from
      (clear ?d)           ;; ?d is top of its stack (nothing above)
      (clear ?to)          ;; target disk is top (nothing above it)
      (smaller ?d ?to)     ;; size ordering: ?d must be strictly smaller than ?to
      (not (on ?d ?to))    ;; prevent no-op
    )
    :effect (and
      (not (on ?d ?from))  ;; remove old location
      (on ?d ?to)          ;; set new location (on top of ?to)
      (not (clear ?to))    ;; target disk now has something on it
      (clear ?from)        ;; the place below becomes clear (peg or disk)
    )
  )
)