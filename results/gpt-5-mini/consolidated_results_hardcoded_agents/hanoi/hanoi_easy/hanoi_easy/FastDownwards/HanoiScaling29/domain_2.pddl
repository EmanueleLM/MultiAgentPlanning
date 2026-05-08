(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk ?d rests on peg ?p
    (on ?d - disk ?p - peg)
    ;; direct above relation: ?d is directly above ?d2 (i.e., ?d rests on ?d2)
    (above ?d - disk ?d2 - disk)
    ;; which disk is currently top on a peg
    (top ?p - peg ?d - disk)
    ;; current time-step marker
    (at-step ?s - step)
    ;; successor relation for steps
    (succ ?s - step ?s2 - step)
    ;; disk size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move the top disk from one peg to another peg.
  ;; Each move advances the global step marker from a step s to its successor s2.
  (:action move
    :parameters (?s ?s2 - step
                 ?d ?below ?ttop - disk
                 ?ps ?pt - peg)
    :precondition (and
      (at-step ?s)
      (succ ?s ?s2)
      ;; the disk to move is the top of the source peg and is on that peg
      (top ?ps ?d)
      (on ?d ?ps)
      ;; the disk directly below the moved disk on the source peg (always exists: could be a base)
      (above ?d ?below)
      ;; identify the current top disk on the target peg (could be a base)
      (top ?pt ?ttop)
      ;; legality: moved disk must be strictly smaller than the current top on target
      (smaller ?d ?ttop)
      ;; source and target pegs must be different
      (not (= ?ps ?pt))
    )
    :effect (and
      ;; update placement of moved disk
      (not (on ?d ?ps)) (on ?d ?pt)

      ;; update direct-above links: moved disk no longer above its former below, and becomes above the former target-top
      (not (above ?d ?below)) (above ?d ?ttop)

      ;; update top pointers: source loses its top, its new top is the former below disk
      (not (top ?ps ?d)) (top ?ps ?below)
      ;; target loses its former top pointer and the moved disk becomes the new top
      (not (top ?pt ?ttop)) (top ?pt ?d)

      ;; advance the global step marker
      (not (at-step ?s)) (at-step ?s2)
    )
  )
)