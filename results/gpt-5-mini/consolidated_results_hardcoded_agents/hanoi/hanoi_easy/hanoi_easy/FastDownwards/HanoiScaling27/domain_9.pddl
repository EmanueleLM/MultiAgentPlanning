(define (domain hanoi-mover-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk d is directly on peg p (no disk between d and peg)
    (on-disk ?d - disk ?under - disk)  ; disk d is directly on top of disk under

    (clear-disk ?d - disk)             ; nothing is on top of disk d (d is the top disk of its stack)
    (clear-peg ?p - peg)               ; peg p is empty (no disk directly on it)

    (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2 (static ordering)

    (succ ?s1 - stage ?s2 - stage)     ; s2 is the immediate successor of s1
    (current-stage ?s - stage)         ; the planning process is currently at stage s
  )

  ;; Move a top disk that is directly on a peg to another empty peg
  (:action mover-move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)

      (on-peg ?d ?from)    ; disk is directly on source peg (no disk between)
      (clear-disk ?d)      ; disk is the top disk on the source peg

      (clear-peg ?to)      ; destination peg must be empty
    )
    :effect (and
      ;; disk d is removed from source peg and becomes directly on destination peg
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; destination peg is no longer empty; source peg becomes empty
      (not (clear-peg ?to))
      (clear-peg ?from)

      ;; moved disk is top on destination
      (clear-disk ?d)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg onto a top disk (destination disk must be larger)
  (:action mover-move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)

      (on-peg ?d ?from)    ; disk is on the source peg (direct)
      (clear-disk ?d)      ; disk is top

      (clear-disk ?to)     ; destination disk must be top (we place onto it)
      (smaller ?d ?to)     ; moved disk must be smaller than the disk it is placed on
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; destination disk is no longer top; source peg becomes empty
      (not (clear-disk ?to))
      (clear-peg ?from)

      ;; moved disk becomes top
      (clear-disk ?d)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk onto an empty peg
  (:action mover-move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)

      (on-disk ?d ?from)   ; disk d is directly on top of disk ?from
      (clear-disk ?d)      ; disk d is top

      (clear-peg ?to)      ; destination peg must be empty
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; destination peg no longer empty; the disk that was under d becomes top
      (not (clear-peg ?to))
      (clear-disk ?from)

      ;; moved disk becomes top on destination
      (clear-disk ?d)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk onto another top disk (order enforced)
  (:action mover-move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)

      (on-disk ?d ?from)   ; disk d is directly on top of disk ?from
      (clear-disk ?d)      ; disk d is top

      (clear-disk ?to)     ; destination disk must be top
      (smaller ?d ?to)     ; moved disk must be smaller than destination disk
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; destination disk no longer top; disk under ?from becomes top
      (not (clear-disk ?to))
      (clear-disk ?from)

      ;; moved disk becomes top
      (clear-disk ?d)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)