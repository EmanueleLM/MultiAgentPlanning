(define (domain hanoi)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (disk ?d)
    (peg ?p)
    (on ?x ?y)          ; ?x is directly on ?y (where ?y is a disk or a peg)
    (clear ?x)          ; nothing is on top of ?x (applies to disks and pegs)
    (empty ?p)          ; peg ?p has no disks
    (smaller ?d1 ?d2)   ; disk ?d1 is smaller than disk ?d2
  )

  ;; Move a disk that is directly on a disk onto another disk
  (:action move-disk-from-disk-to-disk
    :parameters (?d ?from ?to)
    :precondition (and
      (disk ?d) (disk ?from) (disk ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; Move a disk that is directly on a disk onto an empty peg
  (:action move-disk-from-disk-to-peg
    :parameters (?d ?from ?to)
    :precondition (and
      (disk ?d) (disk ?from) (peg ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)     ; peg ?to currently empty (top is clear)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
      (not (empty ?to))
    )
  )

  ;; Move a disk that is directly on a peg onto another disk
  (:action move-disk-from-peg-to-disk
    :parameters (?d ?from ?to)
    :precondition (and
      (disk ?d) (peg ?from) (disk ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
      (empty ?from)
    )
  )

  ;; Move a disk that is directly on a peg onto an empty peg
  (:action move-disk-from-peg-to-peg
    :parameters (?d ?from ?to)
    :precondition (and
      (disk ?d) (peg ?from) (peg ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
      (empty ?from)
      (not (empty ?to))
    )
  )
)