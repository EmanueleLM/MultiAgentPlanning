(define (domain pddl_orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ; direct support relations:
    (on-peg ?d - disk ?p - peg)        ; ?d is directly on peg ?p (no disk under it)
    (on-disk ?d - disk ?under - disk)  ; ?d is directly on disk ?under

    ; top-of-peg: disk that is currently the top of a peg
    (top ?d - disk ?p - peg)

    ; peg empty marker (true exactly when there are no disks on that peg)
    (empty ?p - peg)

    ; size ordering: smaller ?small ?big is true iff ?small is strictly smaller than ?big
    (smaller ?small - disk ?big - disk)
  )

  ; Move a disk that is directly on a peg to an empty peg.
  (:action move-peg-to-empty
    :parameters (?d - disk ?pfrom - peg ?pto - peg)
    :precondition (and
      (on-peg ?d ?pfrom)
      (top ?d ?pfrom)
      (empty ?pto)
    )
    :effect (and
      (not (on-peg ?d ?pfrom))
      (on-peg ?d ?pto)

      (not (top ?d ?pfrom))
      (top ?d ?pto)

      (not (empty ?pto))
      (empty ?pfrom)
    )
  )

  ; Move a disk that is directly on a peg to a peg whose top is disk ?t (must be larger).
  (:action move-peg-to-nonempty
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?t - disk)
    :precondition (and
      (on-peg ?d ?pfrom)
      (top ?d ?pfrom)
      (top ?t ?pto)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on-peg ?d ?pfrom))
      (on-disk ?d ?t)

      (not (top ?t ?pto))
      (top ?d ?pto)

      (not (top ?d ?pfrom))
      (empty ?pfrom)
    )
  )

  ; Move a disk that is directly on another disk (?under) to an empty peg.
  (:action move-disk-to-empty
    :parameters (?d - disk ?under - disk ?pfrom - peg ?pto - peg)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?pfrom)
      (empty ?pto)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-peg ?d ?pto)

      (not (top ?d ?pfrom))
      (top ?d ?pto)

      ; the disk under becomes the new top of the source peg
      (top ?under ?pfrom)

      (not (empty ?pto))
    )
  )

  ; Move a disk that is directly on another disk (?under) to a peg whose top is disk ?t (must be larger).
  (:action move-disk-to-nonempty
    :parameters (?d - disk ?under - disk ?pfrom - peg ?pto - peg ?t - disk)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?pfrom)
      (top ?t ?pto)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-disk ?d ?t)

      (not (top ?t ?pto))
      (top ?d ?pto)

      (not (top ?d ?pfrom))
      (top ?under ?pfrom)
    )
  )
)