(define (domain hanoi-4-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk d is located somewhere on peg p (somewhere in the stack on that peg)
    (disk-on-peg ?d - disk ?p - peg)
    ;; disk d is the top disk on peg p
    (top-of-peg ?d - disk ?p - peg)
    ;; disk ?d1 is strictly smaller than disk ?d2
    (smaller-than ?d1 - disk ?d2 - disk)
    ;; disk ?d is directly on top of disk ?under (adjacent stack relation)
    (on-disk ?d - disk ?under - disk)
    ;; peg ?p currently has no disks
    (peg-empty ?p - peg)
    ;; disk ?d has no disk underneath it (it is directly on the peg)
    (no-under ?d - disk)
  )

  ;; Move a top disk that has a disk underneath it, onto an empty target peg.
  (:action move-by-mover-to-empty-with-under
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (on-disk ?d ?under)
      (peg-empty ?to)
    )
    :effect (and
      ;; remove from source peg
      (not (disk-on-peg ?d ?from))
      (not (top-of-peg ?d ?from))
      ;; break the direct-on relation
      (not (on-disk ?d ?under))
      ;; place on target peg as its top (target was empty)
      (disk-on-peg ?d ?to)
      (top-of-peg ?d ?to)
      ;; target is no longer empty
      (not (peg-empty ?to))
      ;; the disk that was under ?d becomes the new top of the source peg
      (top-of-peg ?under ?from)
      ;; moved disk now has no disk under it (it sits directly on peg)
      (no-under ?d)
    )
  )

  ;; Move a top disk that had no disk underneath it (it was directly on the peg),
  ;; onto an empty target peg.
  (:action move-by-mover-to-empty-no-under
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (no-under ?d)
      (peg-empty ?to)
    )
    :effect (and
      ;; remove from source peg
      (not (disk-on-peg ?d ?from))
      (not (top-of-peg ?d ?from))
      ;; place on target peg as its top (target was empty)
      (disk-on-peg ?d ?to)
      (top-of-peg ?d ?to)
      ;; update peg emptiness
      (not (peg-empty ?to))
      (peg-empty ?from)
      ;; moved disk still has no-under (it sits directly on the peg)
      (no-under ?d)
    )
  )

  ;; Move a top disk that has a disk underneath it, onto a non-empty target peg
  ;; (place on top of target's current top disk). Enforces smaller-on-larger.
  (:action move-by-mover-to-nonempty-with-under
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?topp - disk)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (on-disk ?d ?under)
      (top-of-peg ?topp ?to)
      (smaller-than ?d ?topp)
    )
    :effect (and
      ;; remove from source peg
      (not (disk-on-peg ?d ?from))
      (not (top-of-peg ?d ?from))
      ;; break the direct-on relation at source
      (not (on-disk ?d ?under))
      ;; place on target peg on top of topp
      (disk-on-peg ?d ?to)
      (top-of-peg ?d ?to)
      (on-disk ?d ?topp)
      ;; target topp is no longer top
      (not (top-of-peg ?topp ?to))
      ;; the disk that was under ?d becomes the new top of the source peg
      (top-of-peg ?under ?from)
      ;; moved disk now has a disk under it -> no-under removed if present
      (not (no-under ?d))
    )
  )

  ;; Move a top disk that had no disk underneath it (it was directly on the peg),
  ;; onto a non-empty target peg (place on top of target's top disk).
  (:action move-by-mover-to-nonempty-no-under
    :parameters (?d - disk ?from - peg ?to - peg ?topp - disk)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (no-under ?d)
      (top-of-peg ?topp ?to)
      (smaller-than ?d ?topp)
    )
    :effect (and
      ;; remove from source peg
      (not (disk-on-peg ?d ?from))
      (not (top-of-peg ?d ?from))
      ;; place on target peg on top of topp
      (disk-on-peg ?d ?to)
      (top-of-peg ?d ?to)
      (on-disk ?d ?topp)
      ;; target topp is no longer top
      (not (top-of-peg ?topp ?to))
      ;; source peg becomes empty (since disk had no-under)
      (peg-empty ?from)
      ;; moved disk now has a disk under it -> no-under removed
      (not (no-under ?d))
    )
  )
)