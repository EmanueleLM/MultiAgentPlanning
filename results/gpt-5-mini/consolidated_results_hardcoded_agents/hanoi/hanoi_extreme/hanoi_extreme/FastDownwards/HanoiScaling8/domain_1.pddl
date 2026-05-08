(define (domain hanoi-mover)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; support relations
    (on-peg ?d - disk ?p - peg)        ;; disk is immediately on a peg
    (on-disk ?d - disk ?below - disk) ;; disk is immediately on another disk

    ;; topness: a disk is the visible/top disk of its peg-stack
    (top ?d - disk)
    (top-on ?d - disk ?p - peg)       ;; disk ?d is the top disk of peg ?p

    ;; peg occupancy
    (empty ?p - peg)

    ;; static size order: true iff first is strictly smaller than second
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit discrete stage progression
    (stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)    ;; immediate successor relation between stages
    (current ?s - stage)              ;; the planner must progress current stage contiguously
  )

  ;; All move actions advance the explicit current stage to its successor.
  ;; Each action includes the stage pair (?s ?s2) with precondition (next ?s ?s2)
  ;; and the effect of moving current from ?s to ?s2. This enforces contiguous,
  ;; ordered progression: one move per stage and no skipping.

  ;; 1) Move: disk directly on source peg -> destination empty peg.
  (:action move-mover-peg-to-empty
    :parameters (?d - disk ?src - peg ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d)
      (top-on ?d ?src)
      (empty ?dst)
      (not (= ?src ?dst))
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

      ;; place on destination peg and make it the top there
      (on-peg ?d ?dst)
      (top-on ?d ?dst)

      ;; update peg occupancy
      (not (empty ?dst))
      (empty ?src)

      ;; maintain top-fluent for moved disk
      (top ?d)
    )
  )

  ;; 2) Move: disk directly on source peg -> on top of disk ?td at destination.
  (:action move-mover-peg-to-disk
    :parameters (?d - disk ?src - peg ?dst - peg ?td - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?src)
      (top ?d)
      (top-on ?d ?src)
      (top ?td)
      (top-on ?td ?dst)
      (smaller ?d ?td)
      (not (= ?src ?dst))
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

      ;; update topness at destination
      (not (top ?td))
      (not (top-on ?td ?dst))

      ;; source peg becomes empty (since ?d was directly on peg)
      (empty ?src)
      (not (empty ?dst))

      ;; maintain top for moved disk
      (top ?d)
    )
  )

  ;; 3) Move: disk directly on another disk (?below) -> destination empty peg.
  (:action move-mover-disk-to-empty
    :parameters (?d - disk ?below - disk ?src - peg ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d)
      (top-on ?d ?src)
      (empty ?dst)
      (not (= ?src ?dst))
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
      (top ?below)

      ;; place the moved disk directly on the destination peg
      (on-peg ?d ?dst)
      (top-on ?d ?dst)
      (not (empty ?dst))

      ;; maintain top for moved disk
      (top ?d)
    )
  )

  ;; 4) Move: disk directly on another disk (?below) -> on top of disk ?td at destination.
  (:action move-mover-disk-to-disk
    :parameters (?d - disk ?below - disk ?src - peg ?dst - peg ?td - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d)
      (top-on ?d ?src)
      (top ?td)
      (top-on ?td ?dst)
      (smaller ?d ?td)
      (not (= ?src ?dst))
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

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