(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?d2 - disk)
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)
    (current ?s - step)
    (succ ?s1 - step ?s2 - step)
  )

  ;; Move top disk that is directly on a peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?s - step ?d - disk ?from - peg ?to - peg ?next - step)
    :precondition (and
                    (current ?s)
                    (on-peg ?d ?from)
                    (clear-disk ?d)
                    (clear-peg ?to)
                    (succ ?s ?next)
                  )
    :effect (and
              (not (on-peg ?d ?from))
              (on-peg ?d ?to)
              (not (clear-peg ?to))
              (clear-peg ?from)
              ;; disk remains top after move
              (clear-disk ?d)
              (not (current ?s))
              (current ?next)
            )
  )

  ;; Move top disk that is directly on a peg onto another disk (must be smaller)
  (:action move-peg-to-disk
    :parameters (?s - step ?d - disk ?from - peg ?tod - disk ?next - step)
    :precondition (and
                    (current ?s)
                    (on-peg ?d ?from)
                    (clear-disk ?d)
                    (clear-disk ?tod)
                    (smaller ?d ?tod)
                    (succ ?s ?next)
                  )
    :effect (and
              (not (on-peg ?d ?from))
              (on-disk ?d ?tod)
              (not (clear-disk ?tod))
              (clear-peg ?from)
              ;; disk becomes top on the target
              (clear-disk ?d)
              (not (current ?s))
              (current ?next)
            )
  )

  ;; Move top disk that is on another disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?s - step ?d - disk ?fromd - disk ?to - peg ?next - step)
    :precondition (and
                    (current ?s)
                    (on-disk ?d ?fromd)
                    (clear-disk ?d)
                    (clear-peg ?to)
                    (succ ?s ?next)
                  )
    :effect (and
              (not (on-disk ?d ?fromd))
              (on-peg ?d ?to)
              (not (clear-peg ?to))
              ;; the disk below becomes top
              (clear-disk ?fromd)
              ;; moved disk remains top at its new location
              (clear-disk ?d)
              (not (current ?s))
              (current ?next)
            )
  )

  ;; Move top disk that is on another disk onto another disk (must be smaller)
  (:action move-disk-to-disk
    :parameters (?s - step ?d - disk ?fromd - disk ?tod - disk ?next - step)
    :precondition (and
                    (current ?s)
                    (on-disk ?d ?fromd)
                    (clear-disk ?d)
                    (clear-disk ?tod)
                    (smaller ?d ?tod)
                    (succ ?s ?next)
                  )
    :effect (and
              (not (on-disk ?d ?fromd))
              (on-disk ?d ?tod)
              (not (clear-disk ?tod))
              ;; the disk below becomes top
              (clear-disk ?fromd)
              ;; moved disk is top at its new location
              (clear-disk ?d)
              (not (current ?s))
              (current ?next)
            )
  )
)