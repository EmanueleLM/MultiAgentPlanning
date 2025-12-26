(define (domain hanoi-5-disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg
  )

  (:predicates
    (on ?d1 - disk ?d2 - disk)     ; d1 is immediately on d2
    (on-peg ?d - disk ?p - peg)    ; d is the disk resting directly on peg p (bottom disk)
    (clear ?d - disk)              ; d has nothing on top of it
    (empty ?p - peg)               ; p has no disks on it
    (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
  )

  ; -------------------------
  ; Action 1: Disk D from D1 to D2 (Moving between two stacked disks)
  ; -------------------------
  (:action move-disk-dd
    :parameters (?d - disk ?d1 - disk ?d2 - disk ?p_from - peg ?p_to - peg)
    :precondition (and
      (clear ?d)
      (on ?d ?d1)
      (clear ?d2)
      (smaller ?d ?d2) ; Size constraint: D must be smaller than D2
      (not (= ?p_from ?p_to))
    )
    :effect (and
      (not (on ?d ?d1))
      (on ?d ?d2)
      (clear ?d1)
      (not (clear ?d2))
    )
  )

  ; -------------------------
  ; Action 2: Disk D from D1 to Peg P2 (Moving onto an empty peg)
  ; -------------------------
  (:action move-disk-dp
    :parameters (?d - disk ?d1 - disk ?p_from - peg ?p_to - peg)
    :precondition (and
      (clear ?d)
      (on ?d ?d1)
      (empty ?p_to)
      (not (= ?p_from ?p_to))
    )
    :effect (and
      (not (on ?d ?d1))
      (on-peg ?d ?p_to)
      (clear ?d1)
      (not (empty ?p_to))
    )
  )

  ; -------------------------
  ; Action 3: Disk D from Peg P1 to D2 (Moving off the base onto a disk)
  ; -------------------------
  (:action move-disk-pd
    :parameters (?d - disk ?d2 - disk ?p_from - peg ?p_to - peg)
    :precondition (and
      (clear ?d)
      (on-peg ?d ?p_from)
      (clear ?d2)
      (smaller ?d ?d2) ; Size constraint: D must be smaller than D2
      (not (= ?p_from ?p_to))
    )
    :effect (and
      (not (on-peg ?d ?p_from))
      (on ?d ?d2)
      (empty ?p_from)
      (not (clear ?d2))
    )
  )

  ; -------------------------
  ; Action 4: Disk D from Peg P1 to Peg P2 (Moving from base to base)
  ; -------------------------
  (:action move-disk-pp
    :parameters (?d - disk ?p_from - peg ?p_to - peg)
    :precondition (and
      (clear ?d)
      (on-peg ?d ?p_from)
      (empty ?p_to)
      (not (= ?p_from ?p_to))
    )
    :effect (and
      (not (on-peg ?d ?p_from))
      (on-peg ?d ?p_to)
      (empty ?p_from)
      (not (empty ?p_to))
    )
  )
)