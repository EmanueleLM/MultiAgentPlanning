(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; support relations
    (on-peg ?d - disk ?p - peg)        ; disk is directly on a peg (bottom of a stack)
    (on-disk ?d - disk ?support - disk) ; disk is directly on another disk

    ;; top / emptiness markers
    (clear-disk ?d - disk)             ; no disk on top of ?d (it is a top disk)
    (clear-peg ?p - peg)               ; peg has no disks

    ;; size ordering
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is strictly smaller than d2

    ;; explicit discrete time / stage chain
    (current-step ?s - step)
    (succ ?s1 - step ?s2 - step)
  )

  ;; Move: disk directly on a peg (and that disk is top) => move to an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-peg ?d ?from)
      (clear-disk ?d)    ; ?d is top on its peg (hence the only disk on ?from)
      (clear-peg ?to)    ; target peg empty
    )
    :effect (and
      ;; remove old support, add new support
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source peg becomes empty, target peg becomes non-empty
      (clear-peg ?from)
      (not (clear-peg ?to))

      ;; moved disk remains a top disk
      (clear-disk ?d)

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move: disk directly on a peg (and top) => move onto a top disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-peg ?d ?from)
      (clear-disk ?d)     ; ?d is top on its peg (only disk on ?from)
      (clear-disk ?to)    ; target disk has no disk on top
      (smaller ?d ?to)    ; size rule: moved disk must be smaller than target
    )
    :effect (and
      ;; remove old peg support, add disk support
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

  ;; Move: disk directly on another disk (top) => move to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-disk ?d ?from)
      (clear-disk ?d)     ; ?d is top on its support
      (clear-peg ?to)     ; target peg empty
    )
    :effect (and
      ;; remove old disk support, add peg support
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; support disk becomes clear (no disk on it now), target peg becomes non-empty
      (clear-disk ?from)
      (not (clear-peg ?to))

      ;; moved disk is top
      (clear-disk ?d)

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move: disk directly on another disk (top) => move onto another top disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-disk ?d ?from)
      (clear-disk ?d)     ; ?d is top on its support
      (clear-disk ?to)    ; target disk has no disk on top
      (smaller ?d ?to)    ; size rule
    )
    :effect (and
      ;; remove old support, add new disk support
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; support disk becomes clear, target disk no longer clear
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