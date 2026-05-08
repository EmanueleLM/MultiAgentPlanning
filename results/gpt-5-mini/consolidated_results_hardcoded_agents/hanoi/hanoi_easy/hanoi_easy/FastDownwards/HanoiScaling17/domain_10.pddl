(define (domain hanoi-4-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (disk-on-peg ?d - disk ?p - peg)         ; disk ?d is located on peg ?p
    (top-of-peg ?d - disk ?p - peg)         ; ?d is the top disk on peg ?p
    (on ?d - disk ?under - disk)            ; ?d is immediately on top of ?under
    (bottom-of-peg ?d - disk ?p - peg)      ; ?d is bottom disk of peg ?p
    (peg-empty ?p - peg)                    ; peg ?p currently empty
    (smaller-than ?d1 - disk ?d2 - disk)    ; static size ordering: ?d1 smaller than ?d2
    (next ?s - stage ?snext - stage)        ; stage successor relation
    (current-stage ?s - stage)              ; active stage marker
    (diff ?p1 - peg ?p2 - peg)              ; explicit peg inequality facts
  )

  ;; Move a top disk that has a disk directly under it (i.e., source peg remains non-empty)
  ;; to an empty destination peg.
  (:action mover-move-with-under-to-empty
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (current-stage ?s)
      (next ?s ?snext)
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (on ?d ?under)                     ; ?d is immediately above ?under on ?from
      (disk-on-peg ?under ?from)
      (peg-empty ?to)
      (diff ?from ?to)
    )
    :effect (and
      ;; relocate disk ?d
      (not (disk-on-peg ?d ?from))
      (disk-on-peg ?d ?to)

      ;; update top facts
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)

      ;; remove old on relation and set bottom at destination (destination was empty)
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

  ;; Move a top disk that has a disk under it from a non-empty source peg
  ;; to a non-empty destination peg (placing it on top of ?topp).
  (:action mover-move-with-under-to-nonempty
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?topp - disk ?s - stage ?snext - stage)
    :precondition (and
      (current-stage ?s)
      (next ?s ?snext)
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (on ?d ?under)
      (disk-on-peg ?under ?from)
      (top-of-peg ?topp ?to)
      (disk-on-peg ?topp ?to)
      (smaller-than ?d ?topp)            ; ensure moved disk is smaller than destination top
      (diff ?from ?to)
    )
    :effect (and
      ;; relocate disk ?d
      (not (disk-on-peg ?d ?from))
      (disk-on-peg ?d ?to)

      ;; update top facts on source and destination
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)
      (not (top-of-peg ?topp ?to))

      ;; update stacking relations
      (not (on ?d ?under))
      (on ?d ?topp)

      ;; source peg's new top is the former under disk
      (top-of-peg ?under ?from)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )

  ;; Move the sole disk on a peg (top and bottom) from its peg to an empty peg.
  (:action mover-move-bottom-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (current-stage ?s)
      (next ?s ?snext)
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (bottom-of-peg ?d ?from)            ; sole disk on ?from
      (peg-empty ?to)
      (diff ?from ?to)
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

  ;; Move the sole disk on a peg (top and bottom) from its peg to a non-empty destination peg.
  (:action mover-move-bottom-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?topp - disk ?s - stage ?snext - stage)
    :precondition (and
      (current-stage ?s)
      (next ?s ?snext)
      (disk-on-peg ?d ?from)
      (top-of-peg ?d ?from)
      (bottom-of-peg ?d ?from)
      (top-of-peg ?topp ?to)
      (disk-on-peg ?topp ?to)
      (smaller-than ?d ?topp)            ; moved disk must be smaller than destination top
      (diff ?from ?to)
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

      ;; source becomes empty, destination no longer empty
      (peg-empty ?from)
      (not (peg-empty ?to))

      ;; moved disk is no longer bottom on source
      (not (bottom-of-peg ?d ?from))

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?snext)
    )
  )
)