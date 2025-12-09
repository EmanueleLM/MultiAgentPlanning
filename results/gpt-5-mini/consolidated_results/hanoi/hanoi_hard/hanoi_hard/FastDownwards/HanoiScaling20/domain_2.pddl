(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; direct support relations
    (on-peg ?d - disk ?p - peg)    ; disk ?d is directly on peg ?p
    (on-disk ?d - disk ?d2 - disk) ; disk ?d is directly on disk ?d2

    ;; peg status
    (top ?p - peg ?d - disk)       ; ?d is the top-most disk on peg ?p
    (empty ?p - peg)               ; peg ?p has no disks

    ;; size ordering
    (smaller ?x - disk ?y - disk)  ; ?x is strictly smaller than ?y

    ;; ordered discrete stages for move sequencing
    (succ ?a - stage ?b - stage)
    (at-stage ?s - stage)
  )

  ;; Move: top disk directly on source peg -> destination peg is empty
  (:action move-peg-to-peg-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (not (= ?from ?to))
      (top ?from ?d)
      (on-peg ?d ?from)
      (empty ?to)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; update direct support
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update top markers
      (not (top ?from ?d))
      (top ?to ?d)

      ;; update emptiness flags
      (empty ?from)
      (not (empty ?to))

      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move: top disk directly on source peg -> place onto top disk of destination peg
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?desttop - disk ?s - stage ?s2 - stage)
    :precondition (and
      (not (= ?from ?to))
      (top ?from ?d)
      (on-peg ?d ?from)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; update direct support: now d is on desttop
      (not (on-peg ?d ?from))
      (on-disk ?d ?desttop)

      ;; update source top and emptiness: source had disk directly on peg, so becomes empty
      (not (top ?from ?d))
      (empty ?from)

      ;; update destination top
      (not (top ?to ?desttop))
      (top ?to ?d)
      (not (empty ?to))

      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move: top disk directly on another disk -> destination peg is empty
  (:action move-disk-to-peg-empty
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (not (= ?from ?to))
      (top ?from ?d)
      (on-disk ?d ?below)
      (empty ?to)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; update direct support: d removed from on-disk and placed on destination peg
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; update source top: the disk below becomes the new top of source peg
      (not (top ?from ?d))
      (top ?from ?below)

      ;; update destination top and emptiness
      (top ?to ?d)
      (not (empty ?to))

      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move: top disk directly on another disk -> place onto top disk of destination peg
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?desttop - disk ?s - stage ?s2 - stage)
    :precondition (and
      (not (= ?from ?to))
      (top ?from ?d)
      (on-disk ?d ?below)
      (top ?to ?desttop)
      (smaller ?d ?desttop)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; update direct support: d moved from on-disk(?below) to on-disk(?desttop)
      (not (on-disk ?d ?below))
      (on-disk ?d ?desttop)

      ;; update source top: the disk below becomes the new top of source peg
      (not (top ?from ?d))
      (top ?from ?below)

      ;; update destination top
      (not (top ?to ?desttop))
      (top ?to ?d)

      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)