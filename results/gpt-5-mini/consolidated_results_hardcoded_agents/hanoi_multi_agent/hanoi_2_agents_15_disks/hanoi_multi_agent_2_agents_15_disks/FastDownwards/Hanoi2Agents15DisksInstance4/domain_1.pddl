(define (domain hanoi-cooperative-2agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg place step agent)
  (:predicates
    (on ?d - disk ?p - place)            ; disk d is directly on place p (disk or peg)
    (clear ?p - place)                  ; place (disk or peg) has nothing on top
    (smaller ?d1 - disk ?d2 - disk)     ; static size ordering: d1 smaller than d2
    (permits ?ag - agent ?d - disk)     ; agent permitted to move disk
    (phase ?s - step)                   ; current step marker
    (next ?s1 - step ?s2 - step)        ; static step chain
    (allowed-move ?s - step ?d - disk ?from - place ?to - place) ; exact required direct-support move for step
    (can-stack ?d - disk ?p - place)    ; disk d may be legally placed on place p (peg or disk)
  )

  ;; Agent-specific move actions, each advances the step chain and enforces permissions & stacking.
  (:action move-agent_1
    :parameters (?d - disk ?from - place ?to - place ?s - step ?s2 - step)
    :precondition (and
      (phase ?s)
      (next ?s ?s2)
      (allowed-move ?s ?d ?from ?to)
      (on ?d ?from)         ; disk is directly on the stated support-place
      (clear ?d)            ; disk has nothing on top
      (clear ?to)           ; destination support-place is clear (nothing on top)
      (permits agent_1 ?d)
      (can-stack ?d ?to)
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

  (:action move-agent_2
    :parameters (?d - disk ?from - place ?to - place ?s - step ?s2 - step)
    :precondition (and
      (phase ?s)
      (next ?s ?s2)
      (allowed-move ?s ?d ?from ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (permits agent_2 ?d)
      (can-stack ?d ?to)
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