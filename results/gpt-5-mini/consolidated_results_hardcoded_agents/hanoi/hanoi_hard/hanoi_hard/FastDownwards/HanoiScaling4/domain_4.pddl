(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk stage)

  (:predicates
    ;; disk directly on a peg
    (on-peg ?d - disk ?p - peg)
    ;; disk directly on another disk
    (on-disk ?d - disk ?below - disk)

    ;; top-of-peg: the given disk is the topmost disk on the given peg
    (top ?peg - peg ?d - disk)
    ;; peg empty marker
    (empty ?peg - peg)
    ;; a disk has nothing on it (it is clear / top of a stack or alone)
    (clear ?d - disk)
    ;; static size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; stage/time control: current stage and successor relation between stages
    (current ?s - stage)
    (next ?s - stage ?s2 - stage)
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
      (top ?from ?d)
      (on-peg ?d ?from)
      (empty ?to)
      (clear ?d)
      ;; ensure distinct pegs
      (not (= ?from ?to))
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; support change
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; top bookkeeping
      (not (top ?from ?d))
      (top ?to ?d)

      ;; peg emptiness updates
      (empty ?from)
      (not (empty ?to))

      ;; clear updates (d remains clear)
      (clear ?d)
    )
  )

  ;; Move a top disk that is on another disk to an empty peg.
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
      (top ?from ?d)
      (on-disk ?d ?below)
      (empty ?to)
      (clear ?d)
      ;; ensure distinct pegs
      (not (= ?from ?to))
      ;; sanity: d and below are different
      (not (= ?d ?below))
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; support change
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; top updates
      (not (top ?from ?d))
      (top ?from ?below)
      (top ?to ?d)

      ;; peg emptiness updates
      (not (empty ?to))

      ;; clear updates
      (clear ?below)
      (clear ?d)
    )
  )

  ;; Move a top disk that is directly on a peg onto the top disk ?t of another peg.
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
      (top ?from ?d)
      (on-peg ?d ?from)
      (top ?to ?t)
      (clear ?d)
      (smaller ?d ?t)
      ;; ensure distinct pegs and disks
      (not (= ?from ?to))
      (not (= ?d ?t))
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; support change
      (not (on-peg ?d ?from))
      (on-disk ?d ?t)

      ;; top and empty updates
      (not (top ?from ?d))
      (empty ?from)

      (not (top ?to ?t))
      (top ?to ?d)

      ;; t no longer clear (now has d on it)
      (not (clear ?t))

      ;; d remains clear (nothing on d)
      (clear ?d)
    )
  )

  ;; Move a top disk that is on another disk onto the top disk ?t of another peg.
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
      (top ?from ?d)
      (on-disk ?d ?below)
      (top ?to ?t)
      (clear ?d)
      (smaller ?d ?t)
      ;; ensure distinct pegs and disks
      (not (= ?from ?to))
      (not (= ?d ?t))
      (not (= ?d ?below))
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; support change
      (not (on-disk ?d ?below))
      (on-disk ?d ?t)

      ;; top updates
      (not (top ?from ?d))
      (top ?from ?below)

      (not (top ?to ?t))
      (top ?to ?d)

      ;; clear updates
      (not (clear ?t))
      (clear ?below)
      (clear ?d)
    )
  )
)