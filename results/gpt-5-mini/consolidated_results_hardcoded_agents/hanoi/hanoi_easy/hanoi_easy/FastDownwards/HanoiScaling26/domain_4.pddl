(define (domain hanoi_orchestrated)
  (:requirements :typing :strips :negative-preconditions)
  (:types peg disk stage)

  (:predicates
    ;; temporal control
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)

    ;; physical state
    (top ?p - peg ?d - disk)       ; ?d is the top disk on peg ?p
    (empty ?p - peg)              ; peg has no disks
    (on ?d - disk ?p - peg)       ; ?d is directly on peg ?p (bottom disk)
    (on-disk ?u - disk ?v - disk) ; ?u is directly on top of disk ?v
    (smaller ?u - disk ?v - disk) ; static size relation
  )

  ;; Move a disk that is directly on the source peg (it is both top and directly on the peg)
  ;; to an empty destination peg.
  (:action move_from_peg_to_empty
    :parameters (?d - disk ?src - peg ?dst - peg ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (top ?src ?d)
      (on ?d ?src)
      (empty ?dst)
    )
    :effect (and
      ;; advance time-stage
      (not (current ?s1))
      (current ?s2)

      ;; remove disk from source peg (it was directly on the peg)
      (not (top ?src ?d))
      (not (on ?d ?src))

      ;; source peg becomes empty
      (empty ?src)

      ;; place disk on destination peg
      (not (empty ?dst))
      (on ?d ?dst)
      (top ?dst ?d)
    )
  )

  ;; Move a disk that is directly on the source peg to a non-empty destination peg (onto disk ?z).
  (:action move_from_peg_to_nonempty
    :parameters (?d - disk ?src - peg ?dst - peg ?z - disk ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (top ?src ?d)
      (on ?d ?src)
      (top ?dst ?z)
      (smaller ?d ?z)
    )
    :effect (and
      ;; advance time-stage
      (not (current ?s1))
      (current ?s2)

      ;; remove disk from source peg (it was directly on the peg)
      (not (top ?src ?d))
      (not (on ?d ?src))

      ;; source peg becomes empty
      (empty ?src)

      ;; place disk on top of disk ?z at destination
      (not (top ?dst ?z))
      (on-disk ?d ?z)
      (top ?dst ?d)
    )
  )

  ;; Move a disk that is on top of another disk to an empty destination peg.
  (:action move_from_disk_to_empty
    :parameters (?d - disk ?below - disk ?src - peg ?dst - peg ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (top ?src ?d)
      (on-disk ?d ?below)
      (empty ?dst)
    )
    :effect (and
      ;; advance time-stage
      (not (current ?s1))
      (current ?s2)

      ;; remove moved disk from source
      (not (top ?src ?d))
      (not (on-disk ?d ?below))

      ;; the disk below becomes top on source peg
      (top ?src ?below)

      ;; place moved disk on empty destination peg
      (not (empty ?dst))
      (on ?d ?dst)
      (top ?dst ?d)
    )
  )

  ;; Move a disk that is on top of another disk to a non-empty destination peg (onto disk ?z).
  (:action move_from_disk_to_nonempty
    :parameters (?d - disk ?below - disk ?src - peg ?dst - peg ?z - disk ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (top ?src ?d)
      (on-disk ?d ?below)
      (top ?dst ?z)
      (smaller ?d ?z)
    )
    :effect (and
      ;; advance time-stage
      (not (current ?s1))
      (current ?s2)

      ;; remove moved disk from source
      (not (top ?src ?d))
      (not (on-disk ?d ?below))

      ;; the disk below becomes top on source peg
      (top ?src ?below)

      ;; place moved disk on top of disk ?z at destination
      (not (top ?dst ?z))
      (on-disk ?d ?z)
      (top ?dst ?d)
    )
  )
)