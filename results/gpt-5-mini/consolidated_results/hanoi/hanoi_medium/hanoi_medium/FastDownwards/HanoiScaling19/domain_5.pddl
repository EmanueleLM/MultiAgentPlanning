(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    disk peg - place
    step
  )

  (:predicates
    ;; disk D is directly on place P (P may be a peg or another disk) at step S
    (on ?d - disk ?p - place ?s - step)

    ;; step successor relation
    (next ?s1 - step ?s2 - step)

    ;; a move was executed that advanced from step S
    (moved ?s - step)

    ;; size ordering: smaller ?d1 ?d2 means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg (target is a peg).
  ;; This single action schema enforces:
  ;; - only the top disk on its current place may be moved (via negative preconditions)
  ;; - the target peg must have no disk on it at the current step (via negative preconditions)
  ;; - exactly one move per step (via moved and next)
  ;; Frame axioms: the supports of all disks at the current step are provided as parameters
  ;; and reasserted for the next step; the moved disk is placed on the target peg for the next step,
  ;; and the accidental duplicate of the moved disk's old support at the next step is removed.
  (:action move-to-peg
    :parameters (
      ?d - disk                 ; disk being moved
      ?from - place             ; source place (peg or disk)
      ?to - peg                 ; target peg
      ?s ?s2 - step             ; current and next step
      ;; supports of all disks at time ?s (their direct supports)
      ?sa - place ?sb - place ?sc - place ?sd - place ?se - place
    )
    :precondition (and
      ;; moved disk is currently on its source at step ?s
      (on ?d ?from ?s)

      ;; supports of every disk at time ?s
      (on A ?sa ?s)
      (on B ?sb ?s)
      (on C ?sc ?s)
      (on D ?sd ?s)
      (on E ?se ?s)

      ;; moved disk must be top (no disk is on top of it at ?s)
      (not (on A ?d ?s)) (not (on B ?d ?s)) (not (on C ?d ?s)) (not (on D ?d ?s)) (not (on E ?d ?s))

      ;; target peg must be clear at time ?s (no disk is on top of target)
      (not (on A ?to ?s)) (not (on B ?to ?s)) (not (on C ?to ?s)) (not (on D ?to ?s)) (not (on E ?to ?s))

      ;; step progression and single-move-per-step enforcement
      (next ?s ?s2)
      (not (moved ?s))
    )
    :effect (and
      ;; reassert positions for all disks at ?s2 according to their supports at ?s
      (on A ?sa ?s2) (on B ?sb ?s2) (on C ?sc ?s2) (on D ?sd ?s2) (on E ?se ?s2)

      ;; place the moved disk on the target peg at ?s2
      (on ?d ?to ?s2)

      ;; if the moved disk's old support got reasserted above, remove that old-support copy at ?s2
      (not (on ?d ?from ?s2))

      ;; mark that a move was executed advancing from step ?s
      (moved ?s)
    )
  )

  ;; Move a top disk onto another disk (target is a disk). Enforce size ordering.
  (:action move-onto-disk
    :parameters (
      ?d - disk                 ; disk being moved
      ?from - place             ; source place (peg or disk)
      ?to - disk                ; target disk (must be larger)
      ?s ?s2 - step             ; current and next step
      ;; supports of all disks at time ?s (their direct supports)
      ?sa - place ?sb - place ?sc - place ?sd - place ?se - place
    )
    :precondition (and
      ;; moved disk is currently on its source at step ?s
      (on ?d ?from ?s)

      ;; supports of every disk at time ?s
      (on A ?sa ?s)
      (on B ?sb ?s)
      (on C ?sc ?s)
      (on D ?sd ?s)
      (on E ?se ?s)

      ;; moved disk must be top (no disk is on top of it at ?s)
      (not (on A ?d ?s)) (not (on B ?d ?s)) (not (on C ?d ?s)) (not (on D ?d ?s)) (not (on E ?d ?s))

      ;; target disk must be clear at time ?s (no disk is on top of it)
      (not (on A ?to ?s)) (not (on B ?to ?s)) (not (on C ?to ?s)) (not (on D ?to ?s)) (not (on E ?to ?s))

      ;; size ordering: moved disk must be smaller than target disk
      (smaller ?d ?to)

      ;; step progression and ensure no other move in the same step
      (next ?s ?s2)
      (not (moved ?s))
    )
    :effect (and
      ;; reassert positions for all disks at ?s2 according to their supports at ?s
      (on A ?sa ?s2) (on B ?sb ?s2) (on C ?sc ?s2) (on D ?sd ?s2) (on E ?se ?s2)

      ;; place the moved disk onto the target disk at ?s2
      (on ?d ?to ?s2)

      ;; remove the accidental old-support copy for the moved disk at ?s2 if present
      (not (on ?d ?from ?s2))

      ;; mark that a move was executed advancing from step ?s
      (moved ?s)
    )
  )
)