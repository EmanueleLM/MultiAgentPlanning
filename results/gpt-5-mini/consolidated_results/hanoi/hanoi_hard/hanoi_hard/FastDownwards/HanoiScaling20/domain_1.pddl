(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg - support stage)

  (:predicates
    (on ?d - disk ?s - support)        ; immediate support: disk ?d is directly on support ?s (disk or peg)
    (top ?p - peg ?d - disk)          ; ?d is the top-most disk on peg ?p
    (empty ?p - peg)                  ; peg ?p has no disks
    (belongs ?d - disk ?p - peg)      ; disk ?d belongs to peg ?p (its support chain reaches the peg)
    (smaller ?x - disk ?y - disk)     ; disk ?x is strictly smaller than disk ?y
    (succ ?a - stage ?b - stage)      ; stage successor relation
    (at-stage ?s - stage)             ; current stage marker (enforces ordered, single moves)
  )

  ;; Move: disk directly on a peg -> destination peg is empty
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (not (= ?from ?to))
      (top ?from ?d)
      (on ?d ?from)
      (empty ?to)
      (at-stage ?s)
      (succ ?s ?s2)
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

      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move: disk directly on another disk -> destination peg is empty
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (not (= ?from ?to))
      (top ?from ?d)
      (on ?d ?below)
      (belongs ?below ?from)
      (empty ?to)
      (at-stage ?s)
      (succ ?s ?s2)
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

      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move: disk directly on a peg -> destination peg has a top disk (place onto a disk)
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?desttop - disk ?s - stage ?s2 - stage)
    :precondition (and
      (not (= ?from ?to))
      (top ?from ?d)
      (on ?d ?from)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?desttop)

      (not (top ?from ?d))
      (top ?to ?d)
      (not (top ?to ?desttop))

      (empty ?from)
      (not (empty ?to))

      (not (belongs ?d ?from))
      (belongs ?d ?to)

      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move: disk directly on another disk -> destination peg has a top disk (place onto a disk)
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?desttop - disk ?s - stage ?s2 - stage)
    :precondition (and
      (not (= ?from ?to))
      (top ?from ?d)
      (on ?d ?below)
      (belongs ?below ?from)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?desttop)

      (not (top ?from ?d))
      (top ?from ?below)   ; the disk under the moved disk becomes the new top of the source peg

      (not (top ?to ?desttop))
      (top ?to ?d)

      (not (belongs ?d ?from))
      (belongs ?d ?to)

      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)