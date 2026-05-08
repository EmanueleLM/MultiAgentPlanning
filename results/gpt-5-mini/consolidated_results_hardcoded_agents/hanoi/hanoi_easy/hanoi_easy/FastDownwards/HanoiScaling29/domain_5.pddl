(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk ?d rests directly on disk ?x (where ?x may be a base disk)
    (above ?d - disk ?x - disk)
    ;; disk ?d is located on peg ?p
    (on ?d - disk ?p - peg)
    ;; which disk is currently top on a peg
    (top ?p - peg ?d - disk)
    ;; current time-step marker
    (at-step ?s - step)
    ;; successor relation for steps (ordered stages)
    (succ ?s - step ?s2 - step)
    ;; disk size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move the top disk from source peg ?ps to target peg ?pt,
  ;; advancing the global step marker from ?s to its successor ?s2.
  (:action move
    :parameters (?s ?s2 - step
                 ?d ?below ?ttop - disk
                 ?ps ?pt - peg)
    :precondition (and
      (at-step ?s)
      (succ ?s ?s2)

      ;; the disk to move is the top of the source peg and resides on that peg
      (top ?ps ?d)
      (on ?d ?ps)

      ;; the disk directly below the moved disk on the source peg (could be a base)
      (above ?d ?below)
      (on ?below ?ps)

      ;; identify the current top disk on the target peg (could be a base) and it must be on that peg
      (top ?pt ?ttop)
      (on ?ttop ?pt)

      ;; legality: moved disk must be strictly smaller than the current top on target
      (smaller ?d ?ttop)
    )
    :effect (and
      ;; advance the global step marker
      (not (at-step ?s)) (at-step ?s2)

      ;; update placement of moved disk
      (not (on ?d ?ps)) (on ?d ?pt)

      ;; update direct-above link for moved disk: remove old below and set new below to former target top
      (not (above ?d ?below)) (above ?d ?ttop)

      ;; update top pointers: source peg top becomes the disk that was below the moved disk
      (not (top ?ps ?d)) (top ?ps ?below)

      ;; target peg: remove its former top pointer and set moved disk as new top
      (not (top ?pt ?ttop)) (top ?pt ?d)
    )
  )
)