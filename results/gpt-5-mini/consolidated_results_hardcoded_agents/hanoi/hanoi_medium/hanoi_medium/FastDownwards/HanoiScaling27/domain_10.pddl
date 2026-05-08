(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-disk ?d - disk ?s - disk)       ; ?d is directly on top of ?s
    (on-peg  ?d - disk ?p - peg)        ; ?d is on peg ?p (somewhere in the stack)
    (top     ?d - disk ?p - peg)        ; ?d is the top disk on peg ?p
    (empty   ?p - peg)                  ; peg ?p has no disks
    (has-support ?d - disk)             ; ?d has another disk directly beneath it
    (smaller ?d1 - disk ?d2 - disk)     ; size ordering: ?d1 is smaller than ?d2
    (current-stage ?t - stage)          ; active stage/time step
    (next ?t1 - stage ?t2 - stage)      ; stage ordering: ?t2 is successor of ?t1
  )

  ;; Move a top disk that is the only disk on its source peg to an empty destination peg.
  (:action move_single_from_peg_to_empty_peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
      (not (has-support ?d))
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)

      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))

      (not (has-support ?d))
    )
  )

  ;; Move a top disk that is the only disk on its source peg onto the top disk of a non-empty destination peg.
  (:action move_single_from_peg_onto_disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?below ?to)
      (on-peg ?below ?to)
      (smaller ?d ?below)
      (not (has-support ?d))
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)

      (on-disk ?d ?below)
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (top ?below ?to))

      (not (empty ?to))
      (has-support ?d)
    )
  )

  ;; Move the top disk that sits on another disk (?below) to an empty destination peg.
  (:action move_top_disk_from_stack_to_empty_peg
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-disk ?d ?below)
      (on-peg ?d ?from)
      (on-peg ?below ?from)
      (has-support ?d)
      (empty ?to)
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (not (on-peg ?d ?from))

      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))

      (not (has-support ?d))

      (top ?below ?from)
    )
  )

  ;; Move the top disk that sits on another disk (?below) onto the top disk (?t) of the destination peg.
  (:action move_top_disk_from_stack_onto_disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-disk ?d ?below)
      (on-peg ?d ?from)
      (on-peg ?below ?from)
      (top ?t ?to)
      (on-peg ?t ?to)
      (smaller ?d ?t)
      (has-support ?d)
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (not (on-peg ?d ?from))

      (on-disk ?d ?t)
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (top ?t ?to))

      (has-support ?d)
      (top ?below ?from)
      (not (empty ?to))
    )
  )
)