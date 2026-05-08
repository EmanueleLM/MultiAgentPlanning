(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; direct placement predicates
    (on-peg ?d - disk ?p - peg)    ;; disk ?d is directly on peg ?p
    (on-disk ?d - disk ?d2 - disk) ;; disk ?d is directly on disk ?d2

    ;; top/free markers
    (clear-peg ?p - peg)           ;; peg has no disk directly on it
    (clear-disk ?d - disk)         ;; disk has no disk directly on it

    ;; size order
    (smaller ?d1 ?d2 - disk)

    ;; explicit step control (ordered stages)
    (current-step ?s - step)
    (succ ?s1 ?s2 - step)
  )

  ;; Move a top disk from a peg onto an empty peg
  (:action mover_move_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-peg ?d ?from)          ;; disk is directly on the source peg
      (clear-disk ?d)            ;; disk is top (nothing on top)
      (clear-peg ?to)            ;; destination peg is empty
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source peg becomes clear (the disk was directly on it and is removed)
      (clear-peg ?from)

      ;; destination peg is no longer clear
      (not (clear-peg ?to))

      ;; moved disk is top on its new support
      (clear-disk ?d)

      ;; advance the explicit step counter
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk from a peg onto a top disk (enforce size)
  (:action mover_move_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-peg ?d ?from)          ;; disk is directly on the source peg
      (clear-disk ?d)            ;; disk is top
      (clear-disk ?to)           ;; destination disk is top
      (smaller ?d ?to)           ;; size ordering: moved disk must be smaller
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; source peg becomes clear after removing its top disk
      (clear-peg ?from)

      ;; destination disk is no longer clear (now has ?d on top)
      (not (clear-disk ?to))

      ;; moved disk is top on its new support
      (clear-disk ?d)

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk from a disk onto an empty peg
  (:action mover_move_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-disk ?d ?from)         ;; disk is directly on another disk ?from
      (clear-disk ?d)            ;; disk is top
      (clear-peg ?to)            ;; destination peg is empty
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; the disk that was below becomes clear (nothing on it now)
      (clear-disk ?from)

      ;; destination peg is no longer clear
      (not (clear-peg ?to))

      ;; moved disk is top on its new support
      (clear-disk ?d)

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk from a disk onto another top disk (enforce size)
  (:action mover_move_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-disk ?d ?from)         ;; disk is directly on source disk
      (clear-disk ?d)            ;; disk is top
      (clear-disk ?to)           ;; destination disk is top
      (smaller ?d ?to)           ;; size ordering: moved disk must be smaller
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; the disk that was below becomes clear (nothing on it now)
      (clear-disk ?from)

      ;; destination disk is no longer clear
      (not (clear-disk ?to))

      ;; moved disk is top on its new support
      (clear-disk ?d)

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )
)