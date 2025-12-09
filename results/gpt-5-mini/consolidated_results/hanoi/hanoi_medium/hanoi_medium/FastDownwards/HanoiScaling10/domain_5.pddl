(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage - object)

  (:predicates
    ;; disk placement
    (on-peg ?d - disk ?p - peg)      ;; disk directly on a peg
    (on-disk ?d - disk ?under - disk) ;; disk directly on another disk

    ;; peg top and emptiness
    (top ?p - peg ?d - disk)         ;; top disk of a peg
    (peg-empty ?p - peg)

    ;; size ordering (static)
    (smaller ?d1 - disk ?d2 - disk)

    ;; stage/time progression
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk that sits directly on a peg, onto an empty target peg
  (:action move_from_peg_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on-peg ?d ?from)
      (peg-empty ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; source updates: disk removed, source becomes empty, no top there
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (peg-empty ?from)

      ;; target updates: disk now on target peg and is top; target no longer empty
      (on-peg ?d ?to)
      (top ?to ?d)
      (not (peg-empty ?to))
    )
  )

  ;; Move a top disk that sits on another disk, onto an empty target peg
  (:action move_from_disk_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?under - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on-disk ?d ?under)
      (peg-empty ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; remove moving disk relation and its top status
      (not (on-disk ?d ?under))
      (not (top ?from ?d))

      ;; the disk that was under becomes the new top of the source peg
      (top ?from ?under)

      ;; place disk on target peg
      (on-peg ?d ?to)
      (top ?to ?d)
      (not (peg-empty ?to))
    )
  )

  ;; Move a top disk that sits directly on a peg, onto a non-empty target peg (onto top disk ?t)
  (:action move_from_peg_to_nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on-peg ?d ?from)
      (top ?to ?t)
      (smaller ?d ?t)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; remove from-source
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (peg-empty ?from)

      ;; update target: top t is no longer top, d becomes top and is on t
      (not (top ?to ?t))
      (top ?to ?d)
      (on-disk ?d ?t)
    )
  )

  ;; Move a top disk that sits on another disk, onto a non-empty target peg (onto top disk ?t)
  (:action move_from_disk_to_nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?under - disk ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on-disk ?d ?under)
      (top ?to ?t)
      (smaller ?d ?t)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; remove moving disk from its old relation and its top status
      (not (on-disk ?d ?under))
      (not (top ?from ?d))

      ;; the disk that was under becomes the new top of the source peg
      (top ?from ?under)

      ;; update target: previous top t is no longer top; d becomes top and sits on t
      (not (top ?to ?t))
      (top ?to ?d)
      (on-disk ?d ?t)
    )
  )
)