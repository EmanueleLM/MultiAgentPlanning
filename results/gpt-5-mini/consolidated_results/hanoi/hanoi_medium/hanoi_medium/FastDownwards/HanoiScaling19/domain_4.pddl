(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk D is directly on place P (P may be a peg or another disk) at step S
    (on ?d - disk ?p ?s - step)

    ;; place P (either a peg or a disk) has nothing on top of it at step S
    (clear ?p ?s - step)

    ;; step successor relation
    (next ?s1 ?s2 - step)

    ;; a move was executed that advanced from step S to its successor
    (moved ?s - step)

    ;; size ordering: smaller ?d1 ?d2 means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a disk onto an empty peg (target is a peg)
  (:action move-to-peg
    :parameters (
      ?d - disk                ; disk being moved
      ?from ?to - peg          ; source place (peg or disk) and target peg
      ?t ?t2 - step            ; current and next step
      ;; supports of all disks at time ?t (their direct supports)
      ?sa ?sb ?sc ?sd ?se
    )
    :precondition (and
      ;; the disk is currently on its source at step ?t and has nothing on top
      (on ?d ?from ?t)
      (clear ?d ?t)

      ;; target peg must be clear at time ?t (empty top)
      (clear ?to ?t)

      ;; the exact support of every disk at time ?t (used to persist unchanged disks to ?t2)
      (on A ?sa ?t)
      (on B ?sb ?t)
      (on C ?sc ?t)
      (on D ?sd ?t)
      (on E ?se ?t)

      ;; step progression and single-move-per-step enforcement
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      ;; remove old position of moved disk at time ?t and assert its new position at ?t2
      (not (on ?d ?from ?t))
      (on ?d ?to ?t2)

      ;; persist other disks' positions into ?t2 (they keep their supports if not moved)
      (on A ?sa ?t2)
      (on B ?sb ?t2)
      (on C ?sc ?t2)
      (on D ?sd ?t2)
      (on E ?se ?t2)

      ;; initialize clear at ?t2 for all pegs and disk tops, then remove clears for places that become occupied
      (clear left ?t2) (clear middle ?t2) (clear right ?t2)
      (clear A ?t2) (clear B ?t2) (clear C ?t2) (clear D ?t2) (clear E ?t2)

      ;; any place that has a disk on it at ?t2 must not be clear at ?t2
      ;; (these include the target peg and all supports of disks after the move)
      (not (clear ?to ?t2))
      (not (clear ?sa ?t2))
      (not (clear ?sb ?t2))
      (not (clear ?sc ?t2))
      (not (clear ?sd ?t2))
      (not (clear ?se ?t2))

      ;; mark that a move was executed advancing from step ?t
      (moved ?t)
    )
  )

  ;; Move a disk onto another disk (target is a disk). Enforce size ordering.
  (:action move-onto-disk
    :parameters (
      ?d - disk                ; disk being moved
      ?from - (? -)            ; source place (untyped)
      ?to - disk               ; target disk (must be larger)
      ?t ?t2 - step            ; current and next step
      ;; supports of all disks at time ?t (their direct supports)
      ?sa ?sb ?sc ?sd ?se
    )
    :precondition (and
      ;; moved disk is on its source and is topmost
      (on ?d ?from ?t)
      (clear ?d ?t)

      ;; target disk must be clear (nothing on top)
      (clear ?to ?t)

      ;; size ordering: moved disk must be smaller than target disk
      (smaller ?d ?to)

      ;; exact supports of all disks at time ?t
      (on A ?sa ?t)
      (on B ?sb ?t)
      (on C ?sc ?t)
      (on D ?sd ?t)
      (on E ?se ?t)

      ;; step progression and ensure no other move in the same step
      (next ?t ?t2)
      (not (moved ?t))
    )
    :effect (and
      ;; update moved disk position from ?t to ?t2
      (not (on ?d ?from ?t))
      (on ?d ?to ?t2)

      ;; persist other disks' positions
      (on A ?sa ?t2)
      (on B ?sb ?t2)
      (on C ?sc ?t2)
      (on D ?sd ?t2)
      (on E ?se ?t2)

      ;; recompute clears at ?t2 then remove clears for occupied places
      (clear left ?t2) (clear middle ?t2) (clear right ?t2)
      (clear A ?t2) (clear B ?t2) (clear C ?t2) (clear D ?t2) (clear E ?t2)

      (not (clear ?to ?t2))
      (not (clear ?sa ?t2))
      (not (clear ?sb ?t2))
      (not (clear ?sc ?t2))
      (not (clear ?sd ?t2))
      (not (clear ?se ?t2))

      ;; mark that a move was executed advancing from step ?t
      (moved ?t)
    )
  )
)