(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
    (different ?p1 - place ?p2 - place)
    (awaiting-operator ?s - step)
    (awaiting-auditor ?s - step)
    (awaiting-observer ?s - step)
    (step-next ?s1 - step ?s2 - step)
    (final-step ?s - step)
    (finished)
  )

  ;; Move a top disk onto an empty peg (destination is a peg and must be clear)
  (:action operator-move-to-empty-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step)
    :precondition (and
      (awaiting-operator ?s)
      (on ?d ?from)
      (clear ?d)          ; ?d must be the top disk of its stack
      (clear ?to)         ; destination peg must be clear (empty)
      (different ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)       ; the place below ?d becomes clear after removal
      (not (clear ?to))   ; destination no longer clear (now has ?d)
      (not (awaiting-operator ?s))
      (awaiting-auditor ?s)
    )
  )

  ;; Move a top disk onto another top disk (destination is a disk and must be larger)
  (:action operator-move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step)
    :precondition (and
      (awaiting-operator ?s)
      (on ?d ?from)
      (clear ?d)           ; ?d must be the top disk of its stack
      (clear ?to)          ; target disk must be the top disk of its stack
      (smaller ?d ?to)     ; legal move: moved disk smaller than target disk
      (different ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)        ; the place below ?d becomes clear after removal
      (not (clear ?to))    ; target disk no longer clear (now has ?d)
      (not (awaiting-operator ?s))
      (awaiting-auditor ?s)
    )
  )

  ;; Auditor approves each operator move before observer records it
  (:action auditor-approve
    :parameters (?s - step)
    :precondition (and
      (awaiting-auditor ?s)
    )
    :effect (and
      (not (awaiting-auditor ?s))
      (awaiting-observer ?s)
    )
  )

  ;; Observer records the step and advances to the next step object
  (:action observer-record-next
    :parameters (?s - step ?s2 - step)
    :precondition (and
      (awaiting-observer ?s)
      (step-next ?s ?s2)
    )
    :effect (and
      (not (awaiting-observer ?s))
      (awaiting-operator ?s2)
    )
  )

  ;; Observer records final step and marks finished
  (:action observer-record-final
    :parameters (?s - step)
    :precondition (and
      (awaiting-observer ?s)
      (final-step ?s)
    )
    :effect (and
      (not (awaiting-observer ?s))
      (finished)
    )
  )
)