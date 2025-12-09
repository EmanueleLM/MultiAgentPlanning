(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on ?d - disk ?p - peg)            ; disk ?d is on peg ?p (current location)
    (top ?d - disk ?p - peg)           ; disk ?d is the top disk on peg ?p
    (above ?d - disk ?e - disk)        ; disk ?d is directly above disk ?e on the same peg
    (peg_empty ?p - peg)               ; peg ?p currently has no disks
    (larger ?x - disk ?y - disk)       ; static size relation: ?x is larger than ?y
    (current-stage ?s - stage)         ; current global stage/timepoint
    (succ ?s1 - stage ?s2 - stage)     ; successor relation over stages
    (diff ?p1 - peg ?p2 - peg)         ; static: two pegs are different
  )

  ;; Move a top disk when it is the only disk on its source peg, onto an empty target peg.
  ;; This action advances the global stage from ?s to its successor ?s2.
  (:action move-sole-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (top ?d ?from)
      (peg_empty ?to)
      (diff ?from ?to)
      ;; No disk directly below ?d on ?from (i.e. ?d is sole disk on the peg)
      (not (exists (?b - disk) (above ?d ?b)))
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; move disk facts
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update top facts and peg empty facts
      (not (top ?d ?from))
      (top ?d ?to)
      (peg_empty ?from)
      (not (peg_empty ?to))
    )
  )

  ;; Move a top disk when it has a disk directly below it on source, onto an empty target peg.
  (:action move-with-below-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?b - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (top ?d ?from)
      (above ?d ?b)
      (peg_empty ?to)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; move disk facts
      (not (on ?d ?from))
      (on ?d ?to)

      ;; remove adjacency on source, make below disk the new top
      (not (above ?d ?b))
      (top ?b ?from)

      ;; update top facts on target and peg emptiness
      (not (top ?d ?from))
      (top ?d ?to)
      (not (peg_empty ?to))
    )
  )

  ;; Move a top disk (which is sole on its source) onto a non-empty target peg whose top is ?t.
  (:action move-sole-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (top ?d ?from)
      (top ?t ?to)
      (larger ?t ?d)
      (diff ?from ?to)
      ;; ?d is sole on source
      (not (exists (?b - disk) (above ?d ?b)))
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; move disk facts
      (not (on ?d ?from))
      (on ?d ?to)

      ;; create adjacency on target, update top facts
      (not (top ?t ?to))
      (above ?d ?t)
      (top ?d ?to)

      ;; source becomes empty
      (not (top ?d ?from))
      (peg_empty ?from)
      (not (peg_empty ?to))
    )
  )

  ;; Move a top disk (which has a disk directly below it) onto a non-empty target peg whose top is ?t.
  (:action move-with-below-to-nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?b - disk ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (top ?d ?from)
      (above ?d ?b)
      (top ?t ?to)
      (larger ?t ?d)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; move disk facts
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update adjacency on source and make below the new top
      (not (above ?d ?b))
      (top ?b ?from)

      ;; update adjacency and top on target
      (not (top ?t ?to))
      (above ?d ?t)
      (top ?d ?to)
      (not (top ?d ?from))
    )
  )
)