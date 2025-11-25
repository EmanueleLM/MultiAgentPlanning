(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    (on ?d - disk ?p - place)        ; ?d is directly on ?p (p is a disk or a peg)
    (top ?peg - peg ?d - disk)      ; ?d is the topmost disk on ?peg
    (empty ?peg - peg)              ; peg has no disks
    (curr ?s - stage)               ; current stage
    (next ?s - stage ?s2 - stage)   ; successor-stage relation
    (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
  )

  ;; Four move actions cover all combinations of support/target being peg or disk.
  ;; Each action enforces: moved disk is top on source, target is either empty or has a top disk
  ;; smaller than the moved disk; stage advancement enforces exactly one move per stage.

  ;; 1) source support is a disk (u), target peg is empty
  (:action move_from_disk_to_empty
    :parameters (?d - disk ?from - peg ?u - disk ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (top ?from ?d)
      (on ?d ?u)
      (empty ?to)
      (curr ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (on ?d ?u))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?from ?u)
      (not (empty ?to))
      (top ?to ?d)
      (not (curr ?s))
      (curr ?snext)
    )
  )

  ;; 2) source support is a disk (u), target support is a disk (topp)
  (:action move_from_disk_to_disk
    :parameters (?d - disk ?from - peg ?u - disk ?to - peg ?topp - disk ?s - stage ?snext - stage)
    :precondition (and
      (top ?from ?d)
      (on ?d ?u)
      (top ?to ?topp)
      (smaller ?d ?topp)
      (curr ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (on ?d ?u))
      (on ?d ?topp)
      (not (top ?from ?d))
      (top ?from ?u)
      (not (top ?to ?topp))
      (top ?to ?d)
      (not (curr ?s))
      (curr ?snext)
    )
  )

  ;; 3) source support is the peg (d directly on peg), target peg is empty
  (:action move_from_peg_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (top ?from ?d)
      (on ?d ?from)
      (empty ?to)
      (curr ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?from ?d))
      (empty ?from)
      (not (empty ?to))
      (top ?to ?d)
      (not (curr ?s))
      (curr ?snext)
    )
  )

  ;; 4) source support is the peg (d directly on peg), target support is a disk (topp)
  (:action move_from_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?topp - disk ?s - stage ?snext - stage)
    :precondition (and
      (top ?from ?d)
      (on ?d ?from)
      (top ?to ?topp)
      (smaller ?d ?topp)
      (curr ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?topp)
      (not (top ?from ?d))
      (empty ?from)
      (not (top ?to ?topp))
      (top ?to ?d)
      (not (curr ?s))
      (curr ?snext)
    )
  )
)