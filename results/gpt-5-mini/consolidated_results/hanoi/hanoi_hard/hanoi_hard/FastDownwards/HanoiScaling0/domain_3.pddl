(define (domain hanoi6)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg base step)

  (:predicates
    (peg-base ?p - peg ?b - base)

    ;; support relations
    (on-disk ?d - disk ?under - disk)
    (on-base ?d - disk ?b - base)

    ;; peg membership
    (at ?d - disk ?p - peg)

    ;; clear/top markers
    (clear-disk ?d - disk)
    (clear-base ?b - base)

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ;; step control
    (current ?s - step)
    (succ ?s1 - step ?s2 - step)

    ;; allowed move for a particular step
    (allowed-move ?s - step ?d - disk ?from - peg ?to - peg)
  )

  ;; Move a top disk that is currently on another disk to an empty peg (destination base).
  (:action move-disk-from-disk-to-empty
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?below - disk ?base-to - base)
    :precondition (and
      (current ?s) (succ ?s ?s2)
      (allowed-move ?s ?d ?from ?to)

      ;; disk is on source peg and top
      (at ?d ?from)
      (clear-disk ?d)

      ;; disk supported by another disk on same source peg
      (on-disk ?d ?below)
      (at ?below ?from)

      ;; destination peg has a base and is empty
      (peg-base ?to ?base-to)
      (clear-base ?base-to)
    )
    :effect (and
      ;; advance step
      (not (current ?s)) (current ?s2)

      ;; disk moves pegs
      (not (at ?d ?from)) (at ?d ?to)

      ;; update support relations
      (not (on-disk ?d ?below)) (on-base ?d ?base-to)

      ;; the disk that lost its top becomes clear
      (clear-disk ?below)

      ;; destination base no longer clear
      (not (clear-base ?base-to))
    )
  )

  ;; Move a top disk that is currently on the source base to an empty destination peg (destination base).
  (:action move-disk-from-base-to-empty
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?from-base - base ?to-base - base)
    :precondition (and
      (current ?s) (succ ?s ?s2)
      (allowed-move ?s ?d ?from ?to)

      (at ?d ?from)
      (clear-disk ?d)

      (on-base ?d ?from-base)
      (peg-base ?from ?from-base)

      (peg-base ?to ?to-base)
      (clear-base ?to-base)
    )
    :effect (and
      (not (current ?s)) (current ?s2)

      (not (at ?d ?from)) (at ?d ?to)

      (not (on-base ?d ?from-base)) (on-base ?d ?to-base)

      ;; source base becomes clear
      (clear-base ?from-base)

      ;; destination base no longer clear
      (not (clear-base ?to-base))
    )
  )

  ;; Move a top disk that is currently on another disk onto another disk (destination top disk).
  (:action move-disk-from-disk-to-disk
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?below - disk ?destTop - disk)
    :precondition (and
      (current ?s) (succ ?s ?s2)
      (allowed-move ?s ?d ?from ?to)

      (at ?d ?from)
      (clear-disk ?d)

      (on-disk ?d ?below)
      (at ?below ?from)

      (at ?destTop ?to)
      (clear-disk ?destTop)
      (smaller ?d ?destTop)
    )
    :effect (and
      (not (current ?s)) (current ?s2)

      (not (at ?d ?from)) (at ?d ?to)

      (not (on-disk ?d ?below)) (on-disk ?d ?destTop)

      ;; destination top no longer clear
      (not (clear-disk ?destTop))

      ;; the disk that lost its top becomes clear
      (clear-disk ?below)
    )
  )

  ;; Move a top disk that is currently on the source base onto a destination disk.
  (:action move-disk-from-base-to-disk
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?from-base - base ?destTop - disk)
    :precondition (and
      (current ?s) (succ ?s ?s2)
      (allowed-move ?s ?d ?from ?to)

      (at ?d ?from)
      (clear-disk ?d)

      (on-base ?d ?from-base)
      (peg-base ?from ?from-base)

      (at ?destTop ?to)
      (clear-disk ?destTop)
      (smaller ?d ?destTop)
    )
    :effect (and
      (not (current ?s)) (current ?s2)

      (not (at ?d ?from)) (at ?d ?to)

      (not (on-base ?d ?from-base)) (on-disk ?d ?destTop)

      ;; destination top no longer clear
      (not (clear-disk ?destTop))

      ;; source base becomes clear
      (clear-base ?from-base)
    )
  )
)