(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk stage)

  (:predicates
    ;; support relation: disk is immediately on a peg or on another disk
    (on ?d - disk ?p - object)
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

  ;; All move actions require and consume a single current stage and advance it to the unique successor.
  ;; This enforces exactly one move per stage and a strictly forward progression, preventing oscillation
  ;; or post-hoc "fixup" actions.

  ;; Case 1: disk ?d sits directly on peg ?from; move it to an empty peg ?to
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on ?d ?from)
      (empty ?to)
      (clear ?d)
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; support change
      (not (on ?d ?from))
      (on ?d ?to)

      ;; top bookkeeping
      (not (top ?from ?d))
      (top ?to ?d)

      ;; peg emptiness updates
      (empty ?from)
      (not (empty ?to))

      ;; d remains clear (nothing on d)
      (clear ?d)
    )
  )

  ;; Case 2: disk ?d sits on another disk ?below which (with ?below) is on peg ?from;
  ;; move ?d to an empty peg ?to. ?below becomes the new top of ?from.
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on ?d ?below)
      (empty ?to)
      (clear ?d)
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; support change
      (not (on ?d ?below))
      (on ?d ?to)

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

  ;; Case 3: disk ?d sits on peg ?from; move it onto top disk ?t on peg ?to.
  ;; Enforce size constraint smaller ?d ?t.
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on ?d ?from)
      (top ?to ?t)
      (clear ?d)
      (smaller ?d ?t)
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; support change
      (not (on ?d ?from))
      (on ?d ?t)

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

  ;; Case 4: disk ?d sits on disk ?below on peg ?from; move onto disk ?t which is top on peg ?to.
  ;; Enforce size constraint smaller ?d ?t. After move, ?below becomes top of ?from and is clear.
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on ?d ?below)
      (top ?to ?t)
      (clear ?d)
      (smaller ?d ?t)
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; support change
      (not (on ?d ?below))
      (on ?d ?t)

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