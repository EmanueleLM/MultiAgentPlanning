(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; disk ?d is directly on ?x (x can be a disk or a peg)
    (on ?d - disk ?x - object)
    ;; nothing is on top of ?x (x is a peg or a disk)
    (clear ?x - object)
    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; optional type markers
    (is-disk ?d - disk)
    (is-peg ?p - peg)
  )

  ;; Move a top disk from a peg to another empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on ?d ?from)    ;; disk ?d is directly on peg ?from (so it's the top disk on that peg)
      (clear ?d)       ;; nothing on top of the disk
      (clear ?to)      ;; destination peg is empty (clear)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)    ;; source peg becomes clear (disk moved off it)
      (not (clear ?to)) ;; destination peg is no longer clear
    )
  )

  ;; Move a top disk from a peg onto a larger disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (on ?d ?from)     ;; disk ?d is directly on peg ?from
      (clear ?d)        ;; disk is top
      (clear ?to)       ;; target disk has nothing on top
      (smaller ?d ?to)  ;; cannot place larger on smaller: ?d must be smaller than target disk ?to
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a top disk from on top of a disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on ?d ?from)    ;; disk ?d is directly on disk ?from (so ?d is top)
      (clear ?d)       ;; nothing on top of ?d
      (clear ?to)      ;; destination peg is empty
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)    ;; the disk that ?d was on becomes clear
      (not (clear ?to))
    )
  )

  ;; Move a top disk from on top of a disk onto a larger disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on ?d ?from)    ;; ?d is directly on disk ?from
      (clear ?d)       ;; top disk
      (clear ?to)      ;; target disk has nothing on top
      (smaller ?d ?to) ;; size constraint
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)