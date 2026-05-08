(define (domain hanoi-mover)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; adjacency support relations (immediate support)
    (on-peg ?d - disk ?p - peg)        ;; disk is immediately on a peg
    (on-disk ?d - disk ?below - disk) ;; disk is immediately on another disk

    ;; top-of-peg marker: disk ?d is the top (visible) disk of peg ?p
    (top-on ?d - disk ?p - peg)

    ;; peg occupancy
    (empty ?p - peg)

    ;; static size order: true iff first is strictly smaller than second
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit discrete stage progression
    (stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)    ;; immediate successor relation between stages
    (current ?s - stage)              ;; current stage: actions must advance this contiguously
  )

  ;; All move actions advance the explicit current stage to its successor.
  ;; Each action includes a stage pair (?s ?s2) with precondition (next ?s ?s2)
  ;; and the effect of moving current from ?s to ?s2. This enforces contiguous,
  ;; ordered progression: exactly one move per stage and no skipping.

  ;; 1) Move a disk that is directly on the source peg to an empty destination peg.
  (:action move-mover-peg-to-empty
    :parameters (?d - disk ?src - peg ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?src)
      (top-on ?d ?src)
      (empty ?dst)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; remove support from source peg
      (not (on-peg ?d ?src))
      (not (top-on ?d ?src))

      ;; place on destination peg and mark it top there
      (on-peg ?d ?dst)
      (top-on ?d ?dst)

      ;; update peg occupancy
      (not (empty ?dst))
      (empty ?src)
    )
  )

  ;; 2) Move a disk that is directly on the source peg onto the top of disk ?td at destination.
  (:action move-mover-peg-to-disk
    :parameters (?d - disk ?src - peg ?dst - peg ?td - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?src)
      (top-on ?d ?src)
      (top-on ?td ?dst)
      (smaller ?d ?td)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; remove support from source peg
      (not (on-peg ?d ?src))
      (not (top-on ?d ?src))

      ;; place on top of disk ?td at destination
      (on-disk ?d ?td)
      (top-on ?d ?dst)

      ;; update destination topness (td is no longer top)
      (not (top-on ?td ?dst))

      ;; update peg occupancy
      (not (empty ?dst))
      (empty ?src)
    )
  )

  ;; 3) Move a disk that is directly on another disk (?below) to an empty destination peg.
  (:action move-mover-disk-to-empty
    :parameters (?d - disk ?below - disk ?src - peg ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (top-on ?d ?src)
      (empty ?dst)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; remove support relation between the moved disk and its below disk
      (not (on-disk ?d ?below))
      (not (top-on ?d ?src))

      ;; the disk below becomes the new top of the source peg-stack
      (top-on ?below ?src)

      ;; place the moved disk directly on the destination peg
      (on-peg ?d ?dst)
      (top-on ?d ?dst)

      ;; update peg occupancy
      (not (empty ?dst))
      ;; source peg remains non-empty (there is at least ?below)
    )
  )

  ;; 4) Move a disk that is directly on another disk (?below) onto the top of disk ?td at destination.
  (:action move-mover-disk-to-disk
    :parameters (?d - disk ?below - disk ?src - peg ?dst - peg ?td - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (top-on ?d ?src)
      (top-on ?td ?dst)
      (smaller ?d ?td)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; remove old support for moved disk and its top marker at source
      (not (on-disk ?d ?below))
      (not (top-on ?d ?src))

      ;; below disk becomes new top of source stack
      (top-on ?below ?src)

      ;; moved disk is placed on top of ?td at destination
      (on-disk ?d ?td)
      (top-on ?d ?dst)

      ;; update destination topness (td loses top)
      (not (top-on ?td ?dst))

      ;; destination is not empty
      (not (empty ?dst))
    )
  )
)