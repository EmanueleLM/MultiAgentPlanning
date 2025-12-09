(define (domain hanoi-domain-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    (on ?d - disk ?p - place)            ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)                   ; nothing is on top of place ?p
    (current ?s - stage)                 ; current stage pointer
    (succ ?s1 - stage ?s2 - stage)       ; successor relation between stages
    (smaller ?d1 - disk ?d2 - disk)      ; ?d1 is strictly smaller than ?d2
  )

  ;; Move a clear disk from any place onto an empty peg, advancing the stage
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      ;; update disk position
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clearness: destination no longer clear, origin becomes clear,
      ;; moved disk is now clear (top)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)

      ;; advance stage pointer (enforces exactly one move per stage)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a clear disk from any place onto an empty disk (must be smaller), advancing the stage
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      ;; update disk position
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clearness
      (not (clear ?to))
      (clear ?from)
      (clear ?d)

      ;; advance stage pointer
      (not (current ?s))
      (current ?s2)
    )
  )
)