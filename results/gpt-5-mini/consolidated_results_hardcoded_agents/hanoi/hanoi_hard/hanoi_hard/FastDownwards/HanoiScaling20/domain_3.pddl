(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)      ; disk ?d is directly on peg ?p
    (on-disk ?d - disk ?d2 - disk)   ; disk ?d is directly on disk ?d2
    (top ?p - peg ?d - disk)         ; ?d is the top-most disk on peg ?p
    (empty ?p - peg)                 ; peg ?p has no disks
    (smaller ?x - disk ?y - disk)    ; ?x is strictly smaller than ?y
    (succ ?a - stage ?b - stage)     ; ordered stage successor
    (at-stage ?s - stage)            ; current stage marker
  )

  ;; Move a top disk that is directly on the source peg to an empty destination peg.
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
      ;; update support relations
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update top markers and emptiness
      (not (top ?from ?d))
      (top ?to ?d)
      (empty ?from)
      (not (empty ?to))

      ;; advance stage marker
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on the source peg onto the top disk of the destination peg.
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
      ;; update support relations
      (not (on-peg ?d ?from))
      (on-disk ?d ?desttop)

      ;; update source top and emptiness (was directly on peg -> becomes empty)
      (not (top ?from ?d))
      (empty ?from)

      ;; update destination top
      (not (top ?to ?desttop))
      (top ?to ?d)
      (not (empty ?to))

      ;; advance stage marker
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty destination peg.
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
      ;; update support relations
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; update source top: disk below becomes new top
      (not (top ?from ?d))
      (top ?from ?below)

      ;; update destination top and emptiness
      (top ?to ?d)
      (not (empty ?to))

      ;; advance stage marker
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk onto the top disk of the destination peg.
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
      ;; update support relations
      (not (on-disk ?d ?below))
      (on-disk ?d ?desttop)

      ;; update source top: disk below becomes new top
      (not (top ?from ?d))
      (top ?from ?below)

      ;; update destination top
      (not (top ?to ?desttop))
      (top ?to ?d)

      ;; advance stage marker
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)