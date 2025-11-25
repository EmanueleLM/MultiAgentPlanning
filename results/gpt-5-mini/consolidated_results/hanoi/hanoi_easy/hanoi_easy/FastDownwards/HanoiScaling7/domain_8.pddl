(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)       ; disk directly on a peg
    (on-disk ?d - disk ?support - disk) ; disk directly on another disk

    (clear-peg ?p - peg)              ; peg has no disk on it
    (clear-disk ?d - disk)            ; disk has no disk on top

    (smaller ?d1 - disk ?d2 - disk)   ; d1 is smaller than d2

    (current-step ?s - step)
    (succ ?s1 - step ?s2 - step)
  )

  ;; Move a top disk from an empty peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-peg ?d ?from)
      (clear-disk ?d)    ; ?d is the top disk on ?from
      (clear-peg ?to)    ; target peg empty
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source peg becomes empty, target peg becomes non-empty
      (clear-peg ?from)
      (not (clear-peg ?to))

      ;; moved disk remains top (has nothing on it)
      (clear-disk ?d)

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk from an empty peg onto a top disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-peg ?d ?from)
      (clear-disk ?d)    ; ?d is top on its peg
      (clear-disk ?to)   ; target disk has no disk on top
      (smaller ?d ?to)   ; size rule: moving disk must be smaller than target
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; source peg becomes empty, target disk no longer clear
      (clear-peg ?from)
      (not (clear-disk ?to))

      ;; moved disk is top
      (clear-disk ?d)

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk from a top disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-disk ?d ?from)
      (clear-disk ?d)    ; ?d is top on its support
      (clear-peg ?to)    ; target peg empty
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; source disk becomes clear, target peg becomes non-empty
      (clear-disk ?from)
      (not (clear-peg ?to))

      ;; moved disk is top
      (clear-disk ?d)

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk from a top disk onto another top disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-disk ?d ?from)
      (clear-disk ?d)    ; ?d is top on its support
      (clear-disk ?to)   ; target disk has no disk on top
      (smaller ?d ?to)   ; size rule
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; source disk becomes clear, target disk no longer clear
      (clear-disk ?from)
      (not (clear-disk ?to))

      ;; moved disk is top
      (clear-disk ?d)

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )
)