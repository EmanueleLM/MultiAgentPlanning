(define (domain hanoi3agents20)
  (:requirements :strips :typing)
  (:types disk peg)
  (:predicates
    (at ?d - disk ?p - peg)
    (on ?d1 - disk ?d2 - disk)
    (on-peg ?d - disk ?p - peg)
    (top ?d - disk)
    (clear ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ; move top disk that is directly on a disk to an empty peg
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?u - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d)
      (on ?d ?u)
      (at ?d ?from)
      (at ?u ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?u))
      (top ?u)
      (not (at ?d ?from))
      (at ?d ?to)
      (on-peg ?d ?to)
      (not (clear ?to))
    )
  )

  ; move top disk that is directly on a peg to an empty peg
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d)
      (on-peg ?d ?from)
      (at ?d ?from)
      (clear ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (clear ?from)
      (on-peg ?d ?to)
      (not (clear ?to))
      (not (at ?d ?from))
      (at ?d ?to)
    )
  )

  ; move top disk that is directly on a disk onto another (larger) top disk
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?u - disk ?from - peg ?y - disk ?to - peg)
    :precondition (and
      (top ?d)
      (on ?d ?u)
      (at ?d ?from)
      (at ?u ?from)
      (top ?y)
      (at ?y ?to)
      (smaller ?d ?y)
    )
    :effect (and
      (not (on ?d ?u))
      (top ?u)
      (not (top ?y))
      (on ?d ?y)
      (not (at ?d ?from))
      (at ?d ?to)
    )
  )

  ; move top disk that is directly on a peg onto another (larger) top disk
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?y - disk ?to - peg)
    :precondition (and
      (top ?d)
      (on-peg ?d ?from)
      (at ?d ?from)
      (top ?y)
      (at ?y ?to)
      (smaller ?d ?y)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (clear ?from)
      (not (top ?y))
      (on ?d ?y)
      (not (at ?d ?from))
      (at ?d ?to)
    )
  )
)