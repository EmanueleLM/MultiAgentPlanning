(define (domain hanoi-cooperative)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place
          step agent)
  (:predicates
    (on ?d - disk ?p - place)            ; disk d is directly on place p (peg or disk)
    (clear ?p - place)                  ; place (peg or disk) has nothing on top
    (smaller ?d1 - disk ?d2 - disk)     ; d1 is smaller than d2 (static)
    (permits ?ag - agent ?d - disk)     ; agent is permitted to move disk
    (phase ?s - step)                   ; current phase/step marker
    (next ?s1 - step ?s2 - step)        ; static chain of steps
    (allowed-move ?s - step ?d - disk ?from - place ?to - place) ; step s requires moving d from->to
  )

  ; Agent-specific move actions. Each action advances the phase chain.
  (:action move-agent1
    :parameters (?d - disk ?from - place ?to - place ?s - step ?s2 - step)
    :precondition (and
      (phase ?s)
      (next ?s ?s2)
      (allowed-move ?s ?d ?from ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (permits agent1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (phase ?s))
      (phase ?s2)
    )
  )

  (:action move-agent2
    :parameters (?d - disk ?from - place ?to - place ?s - step ?s2 - step)
    :precondition (and
      (phase ?s)
      (next ?s ?s2)
      (allowed-move ?s ?d ?from ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (permits agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (phase ?s))
      (phase ?s2)
    )
  )
)