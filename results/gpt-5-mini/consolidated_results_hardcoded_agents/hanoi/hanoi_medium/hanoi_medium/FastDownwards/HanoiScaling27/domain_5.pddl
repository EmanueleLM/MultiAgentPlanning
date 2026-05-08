(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; immediate-on relations: ?d is directly on disk ?s (immediately above)
    (on-disk ?d - disk ?s - disk)

    ;; disk is on some peg
    (on-peg  ?d - disk ?p - peg)

    ;; top-of-peg and peg emptiness
    (top   ?d - disk ?p - peg)       ; ?d is the top disk on peg ?p
    (empty ?p - peg)                 ; peg ?p has no disks

    ;; whether a disk has a disk directly under it
    (has-support ?d - disk)          ; ?d has another disk directly beneath it

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)  ; ?d1 is smaller than ?d2

    ;; explicit stage progression control
    (current-stage ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  ;; Move the top disk that is the only disk on its source peg (no support)
  ;; to an empty destination peg.
  (:action move_single_from_peg_to_empty_peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
      (not (has-support ?d))   ;; no disk under ?d on source peg
    )
    :effect (and
      ;; stage progression
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; remove disk ?d from source peg
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ;; source peg becomes empty
      (empty ?from)

      ;; place disk on destination peg as top (single disk)
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))

      ;; disk on peg top has no disk beneath it
      (not (has-support ?d))
    )
  )

  ;; Move the top disk that is the only disk on its source peg onto the top disk of a non-empty destination peg.
  (:action move_single_from_peg_onto_disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?below ?to)
      (on-peg ?below ?to)
      (smaller ?d ?below)        ; cannot place larger on smaller
      (not (has-support ?d))     ; no disk under ?d on source peg
      (not (= ?from ?to))
    )
    :effect (and
      ;; stage progression
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; remove from source peg
      (not (on-peg ?d ?from))
      (not (top ?d ?from))

      ;; source peg becomes empty (was single-disk)
      (empty ?from)

      ;; attach onto destination disk ?below and update tops
      (on-disk ?d ?below)
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (top ?below ?to))

      ;; destination peg is not empty
      (not (empty ?to))

      ;; moved disk now has support (sits on disk ?below)
      (has-support ?d)
    )
  )

  ;; Move the top disk that sits on another disk (?below) to an empty destination peg.
  (:action move_top_disk_from_stack_to_empty_peg
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-disk ?d ?below)
      (on-peg ?d ?from)
      (on-peg ?below ?from)
      (has-support ?d)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      ;; stage progression
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; detach moved disk from disk below
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (not (on-peg ?d ?from))

      ;; moved disk is now on destination peg and top there
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))

      ;; moved disk now has no support (sits on peg)
      (not (has-support ?d))

      ;; if a disk was below, it becomes the new top on the source peg
      (top ?below ?from)
    )
  )

  ;; Move the top disk that sits on another disk (?below) onto the top disk (?t) of the destination peg.
  (:action move_top_disk_from_stack_onto_disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-disk ?d ?below)
      (on-peg ?d ?from)
      (on-peg ?below ?from)
      (top ?t ?to)
      (on-peg ?t ?to)
      (smaller ?d ?t)
      (has-support ?d)
      (not (= ?from ?to))
    )
    :effect (and
      ;; stage progression
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; detach moved disk from disk below on source
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (not (on-peg ?d ?from))

      ;; moved disk is now directly on disk ?t and top on that peg
      (on-disk ?d ?t)
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (top ?t ?to))

      ;; moved disk now has support (the disk ?t beneath it)
      (has-support ?d)

      ;; the disk that was below becomes the new top on the source peg
      (top ?below ?from)

      ;; destination peg is not empty
      (not (empty ?to))
    )
  )
)