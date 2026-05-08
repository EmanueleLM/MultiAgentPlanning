(define (domain hanoi6)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg base step)

  (:predicates
    (peg-base ?p - peg ?b - base)

    ;; position relations: a disk is immediately on another disk or on a base
    (on-disk ?d - disk ?under - disk)
    (on-base ?d - disk ?b - base)

    ;; which peg a disk currently sits on (topological membership)
    (at ?d - disk ?p - peg)

    ;; whether a disk or base has nothing on top of it
    (clear-disk ?d - disk)
    (clear-base ?b - base)

    ;; size ordering (static facts)
    (smaller ?d1 - disk ?d2 - disk)

    ;; planned-step control: which step is currently active and successor links
    (current ?s - step)
    (succ ?s1 - step ?s2 - step)

    ;; maps a step to the unique permitted move (enforces the exact audited sequence)
    (allowed-move ?s - step ?d - disk ?from - peg ?to - peg)
  )

  ;; Move a top disk when the destination peg is empty (destination base is clear).
  (:action move-to-empty-from-disk
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?below - disk ?base-to - base)
    :precondition (and
      (current ?s) (succ ?s ?s2)
      (allowed-move ?s ?d ?from ?to)

      ;; disk is on source peg and top
      (at ?d ?from)
      (clear-disk ?d)

      ;; support relation and support is on the same source peg
      (on-disk ?d ?below)
      (at ?below ?from)

      ;; destination peg has a base and that base is clear (peg empty)
      (peg-base ?to ?base-to)
      (clear-base ?base-to)
    )
    :effect (and
      (not (current ?s)) (current ?s2)

      ;; update disk location from source peg to destination peg
      (not (at ?d ?from)) (at ?d ?to)

      ;; update the support relation: no longer on the source disk, now on the destination base
      (not (on-disk ?d ?below)) (on-base ?d ?base-to)

      ;; source-under (disk) becomes clear (it lost the disk on top)
      (clear-disk ?below)

      ;; destination base is no longer clear (it now has a disk on it)
      (not (clear-base ?base-to))
    )
  )

  (:action move-to-empty-from-base
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?belowb - base ?base-to - base)
    :precondition (and
      (current ?s) (succ ?s ?s2)
      (allowed-move ?s ?d ?from ?to)

      ;; disk at source peg and top
      (at ?d ?from)
      (clear-disk ?d)

      ;; disk is on the source base and the base belongs to the source peg
      (on-base ?d ?belowb)
      (peg-base ?from ?belowb)

      ;; destination peg base and it's clear
      (peg-base ?to ?base-to)
      (clear-base ?base-to)
    )
    :effect (and
      (not (current ?s)) (current ?s2)

      ;; move disk from source peg to destination peg
      (not (at ?d ?from)) (at ?d ?to)

      ;; update support relation: remove old base support, set new base support
      (not (on-base ?d ?belowb)) (on-base ?d ?base-to)

      ;; source base becomes clear
      (clear-base ?belowb)

      ;; destination base no longer clear
      (not (clear-base ?base-to))
    )
  )

  ;; Move a top disk onto another disk (destination top disk must be larger).
  (:action move-onto-disk-from-disk
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?below - disk ?destTop - disk)
    :precondition (and
      (current ?s) (succ ?s ?s2)
      (allowed-move ?s ?d ?from ?to)

      ;; disk at source peg and top
      (at ?d ?from)
      (clear-disk ?d)

      ;; disk is on another disk and that supporting disk is at the same source peg
      (on-disk ?d ?below)
      (at ?below ?from)

      ;; destination top disk at destination peg and is clear, larger than moved disk
      (at ?destTop ?to)
      (clear-disk ?destTop)
      (smaller ?d ?destTop)
    )
    :effect (and
      (not (current ?s)) (current ?s2)

      ;; move the disk between pegs
      (not (at ?d ?from)) (at ?d ?to)

      ;; update support relations: remove old support, place on top of destTop
      (not (on-disk ?d ?below)) (on-disk ?d ?destTop)

      ;; destTop is no longer clear (it now has a disk on top)
      (not (clear-disk ?destTop))

      ;; the disk that was under the moved disk becomes clear
      (clear-disk ?below)
    )
  )

  (:action move-onto-disk-from-base
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?belowb - base ?destTop - disk)
    :precondition (and
      (current ?s) (succ ?s ?s2)
      (allowed-move ?s ?d ?from ?to)

      ;; disk at source peg and top
      (at ?d ?from)
      (clear-disk ?d)

      ;; disk supported by source base and base belongs to the source peg
      (on-base ?d ?belowb)
      (peg-base ?from ?belowb)

      ;; destination top disk at destination peg and is clear, larger than moved disk
      (at ?destTop ?to)
      (clear-disk ?destTop)
      (smaller ?d ?destTop)
    )
    :effect (and
      (not (current ?s)) (current ?s2)

      ;; move disk to destination peg
      (not (at ?d ?from)) (at ?d ?to)

      ;; update support relations: remove old base support, place on top of destTop
      (not (on-base ?d ?belowb)) (on-disk ?d ?destTop)

      ;; destTop is no longer clear
      (not (clear-disk ?destTop))

      ;; source base becomes clear
      (clear-base ?belowb)
    )
  )

)