(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg - place
    place
    stage
  )

  (:predicates
    (on ?d - disk ?p - place)       ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)              ; place ?p has no disk directly on it (i.e., nothing on top)
    (smaller ?a - disk ?b - disk)   ; disk ?a is strictly smaller than disk ?b
    (next ?s - stage ?s2 - stage)   ; successor relation for explicit stage progression
    (current ?s - stage)            ; the unique current stage
  )

  ;; Move a top disk onto an empty peg (one time-step forward)
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)      ; disk is currently directly on ?from
      (clear ?d)         ; disk is top (nothing on it)
      (clear ?to)        ; destination top is clear (peg is empty or topmost disk absent)
      (current ?s)       ; action must occur at the current stage
      (next ?s ?s2)      ; deterministic successor stage
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; advance the unique current stage strictly forward (no oscillation/backtracking)
      (not (current ?s))
      (current ?s2)
      ;; source place becomes clear because its top disk was removed
      (clear ?from)
      ;; destination place is no longer clear because ?d is placed on it
      (not (clear ?to))
    )
  )

  ;; Move a top disk onto a (larger) top disk (one time-step forward)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)   ; enforce no-larger-on-smaller: moved disk must be smaller than destination disk
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (current ?s))
      (current ?s2)
      (clear ?from)
      (not (clear ?to))
    )
  )
)