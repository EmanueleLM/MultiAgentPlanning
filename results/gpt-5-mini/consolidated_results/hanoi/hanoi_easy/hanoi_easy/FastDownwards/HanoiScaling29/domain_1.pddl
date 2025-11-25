(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk d rests on peg p
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
  ;; We model a single general move action. Every peg has a permanent "base" disk
  ;; at its bottom (a disk object representing the peg base). This ensures that
  ;; every real disk has a disk directly below it (possibly a base), so the
  ;; action can always identify the disk immediately below the moved disk.
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
      ;; identify the disk directly below ?d on the source peg (always exists: maybe a base)
      (above ?d ?below)
      ;; identify the current top disk on the target peg
      (top ?pt ?ttop)
      ;; legality: cannot place a larger disk onto a smaller one
      (smaller ?d ?ttop)
    )
    :effect (and
      ;; update placement
      (not (on ?d ?ps)) (on ?d ?pt)
      ;; update direct-above links: d no longer above its former below, and becomes above the former target-top
      (not (above ?d ?below)) (above ?d ?ttop)
      ;; update top pointers for source: former top removed, new top is the former below disk
      (not (top ?ps ?d)) (top ?ps ?below)
      ;; update top pointers for target: former top replaced by moved disk
      (not (top ?pt ?ttop)) (top ?pt ?d)
      ;; advance step marker
      (not (at-step ?s)) (at-step ?s2)
    )
  )
)