(define (domain hanoi_2agents_20)
  (:requirements :typing :negative-preconditions :strips)
  (:types disk peg object)

  (:predicates
    ;; topology: a disk or peg that a disk is directly on
    (on ?d - disk ?s - object)
    ;; disk has nothing on top
    (clear ?x - object)
    ;; peg is empty (has nothing on top)
    (clear-peg ?p - peg)
    ;; disk size ordering: smaller ?a ?b means ?a is smaller than ?b
    (smaller ?a - disk ?b - disk)
  )

  ;; Generic move action template for agent_1 (moves disks A-J)
  (:action agent_1_move
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      ;; disk must be directly on the from-object and be clear on top
      (on ?d ?from)
      (clear ?d)
      ;; cannot move onto the same object
      (not (on ?d ?to))
      ;; if target is a disk, ensure top target exists and is clear,
      ;; and size constraint (moved disk must be smaller than target disk)
      (or
        (and (not (exists (?td - disk) (on ?td ?to))) ;; target is peg (no disk on it)
             (clear-peg ?to))
        (and (exists (?td - disk) (on ?td ?to))
             (clear ?td)
             (smaller ?d ?td))
      )
    )
    :effect (and
      ;; remove old on relation
      (not (on ?d ?from))
      ;; place on new object or disk
      (on ?d ?to)
      ;; top-of-from becomes clear (if from was a disk, that disk becomes clear; if a peg becomes not empty, works via clear-peg)
      (clear ?from)
      ;; the moved disk remains clear (top)
      (clear ?d)
      ;; the target peg is no longer empty if we placed disk on a peg
      (when (and (not (exists (?td - disk) (on ?td ?to))) (clear-peg ?to))
            (not (clear-peg ?to)))
      ;; if we placed on a disk, that disk is no longer clear
      (when (exists (?td - disk) (on ?td ?to))
            (not (clear ?td)))
    )
  )

  ;; Generic move action template for agent_2 (moves disks K-T)
  (:action agent_2_move
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (not (on ?d ?to))
      (or
        (and (not (exists (?td - disk) (on ?td ?to))) (clear-peg ?to))
        (and (exists (?td - disk) (on ?td ?to))
             (clear ?td)
             (smaller ?d ?td))
      )
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (clear ?d)
      (when (and (not (exists (?td - disk) (on ?td ?to))) (clear-peg ?to))
            (not (clear-peg ?to)))
      (when (exists (?td - disk) (on ?td ?to))
            (not (clear ?td)))
    )
  )
)