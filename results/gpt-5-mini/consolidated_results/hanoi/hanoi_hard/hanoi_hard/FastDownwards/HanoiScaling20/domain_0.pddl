(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg - support)
  (:predicates
    (on ?d - disk ?s - support)        ; immediate support: disk ?d is directly on support ?s (disk or peg)
    (top ?p - peg ?d - disk)          ; ?d is the top-most disk on peg ?p
    (empty ?p - peg)                  ; peg ?p has no disks
    (belongs ?d - disk ?p - peg)      ; disk ?d belongs to peg ?p (its chain of supports reaches ?p)
    (smaller ?x - disk ?y - disk)     ; disk ?x is strictly smaller than disk ?y
    (hand_free)                       ; (optional) single hand resource to serialize moves if concurrency is allowed
  )

  ;; Move a top disk that is directly supported by a peg => destination is an empty peg
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (not (= ?from ?to))
      (top ?from ?d)
      (on ?d ?from)
      (empty ?to)
      (hand_free)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?to ?d)
      (empty ?from)
      (not (empty ?to))
      (not (belongs ?d ?from))
      (belongs ?d ?to)
    )
  )

  ;; Move a top disk that is directly supported by a disk => destination is an empty peg
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (not (= ?from ?to))
      (top ?from ?d)
      (on ?d ?below)
      (belongs ?below ?from)
      (empty ?to)
      (hand_free)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?from ?below)   ; the disk below becomes the new top of the source peg
      (top ?to ?d)
      (not (empty ?to))
      (not (belongs ?d ?from))
      (belongs ?d ?to)
    )
  )

  ;; Move a top disk that is directly supported by a peg => destination has a top disk (place onto a disk)
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?desttop - disk)
    :precondition (and
      (not (= ?from ?to))
      (top ?from ?d)
      (on ?d ?from)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
      (hand_free)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?desttop)
      (not (top ?from ?d))
      (top ?to ?d)
      (not (top ?to ?desttop))
      (empty ?from)
      (not (belongs ?d ?from))
      (belongs ?d ?to)
    )
  )

  ;; Move a top disk that is directly supported by a disk => destination has a top disk (place onto a disk)
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?desttop - disk)
    :precondition (and
      (not (= ?from ?to))
      (top ?from ?d)
      (on ?d ?below)
      (belongs ?below ?from)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
      (hand_free)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?desttop)
      (not (top ?from ?d))
      (top ?from ?below)   ; the disk under the moved disk becomes the new top of the source peg
      (top ?to ?d)
      (not (top ?to ?desttop))
      (not (belongs ?d ?from))
      (belongs ?d ?to)
    )
  )
)