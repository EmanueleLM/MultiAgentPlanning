(define (domain hanoi_ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object stage)

  (:predicates
    (on ?d - disk ?x - object)      ; disk ?d is directly on object ?x (disk or peg)
    (top ?d - disk)                 ; ?d has no disk on top
    (empty ?p - peg)                ; peg has no disks
    (smaller ?small - disk ?big - disk) ;; size ordering: small < big
    (current-stage ?s - stage)      ; current time/stage
    (next ?s1 - stage ?s2 - stage)  ; successor relation for stages
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  (:action move-from-peg-to-empty-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)    ;; disk is directly supported by source peg
      (top ?d)
      (empty ?to)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      (not (on ?d ?from))
      (on ?d ?to)

      ;; source peg becomes empty; destination peg becomes non-empty
      (empty ?from)
      (not (empty ?to))

      ;; top facts: ?d remains top (it was top before and is top on destination)
      (top ?d)
    )
  )

  ;; Move a top disk that is directly on a peg onto another top disk on some peg.
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?t - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)    ;; disk is directly on source peg
      (top ?d)
      (top ?t)         ;; destination top disk
      (on ?t ?to)      ;; that top disk sits on destination peg
      (smaller ?d ?t)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      (not (on ?d ?from))
      (on ?d ?t)

      ;; Update tops: destination top no longer top, moved disk becomes top
      (not (top ?t))
      (top ?d)

      ;; source peg becomes empty (disk was directly on the peg)
      (empty ?from)
    )
  )

  ;; Move a top disk that is on top of another disk, onto an empty peg.
  (:action move-from-disk-to-empty-peg
    :parameters (?d - disk ?under - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?under)     ;; d sits on another disk
      (top ?d)
      (empty ?to)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      (not (on ?d ?under))
      (on ?d ?to)

      ;; the disk that was under becomes top
      (top ?under)

      ;; destination peg becomes non-empty
      (not (empty ?to))

      ;; moved disk becomes top at destination
      (top ?d)
    )
  )

  ;; Move a top disk that is on top of another disk, onto another top disk.
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?under - disk ?t - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?under)
      (top ?d)
      (top ?t)
      (on ?t ?to)
      (smaller ?d ?t)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      (not (on ?d ?under))
      (on ?d ?t)

      ;; update top facts
      (top ?under)
      (not (top ?t))
      (top ?d)
    )
  )
)