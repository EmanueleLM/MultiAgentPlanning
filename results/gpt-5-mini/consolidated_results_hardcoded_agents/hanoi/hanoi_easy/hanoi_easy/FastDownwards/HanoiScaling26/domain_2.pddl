(define (domain hanoi_orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk stage)

  (:predicates
    ; Temporal control
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)

    ; Physical state at the current stage (no explicit time index; stage advanced via current/next)
    (top ?p - peg ?d - disk)       ; ?d is the top disk on peg ?p
    (empty ?p - peg)              ; peg has no disks
    (on ?d - disk ?p - peg)       ; ?d is directly on peg ?p (i.e., bottom disk on that peg)
    (on-disk ?u - disk ?v - disk) ; ?u is directly on top of disk ?v
    (smaller ?u - disk ?v - disk) ; static size relation: ?u is smaller than ?v
  )

  ; Move a top disk that is directly on a peg to an empty destination peg.
  (:action move_from_peg_to_empty
    :parameters (?d - disk ?src - peg ?dst - peg ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (top ?src ?d)
      (on ?d ?src)
      (empty ?dst)
      (not (= ?src ?dst))
    )
    :effect (and
      ; advance time-stage
      (not (current ?s1))
      (current ?s2)

      ; remove disk from source peg
      (not (top ?src ?d))
      (not (on ?d ?src))

      ; update destination peg
      (not (empty ?dst))
      (on ?d ?dst)
      (top ?dst ?d)

      ; source peg becomes empty (disk was directly on peg)
      (empty ?src)
    )
  )

  ; Move a top disk that is directly on a peg to a non-empty destination peg (onto disk ?z).
  (:action move_from_peg_to_nonempty
    :parameters (?d - disk ?src - peg ?dst - peg ?z - disk ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (top ?src ?d)
      (on ?d ?src)
      (top ?dst ?z)
      (smaller ?d ?z)
      (not (= ?src ?dst))
    )
    :effect (and
      ; advance time-stage
      (not (current ?s1))
      (current ?s2)

      ; remove disk from source peg
      (not (top ?src ?d))
      (not (on ?d ?src))

      ; place disk on top of disk ?z at destination
      (not (top ?dst ?z))
      (on-disk ?d ?z)
      (top ?dst ?d)

      ; source peg becomes empty (disk was directly on peg)
      (empty ?src)
    )
  )

  ; Move a top disk that is on another disk to an empty destination peg.
  (:action move_from_disk_to_empty
    :parameters (?d - disk ?below - disk ?src - peg ?dst - peg ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (top ?src ?d)
      (on-disk ?d ?below)
      (empty ?dst)
      (not (= ?src ?dst))
    )
    :effect (and
      ; advance time-stage
      (not (current ?s1))
      (current ?s2)

      ; remove moved disk from source
      (not (top ?src ?d))
      (not (on-disk ?d ?below))

      ; the disk below becomes top on source peg
      (top ?src ?below)

      ; place moved disk on empty destination peg
      (not (empty ?dst))
      (on ?d ?dst)
      (top ?dst ?d)
    )
  )

  ; Move a top disk that is on another disk to a non-empty destination peg (onto disk ?z).
  (:action move_from_disk_to_nonempty
    :parameters (?d - disk ?below - disk ?src - peg ?dst - peg ?z - disk ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (top ?src ?d)
      (on-disk ?d ?below)
      (top ?dst ?z)
      (smaller ?d ?z)
      (not (= ?src ?dst))
    )
    :effect (and
      ; advance time-stage
      (not (current ?s1))
      (current ?s2)

      ; remove moved disk from source
      (not (top ?src ?d))
      (not (on-disk ?d ?below))

      ; the disk below becomes top on source peg
      (top ?src ?below)

      ; place moved disk on top of disk ?z at destination
      (not (top ?dst ?z))
      (on-disk ?d ?z)
      (top ?dst ?d)
    )
  )
)