(define (domain hanoi-4-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk d is located somewhere on peg p (current configuration)
    (disk-on-peg ?d - disk ?p - peg)
    ;; disk d is the top disk on peg p (current configuration)
    (top-of-peg ?d - disk ?p - peg)
    ;; disk ?d is directly on top of disk ?under (adjacent relation in current configuration)
    (on-disk ?d - disk ?under - disk)
    ;; disk ?d has no disk underneath it (it is directly on the peg; i.e., it is the bottom disk)
    (no-under ?d - disk)
    ;; peg ?p currently has no disks (current configuration)
    (peg-empty ?p - peg)

    ;; global, static size ordering
    (smaller-than ?d1 - disk ?d2 - disk)

    ;; explicit discrete time / stage ordering
    (next ?s - stage ?snext - stage)
    (current-stage ?s - stage)
  )

  ;; Move a top disk that has a disk underneath it, onto an empty target peg.
  ;; Progresses the current-stage to its successor (enforces one move per stage).
  (:action move-to-empty-with-under
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (on-disk ?d ?under)
      (disk-on-peg ?under ?from)
      (peg-empty ?to)
      (current-stage ?s)
      (next ?s ?snext)
    )
    :effect (and
      ;; update disk position
      (not (disk-on-peg ?d ?from))
      (disk-on-peg ?d ?to)

      ;; update top relations
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)

      ;; break the direct-on relation at source, and create no-under at moved disk (it now sits on peg)
      (not (on-disk ?d ?under))
      (no-under ?d)

      ;; target is no longer empty
      (not (peg-empty ?to))

      ;; the disk that was under ?d becomes the new top of the source peg
      (top-of-peg ?under ?from)

      ;; stage progression: consume current-stage and advance to next
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  ;; Move a top disk that had no disk underneath it (it was directly on the peg),
  ;; onto an empty target peg.
  (:action move-to-empty-no-under
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (no-under ?d)
      (peg-empty ?to)
      (current-stage ?s)
      (next ?s ?snext)
    )
    :effect (and
      ;; move disk from source to target
      (not (disk-on-peg ?d ?from))
      (disk-on-peg ?d ?to)

      ;; update top relations
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)

      ;; target is no longer empty; source becomes empty
      (not (peg-empty ?to))
      (peg-empty ?from)

      ;; moved disk remains bottom on target (no-under stays true)

      ;; stage progression
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  ;; Move a top disk that has a disk underneath it, onto a non-empty target peg
  ;; (place on top of target's current top disk). Enforces smaller-on-larger.
  (:action move-to-nonempty-with-under
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?topp - disk ?s - stage ?snext - stage)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (on-disk ?d ?under)
      (disk-on-peg ?under ?from)
      (top-of-peg ?topp ?to)
      (disk-on-peg ?topp ?to)
      (smaller-than ?d ?topp)
      (current-stage ?s)
      (next ?s ?snext)
    )
    :effect (and
      ;; remove from source and place on target
      (not (disk-on-peg ?d ?from))
      (disk-on-peg ?d ?to)

      ;; update top relations
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)
      (not (top-of-peg ?topp ?to))

      ;; break the direct-on relation at source, create new on-disk relation at target
      (not (on-disk ?d ?under))
      (on-disk ?d ?topp)

      ;; moved disk now has a disk under it -> no-under removed if present
      (not (no-under ?d))

      ;; the disk that was under ?d becomes the new top of the source peg
      (top-of-peg ?under ?from)

      ;; stage progression
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  ;; Move a top disk that had no disk underneath it (it was directly on the peg),
  ;; onto a non-empty target peg (place on top of target's top disk).
  (:action move-to-nonempty-no-under
    :parameters (?d - disk ?from - peg ?to - peg ?topp - disk ?s - stage ?snext - stage)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (no-under ?d)
      (top-of-peg ?topp ?to)
      (disk-on-peg ?topp ?to)
      (smaller-than ?d ?topp)
      (current-stage ?s)
      (next ?s ?snext)
    )
    :effect (and
      ;; move disk from source to target
      (not (disk-on-peg ?d ?from))
      (disk-on-peg ?d ?to)

      ;; update top relations
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)
      (not (top-of-peg ?topp ?to))

      ;; disk now sits on topp
      (on-disk ?d ?topp)

      ;; source becomes empty (it was bottom)
      (peg-empty ?from)

      ;; moved disk no longer has no-under (it is on another disk)
      (not (no-under ?d))

      ;; stage progression
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )
)