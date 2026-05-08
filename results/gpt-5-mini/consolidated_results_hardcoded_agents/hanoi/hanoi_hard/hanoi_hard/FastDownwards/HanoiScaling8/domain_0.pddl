; Domain: pddl_orchestrator
; Comment: The specification required handling moves of the top disk from one peg to another, enforcing size ordering,
; and accounted for the need to know whether a disk was directly on a peg or on another disk. To reconcile the
; typing/union issue (a disk's support can be either a peg or a disk) without nonstandard union types, this domain
; defines separate predicates on-peg and on-disk and provides four move actions that cover the four combinations:
; (disk on peg) -> (to empty peg), (disk on peg) -> (to peg with top disk),
; (disk on disk) -> (to empty peg), (disk on disk) -> (to peg with top disk).
; This ensures all state updates (top and empty predicates) are explicit and that illegal moves (placing larger on smaller)
; are prevented by preconditions. No bookkeeping/penalty constructs were added.

(define (domain pddl_orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (disk ?d - disk)
    (peg ?p - peg)

    ; direct support relations:
    (on-peg ?d - disk ?p - peg)     ; disk ?d is directly on peg ?p
    (on-disk ?d - disk ?under - disk) ; disk ?d is directly on disk ?under

    ; top-of-peg: the disk that is currently on the top of the peg (if peg non-empty)
    (top ?d - disk ?p - peg)

    ; whether a peg is currently empty (true exactly when there are no disks on that peg)
    (empty ?p - peg)

    ; size relation: smaller ?small ?big is true iff ?small is strictly smaller than ?big
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