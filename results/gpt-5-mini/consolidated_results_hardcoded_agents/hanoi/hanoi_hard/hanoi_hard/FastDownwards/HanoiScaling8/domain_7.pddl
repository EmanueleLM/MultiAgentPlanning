(define (domain hanoi_ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage - object)

  (:predicates
    (on ?d - disk ?x - object)       ; disk ?d is directly on object ?x (disk or peg)
    (clear ?x - object)             ; object (disk or peg) has nothing on top
    (smaller ?small - disk ?big - disk) ; size ordering: small < big
    (current-stage ?s - stage)      ; current time/stage
    (next ?s1 - stage ?s2 - stage)  ; successor relation for stages
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; source becomes clear; destination no longer clear; moved disk is clear (top)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; Move a top disk that is directly on a peg onto the top disk of another peg.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?t - disk ?toPeg - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)        ;; disk is directly on source peg
      (clear ?d)           ;; top disk
      (on ?t ?toPeg)       ;; destination top disk sits on destination peg
      (clear ?t)           ;; destination top disk is clear (no disk above)
      (smaller ?d ?t)      ;; size ordering
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      (not (on ?d ?from))
      (on ?d ?t)

      ;; source becomes clear; destination top disk no longer clear; moved disk is clear (top)
      (clear ?from)
      (not (clear ?t))
      (clear ?d)
    )
  )

  ;; Move a top disk that is on top of another disk, onto an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?under - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?under)
      (clear ?d)
      (clear ?to)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      (not (on ?d ?under))
      (on ?d ?to)

      ;; the disk that was under becomes clear; destination peg no longer clear; moved disk is clear
      (clear ?under)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; Move a top disk that is on top of another disk, onto another top disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?under - disk ?t - disk ?toPeg - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?under)
      (clear ?d)
      (on ?t ?toPeg)
      (clear ?t)
      (smaller ?d ?t)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (current-stage ?s))
      (current-stage ?s2)

      (not (on ?d ?under))
      (on ?d ?t)

      ;; update clears: under becomes clear, destination top no longer clear, moved disk is clear
      (clear ?under)
      (not (clear ?t))
      (clear ?d)
    )
  )
)