(define (domain hanoi-with-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place agent place)
  (:predicates
    (on ?d - disk ?p - place)         ; direct support: disk d is directly on place p (peg or disk)
    (clear ?p - place)               ; there is no disk directly on place p
    (allowed ?d - disk ?p - place)   ; placement legality precomputed: disk d is allowed on place p
    (agent-ready ?a - agent)         ; agent is available to perform moves
  )

  ; Single atomic move action performed by an agent.
  ; Moves a top (clear) disk from one place to another place if the destination is clear
  ; and the placement is allowed (precomputed for disk size constraints).
  (:action move
    :parameters (?a - agent ?d - disk ?from - place ?to - place)
    :precondition (and
      (agent-ready ?a)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      ; the moved disk remains clear (nothing on top of it) so we keep (clear ?d) true.
    )
  )
)