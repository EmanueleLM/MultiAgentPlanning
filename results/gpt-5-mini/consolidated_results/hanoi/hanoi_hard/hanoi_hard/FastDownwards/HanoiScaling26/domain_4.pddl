(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk-on-disk and disk-on-peg represent immediate support relations
    (on-disk ?d - disk ?s - disk)
    (on-peg  ?d - disk ?p - peg)

    ;; clear predicates for supports
    (clear-disk ?d - disk)
    (clear-peg  ?p - peg)

    ;; static size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; discrete stage successor relation and current stage marker
    (succ ?t1 - stage ?t2 - stage)
    (current ?t - stage)
  )

  ;; Move a top disk from a peg to another peg (peg -> peg).
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      ;; relocate disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; destination peg no longer clear, source peg becomes clear
      (not (clear-peg ?to))
      (clear-peg ?from)

      ;; moved disk remains topmost
      (clear-disk ?d)

      ;; advance stage
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from a disk to a peg (disk -> peg).
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      ;; relocate disk
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; destination peg no longer clear, support-disk becomes clear
      (not (clear-peg ?to))
      (clear-disk ?from)

      ;; moved disk remains topmost
      (clear-disk ?d)

      ;; advance stage
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from a peg onto a disk (peg -> disk), enforcing size ordering.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      ;; relocate disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; destination disk no longer clear, source peg becomes clear
      (not (clear-disk ?to))
      (clear-peg ?from)

      ;; moved disk remains topmost
      (clear-disk ?d)

      ;; advance stage
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from a disk onto another disk (disk -> disk), enforcing size ordering.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      ;; relocate disk
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; destination disk no longer clear, support-disk becomes clear
      (not (clear-disk ?to))
      (clear-disk ?from)

      ;; moved disk remains topmost
      (clear-disk ?d)

      ;; advance stage
      (not (current ?t))
      (current ?t2)
    )
  )
)