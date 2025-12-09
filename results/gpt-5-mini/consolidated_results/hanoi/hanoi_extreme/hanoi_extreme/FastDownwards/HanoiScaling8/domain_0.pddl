(define (domain hanoi-mover)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; Support relations
    (on-peg ?d - disk ?p - peg)       ;; disk is immediately on peg
    (on-disk ?d - disk ?below - disk) ;; disk is immediately on another disk

    ;; Topness: a disk is the visible/top disk of its peg-stack
    (top ?d - disk)
    (top-on ?d - disk ?p - peg)       ;; disk ?d is the top disk of peg ?p

    ;; Peg occupancy
    (empty ?p - peg)

    ;; Static size order: true iff first is strictly smaller than second
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move actions implemented without conditional effects.
  ;; We separate cases to keep preconditions/effects STRIPS-only and to
  ;; explicitly maintain all auditor-mandated invariants (top, on-*, empty).
  ;; Action names are prefixed with "move-mover" to indicate the mover agent.

  ;; 1) Source: disk directly on peg; Destination: empty peg.
  (:action move-mover-peg-to-empty
    :parameters (?d - disk ?src - peg ?dst - peg)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d)
      (top-on ?d ?src)
      (empty ?dst)
      (not (= ?src ?dst))
    )
    :effect (and
      ;; remove support from source peg
      (not (on-peg ?d ?src))
      (not (top-on ?d ?src))

      ;; place on destination peg and make it the top there
      (on-peg ?d ?dst)
      (top-on ?d ?dst)

      ;; update peg occupancy
      (not (empty ?dst))
      (empty ?src)

      ;; maintain top-fluents: ?d remains top (now on dst)
      (top ?d)
    )
  )

  ;; 2) Source: disk directly on peg; Destination: peg with at least one disk (top ?td).
  (:action move-mover-peg-to-disk
    :parameters (?d - disk ?src - peg ?dst - peg ?td - disk)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d)
      (top-on ?d ?src)
      (top ?td)
      (top-on ?td ?dst)
      (smaller ?d ?td)
      (not (= ?src ?dst))
    )
    :effect (and
      ;; remove support from source peg
      (not (on-peg ?d ?src))
      (not (top-on ?d ?src))

      ;; place on top of disk ?td at destination
      (on-disk ?d ?td)
      (top-on ?d ?dst)

      ;; update topness at destination
      (not (top ?td))
      (not (top-on ?td ?dst))

      ;; source peg becomes empty (since ?d was directly on peg and top)
      (empty ?src)
      (not (empty ?dst))

      ;; maintain top for moved disk
      (top ?d)
    )
  )

  ;; 3) Source: disk directly on another disk (?below); Destination: empty peg.
  (:action move-mover-disk-to-empty
    :parameters (?d - disk ?below - disk ?src - peg ?dst - peg)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d)
      (top-on ?d ?src)
      (empty ?dst)
      (not (= ?src ?dst))
    )
    :effect (and
      ;; remove support relation between the moved disk and its below disk
      (not (on-disk ?d ?below))
      (not (top-on ?d ?src))

      ;; the disk below becomes the new top of the source peg-stack
      (top-on ?below ?src)
      (top ?below)

      ;; place the moved disk directly on the destination peg
      (on-peg ?d ?dst)
      (top-on ?d ?dst)
      (not (empty ?dst))

      ;; maintain top for moved disk
      (top ?d)
    )
  )

  ;; 4) Source: disk directly on another disk (?below); Destination: non-empty peg (top ?td).
  (:action move-mover-disk-to-disk
    :parameters (?d - disk ?below - disk ?src - peg ?dst - peg ?td - disk)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d)
      (top-on ?d ?src)
      (top ?td)
      (top-on ?td ?dst)
      (smaller ?d ?td)
      (not (= ?src ?dst))
    )
    :effect (and
      ;; remove old support for moved disk and its top-on marking
      (not (on-disk ?d ?below))
      (not (top-on ?d ?src))

      ;; below disk becomes new top of source stack
      (top-on ?below ?src)
      (top ?below)

      ;; moved disk is placed on top of ?td at destination
      (on-disk ?d ?td)
      (top-on ?d ?dst)

      ;; update destination topness
      (not (top ?td))
      (not (top-on ?td ?dst))
      (not (empty ?dst))

      ;; maintain top for moved disk
      (top ?d)
    )
  )
)