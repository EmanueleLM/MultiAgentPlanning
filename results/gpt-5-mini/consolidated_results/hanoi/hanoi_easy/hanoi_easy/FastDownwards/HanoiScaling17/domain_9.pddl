(define (domain hanoi-4-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (disk-on-peg ?d - disk ?p - peg)         ;; disk ?d is located on peg ?p
    (top-of-peg ?d - disk ?p - peg)         ;; ?d is the top disk on peg ?p
    (on ?d - disk ?under - disk)            ;; ?d is immediately on top of ?under
    (bottom-of-peg ?d - disk ?p - peg)      ;; ?d has no disk under it on peg ?p (it is bottom of that peg)
    (peg-empty ?p - peg)                    ;; peg ?p currently empty
    (smaller-than ?d1 - disk ?d2 - disk)    ;; size order: ?d1 is smaller than ?d2 (static)
    (next ?s - stage ?snext - stage)        ;; stage successor relation
    (current-stage ?s - stage)              ;; active stage
    (diff ?p1 - peg ?p2 - peg)              ;; explicit peg inequality facts
  )

  ;; Move a top disk that has a disk under it (i.e., not bottom) from a non-empty source peg to an empty destination peg.
  (:action mover-move-with-under-to-empty
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (on ?d ?under)
      (disk-on-peg ?under ?from)
      (peg-empty ?to)
      (diff ?from ?to)
      (current-stage ?s)
      (next ?s ?snext)
    )
    :effect (and
      ;; relocate disk ?d from ?from to ?to
      (not (disk-on-peg ?d ?from))
      (disk-on-peg ?d ?to)

      ;; update top facts
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)

      ;; update stacking relations: remove old under relation; at empty destination the moved disk becomes bottom
      (not (on ?d ?under))
      (bottom-of-peg ?d ?to)

      ;; destination is no longer empty
      (not (peg-empty ?to))

      ;; source peg's new top is the former under disk
      (top-of-peg ?under ?from)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  ;; Move a top disk that has a disk under it from a non-empty source peg to a non-empty destination peg (placing on top of ?topp).
  (:action mover-move-with-under-to-nonempty
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?topp - disk ?s - stage ?snext - stage)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (on ?d ?under)
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
      (not (on ?d ?under))
      (on ?d ?topp)

      ;; source peg's new top is the former under disk
      (top-of-peg ?under ?from)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  ;; Move a top disk that is also the bottom of its peg (sole disk on peg) from its peg to an empty peg.
  (:action mover-move-bottom-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (bottom-of-peg ?d ?from)
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

      ;; source becomes empty, destination no longer empty
      (peg-empty ?from)
      (not (peg-empty ?to))

      ;; bottom property moves with the disk when placed on empty peg
      (not (bottom-of-peg ?d ?from))
      (bottom-of-peg ?d ?to)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  ;; Move a top disk that is also the bottom of its peg (sole disk) from its peg to a non-empty destination peg.
  (:action mover-move-bottom-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?topp - disk ?s - stage ?snext - stage)
    :precondition (and
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (bottom-of-peg ?d ?from)
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
      (on ?d ?topp)

      ;; source becomes empty, destination not empty
      (peg-empty ?from)
      (not (peg-empty ?to))

      ;; moved disk is no longer bottom (it now sits on ?topp)
      (not (bottom-of-peg ?d ?from))

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )
)