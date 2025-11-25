(define (domain hanoi-4-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (disk-on-peg ?d - disk ?p - peg)        ;; disk ?d is located on peg ?p (somewhere in the stack)
    (top-of-peg ?d - disk ?p - peg)        ;; disk ?d is the top disk on peg ?p
    (on-disk ?d - disk ?under - disk)      ;; disk ?d is immediately on top of disk ?under
    (no-under ?d - disk)                   ;; disk ?d has no disk immediately under it (it is top and peg has no disk under it)
    (peg-empty ?p - peg)                   ;; peg ?p currently empty
    (smaller-than ?d1 - disk ?d2 - disk)   ;; size ordering: ?d1 is smaller than ?d2
    (next ?s - stage ?snext - stage)       ;; successor relation for stages
    (current-stage ?s - stage)             ;; indicates which stage is active
    (diff ?p1 - peg ?p2 - peg)             ;; explicit inequality predicate for pegs
  )

  ;; Move a disk that has another disk immediately under it from a non-empty source peg to an empty destination peg.
  (:action move-to-empty-with-under
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (on-disk ?d ?under)
      (disk-on-peg ?under ?from)
      (peg-empty ?to)
      (diff ?from ?to)
      (current-stage ?s)
      (next ?s ?snext)
    )
    :effect (and
      ;; relocate disk ?d
      (not (disk-on-peg ?d ?from))
      (disk-on-peg ?d ?to)

      ;; update top facts
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)

      ;; update stacking relationships: ?d no longer on ?under; now has no-under because destination peg was empty
      (not (on-disk ?d ?under))
      (no-under ?d)

      ;; destination is no longer empty
      (not (peg-empty ?to))

      ;; source peg's new top is the former under disk
      (top-of-peg ?under ?from)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  ;; Move a disk that has no disk under it (it was top-of-peg with no under) from its peg to an empty peg.
  (:action move-to-empty-no-under
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (no-under ?d)
      (peg-empty ?to)
      (diff ?from ?to)
      (current-stage ?s)
      (next ?s ?snext)
    )
    :effect (and
      ;; relocate disk ?d
      (not (disk-on-peg ?d ?from))
      (disk-on-peg ?d ?to)

      ;; update top facts
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)

      ;; destination no longer empty, source becomes empty
      (not (peg-empty ?to))
      (peg-empty ?from)

      ;; disk ?d now has no disk under it on destination (it is top on an empty peg)
      (no-under ?d)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  ;; Move a disk that has another disk under it from a non-empty source peg to a non-empty destination peg (placing on top of ?topp).
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
      (diff ?from ?to)
      (current-stage ?s)
      (next ?s ?snext)
    )
    :effect (and
      ;; relocate disk ?d
      (not (disk-on-peg ?d ?from))
      (disk-on-peg ?d ?to)

      ;; update top facts on source and destination
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)
      (not (top-of-peg ?topp ?to))

      ;; update stacking relations: remove old under relation, add new under relation
      (not (on-disk ?d ?under))
      (on-disk ?d ?topp)

      ;; moved disk now has an under disk (so not no-under)
      (not (no-under ?d))

      ;; source peg's new top is the former under disk
      (top-of-peg ?under ?from)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  ;; Move a disk that has no disk under it (it was the top with no under) from a non-empty source peg to a non-empty destination peg.
  (:action move-to-nonempty-no-under
    :parameters (?d - disk ?from - peg ?to - peg ?topp - disk ?s - stage ?snext - stage)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (no-under ?d)
      (top-of-peg ?topp ?to)
      (disk-on-peg ?topp ?to)
      (smaller-than ?d ?topp)
      (diff ?from ?to)
      (current-stage ?s)
      (next ?s ?snext)
    )
    :effect (and
      ;; relocate disk ?d
      (not (disk-on-peg ?d ?from))
      (disk-on-peg ?d ?to)

      ;; update top facts
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)
      (not (top-of-peg ?topp ?to))

      ;; stacking relation: now on top of ?topp
      (on-disk ?d ?topp)

      ;; source becomes empty
      (peg-empty ?from)

      ;; moved disk now has an under disk
      (not (no-under ?d))

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )
)