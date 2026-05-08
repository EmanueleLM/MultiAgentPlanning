(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; Structural world
    (on-peg ?d - disk ?p - peg)        ; disk ?d is directly on peg ?p (there is no disk directly below it)
    (on-disk ?d - disk ?below - disk)  ; disk ?d is directly on top of disk ?below

    ;; Topness / emptiness indicators (true facts only; absence = false)
    (clear-peg ?p - peg)               ; peg ?p has no disk on it (empty)
    (clear-disk ?d - disk)             ; disk ?d has no disk on top of it (is top on its peg/stack)

    ;; Static size ordering
    (smaller ?x - disk ?y - disk)      ; ?x is strictly smaller than ?y

    ;; Discrete stage/time objects and ordering
    (at-stage ?s - stage)              ; the planning state corresponds to stage ?s
    (succ ?s1 - stage ?s2 - stage)     ; successor relation between stages (strict next)
  )

  ;; Move a disk that is directly on a peg to another empty peg.
  ;; Preconditions: disk is top (clear-disk), disk sits directly on the source peg (on-peg),
  ;; destination peg is empty (clear-peg), current stage is ?s and next is ?s2.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s) (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (not (= ?from ?to))
    )
    :effect (and
      ;; advance stage
      (not (at-stage ?s)) (at-stage ?s2)

      ;; reattach moved disk
      (not (on-peg ?d ?from)) (on-peg ?d ?to)

      ;; update emptiness/top facts
      (clear-peg ?from)                 ; source peg becomes empty after removing its directly-on peg disk
      (not (clear-peg ?to))             ; destination peg becomes non-empty
      ;; moved disk remains clear (nothing placed on it by this action)
      ;; no change to clear-disk ?d because it was true in the precondition and remains true
    )
  )

  ;; Move a disk that is directly on a peg onto the top of another disk.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s) (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (at-stage ?s)) (at-stage ?s2)

      (not (on-peg ?d ?from)) (on-disk ?d ?to)

      (clear-peg ?from)                 ; source peg may become empty
      (not (clear-disk ?to))            ; the disk that receives ?d is no longer clear
      ;; moved disk remains clear (it is now top)
    )
  )

  ;; Move a disk that is directly on another disk to an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s) (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (at-stage ?s)) (at-stage ?s2)

      (not (on-disk ?d ?from)) (on-peg ?d ?to)

      (clear-disk ?from)               ; disk below becomes top after removal
      (not (clear-peg ?to))            ; destination peg becomes non-empty
      ;; moved disk remains clear (top)
    )
  )

  ;; Move a disk that is directly on another disk onto the top of a different disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s) (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (not (= ?from ?to))
      (not (= ?d ?to))
    )
    :effect (and
      (not (at-stage ?s)) (at-stage ?s2)

      (not (on-disk ?d ?from)) (on-disk ?d ?to)

      (clear-disk ?from)               ; disk below becomes top after removal
      (not (clear-disk ?to))           ; disk that receives ?d is no longer top
      ;; moved disk remains clear (top)
    )
  )
)