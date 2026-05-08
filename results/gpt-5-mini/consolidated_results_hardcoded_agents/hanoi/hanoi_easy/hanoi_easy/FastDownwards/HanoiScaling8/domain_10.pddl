(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg time)

  (:predicates
    ;; location relations
    (on-peg ?d - disk ?p - peg)    ; disk ?d is directly on peg ?p
    (on-disk ?d - disk ?u - disk)  ; disk ?d is directly on top of disk ?u

    ;; topness / emptiness
    (clear-disk ?d - disk)         ; no disk is on top of ?d (so ?d is the topmost on its stack)
    (clear-peg ?p - peg)           ; no disk is on peg ?p (peg top is empty)

    ;; static size ordering (smaller x y means x is strictly smaller than y)
    (smaller ?x - disk ?y - disk)

    ;; discrete time / stage control
    (current ?t - time)
    (succ ?t - time ?s - time)
  )

  ;; Move a top disk that is directly on an empty peg onto another empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?t - time ?s - time)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)       ; ?d must be topmost
      (clear-peg ?to)       ; destination peg must be empty
      (current ?t)
      (succ ?t ?s)
    )
    :effect (and
      ;; relocate disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source peg becomes empty
      (clear-peg ?from)

      ;; destination peg is no longer empty
      (not (clear-peg ?to))

      ;; moved disk remains topmost
      (clear-disk ?d)

      ;; advance time
      (not (current ?t))
      (current ?s)
    )
  )

  ;; Move a top disk that is directly on an empty peg onto the top of another top disk.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?t - time ?s - time)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)       ; ?d must be topmost
      (clear-disk ?to)      ; target disk must be topmost
      (smaller ?d ?to)      ; size constraint
      (current ?t)
      (succ ?t ?s)
    )
    :effect (and
      ;; relocate disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; source peg becomes empty
      (clear-peg ?from)

      ;; target disk is no longer topmost
      (not (clear-disk ?to))
      ;; moved disk is topmost
      (clear-disk ?d)

      ;; advance time
      (not (current ?t))
      (current ?s)
    )
  )

  ;; Move a top disk that is directly on another disk onto an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?t - time ?s - time)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)       ; ?d must be topmost
      (clear-peg ?to)       ; destination peg must be empty
      (current ?t)
      (succ ?t ?s)
    )
    :effect (and
      ;; relocate disk
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; the disk that was below ?d becomes topmost
      (clear-disk ?from)

      ;; destination peg is no longer empty
      (not (clear-peg ?to))

      ;; moved disk is topmost
      (clear-disk ?d)

      ;; advance time
      (not (current ?t))
      (current ?s)
    )
  )

  ;; Move a top disk that is directly on another disk onto the top of another top disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?t - time ?s - time)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)       ; ?d must be topmost
      (clear-disk ?to)      ; target disk must be topmost
      (smaller ?d ?to)      ; size constraint
      (current ?t)
      (succ ?t ?s)
    )
    :effect (and
      ;; relocate disk
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; the disk that was below ?d becomes topmost
      (clear-disk ?from)

      ;; target disk is no longer topmost; moved disk becomes topmost
      (not (clear-disk ?to))
      (clear-disk ?d)

      ;; advance time
      (not (current ?t))
      (current ?s)
    )
  )
)