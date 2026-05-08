(define (domain hanoi_staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ; disk placement relations:
    (on-peg ?d - disk ?p - peg)       ; ?d is directly on peg ?p (no disk under it)
    (on-disk ?d - disk ?under - disk) ; ?d is directly on top of disk ?under

    ; top-of-peg: the disk currently at the top of a peg
    (top ?d - disk ?p - peg)

    ; peg empty marker (true exactly when there are no disks on that peg)
    (empty ?p - peg)

    ; size ordering: smaller ?small ?big is true iff ?small is strictly smaller than ?big
    (smaller ?small - disk ?big - disk)

    ; staging / discrete time
    (current-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ; Move a top disk that is directly on a peg to an empty peg.
  ; Source disk is on-peg and is the top of source peg; destination peg is empty.
  (:action move_from_peg_to_empty
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?pfrom)
      (top ?d ?pfrom)
      (empty ?pto)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)

      ; remove disk from source peg
      (not (on-peg ?d ?pfrom))
      (not (top ?d ?pfrom))

      ; place disk on destination peg as its top and as directly on-peg
      (on-peg ?d ?pto)
      (top ?d ?pto)

      ; update emptiness of pegs
      (empty ?pfrom)
      (not (empty ?pto))
    )
  )

  ; Move a top disk that is directly on a peg to a non-empty peg whose top is ?t (must be larger).
  (:action move_from_peg_to_nonempty
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?pfrom)
      (top ?d ?pfrom)
      (top ?t ?pto)
      (smaller ?d ?t)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)

      ; remove disk from source peg
      (not (on-peg ?d ?pfrom))
      (not (top ?d ?pfrom))

      ; place disk on top of disk ?t
      (on-disk ?d ?t)
      (top ?d ?pto)
      (not (top ?t ?pto))

      ; source peg becomes empty (since disk was on-peg and top)
      (empty ?pfrom)
    )
  )

  ; Move a top disk that is directly on another disk (?under) to an empty peg.
  ; Source: disk ?d is on-disk ?under and is the top of its peg ?pfrom.
  (:action move_from_disk_to_empty
    :parameters (?d - disk ?under - disk ?pfrom - peg ?pto - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?pfrom)
      (empty ?pto)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)

      ; remove disk from on top of ?under and from being top of source
      (not (on-disk ?d ?under))
      (not (top ?d ?pfrom))

      ; place disk on destination peg as directly on-peg and top there
      (on-peg ?d ?pto)
      (top ?d ?pto)
      (not (empty ?pto))

      ; the disk under becomes the new top of the source peg
      (top ?under ?pfrom)
    )
  )

  ; Move a top disk that is directly on another disk (?under) to a non-empty peg whose top is ?t (must be larger).
  (:action move_from_disk_to_nonempty
    :parameters (?d - disk ?under - disk ?pfrom - peg ?pto - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?under)
      (top ?d ?pfrom)
      (top ?t ?pto)
      (smaller ?d ?t)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)

      ; remove disk from its previous placement and top of source
      (not (on-disk ?d ?under))
      (not (top ?d ?pfrom))

      ; place disk on top of disk ?t
      (on-disk ?d ?t)
      (top ?d ?pto)
      (not (top ?t ?pto))

      ; the disk under becomes the new top of the source peg
      (top ?under ?pfrom)
    )
  )
)