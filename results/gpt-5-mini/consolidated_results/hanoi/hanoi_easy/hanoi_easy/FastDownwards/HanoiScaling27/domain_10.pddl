(define (domain hanoi-mover-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    ;; disk d is directly on place p (place is either a peg or another disk)
    (on ?d - disk ?p - place)

    ;; disk is the top disk of its stack (nothing on top of it)
    (top ?d - disk)

    ;; peg is empty (has no disks directly on it)
    (empty ?p - peg)

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ;; discrete stage progression
    (succ ?s1 - stage ?s2 - stage)
    (current-stage ?s - stage)
  )

  ;; Move a top disk that is directly on a peg to another empty peg
  (:action mover-move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (top ?d)
      (empty ?to)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update peg emptiness: destination no longer empty, source becomes empty
      (not (empty ?to))
      (empty ?from)

      ;; moved disk is top on destination (remains top)
      (top ?d)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg onto a top disk (destination disk must be larger)
  (:action mover-move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
    )
    :effect (and
      ;; relocate disk onto disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; destination disk no longer top; source peg becomes empty
      (not (top ?to))
      (empty ?from)

      ;; moved disk becomes top
      (top ?d)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk onto an empty peg
  (:action mover-move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (top ?d)
      (empty ?to)
    )
    :effect (and
      ;; relocate disk to peg
      (not (on ?d ?from))
      (on ?d ?to)

      ;; destination peg no longer empty
      (not (empty ?to))

      ;; disk under becomes top; moved disk is top on destination
      (top ?from)
      (top ?d)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk onto another top disk (order enforced)
  (:action mover-move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
    )
    :effect (and
      ;; relocate disk onto destination disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; destination disk no longer top; disk under source becomes top
      (not (top ?to))
      (top ?from)

      ;; moved disk becomes top
      (top ?d)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)