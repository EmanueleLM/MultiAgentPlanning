(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; direct support relations
    (on-peg ?d - disk ?p - peg)    ; ?d is directly on peg ?p
    (on-disk ?d - disk ?b - disk)  ; ?d is directly on disk ?b

    ;; top/clear predicates
    (clear-disk ?d - disk)         ; no disk directly on ?d
    (clear-peg ?p - peg)           ; no disk directly on ?p (peg empty)

    ;; size ordering
    (smaller ?a - disk ?b - disk)  ; ?a is strictly smaller than ?b

    ;; explicit stage/time progression
    (next ?s - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; Move a top disk from a peg to another peg (destination peg empty)
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; relocate disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update clearness: the peg we removed from becomes empty,
      ;; the destination peg becomes non-empty
      (clear-peg ?from)
      (not (clear-peg ?to))

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from a peg onto a disk (destination disk must be clear and larger)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; peg becomes empty after removing its directly supported disk
      (clear-peg ?from)

      ;; destination disk now has a disk on top -> not clear
      (not (clear-disk ?to))

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from on top of a disk onto an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; the disk that supported ?d becomes clear
      (clear-disk ?from)

      ;; destination peg is now non-empty
      (not (clear-peg ?to))

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from on top of a disk onto another disk (destination disk clear and larger)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; the old supporter becomes clear
      (clear-disk ?from)

      ;; destination disk now has a disk on top
      (not (clear-disk ?to))

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)