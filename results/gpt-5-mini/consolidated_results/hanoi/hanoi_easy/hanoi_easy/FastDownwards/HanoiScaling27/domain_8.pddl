(define (domain hanoi-mover-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk d is directly on peg p (top position)
    (on-disk ?d - disk ?under - disk)  ; disk d is directly on top of disk under

    (clear-disk ?d - disk)             ; nothing is on top of disk d (d is top of its stack)
    (clear-peg ?p - peg)               ; peg p is empty (no top disk)

    (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2 (static ordering)

    (succ ?s1 - stage ?s2 - stage)     ; s2 is the immediate successor of s1
    (current-stage ?s - stage)         ; the planning process is currently at stage s
  )

  ;; Move a top disk from one peg to another empty peg
  (:action mover-move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)

      (on-peg ?d ?from)    ; disk is on the source peg
      (clear-disk ?d)      ; disk is the top disk on the source peg

      (clear-peg ?to)      ; destination peg must be empty (move onto peg)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (clear-peg ?to))
      (clear-peg ?from)

      ;; after move, ?d is the top disk (remains clear)
      (clear-disk ?d)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Move a top disk from a peg onto a (top) disk (must be larger)
  (:action mover-move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)

      (on-peg ?d ?from)    ; disk is on the source peg
      (clear-disk ?d)      ; disk is top

      (clear-disk ?to)     ; target disk must be top (we place on it)
      (smaller ?d ?to)     ; moved disk must be smaller than the disk it is placed on
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      (not (clear-disk ?to))
      (clear-peg ?from)

      ;; moved disk becomes the top disk
      (clear-disk ?d)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Move a top disk from another disk onto an empty peg
  (:action mover-move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)

      (on-disk ?d ?from)   ; disk is on top of another disk
      (clear-disk ?d)      ; disk is top

      (clear-peg ?to)      ; destination peg must be empty
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      (not (clear-peg ?to))
      (clear-disk ?from)   ; disk below becomes top

      ;; moved disk becomes the top disk
      (clear-disk ?d)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Move a top disk from one disk onto another disk (both disks must be top; order enforced)
  (:action mover-move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)

      (on-disk ?d ?from)   ; disk is on top of some disk ?from
      (clear-disk ?d)      ; disk is top

      (clear-disk ?to)     ; destination disk must be top
      (smaller ?d ?to)     ; moved disk must be smaller than destination disk
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      (not (clear-disk ?to))
      (clear-disk ?from)   ; disk below ?from becomes top

      ;; moved disk becomes the top disk
      (clear-disk ?d)

      ;; advance stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)