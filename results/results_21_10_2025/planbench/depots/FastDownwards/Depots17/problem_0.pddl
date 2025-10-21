; Assumptions:
; - Two agents (agent1, agent2), three locations (locA, locB, locC) and two packages (pkg1, pkg2).
; - Connections are bidirectional and explicitly listed as ground (connected) facts.
; - No agent holds any package in the initial state.
; - All natural-language preferences from analyses were treated as hard constraints (e.g., required handovers are encoded as actions if needed).
; - If any additional constraints were implied by the analyses (timing, earliest, or soft preferences), they have been represented as strict precondition/effect constraints where applicable.
(define (problem deliver-packages)
  (:domain multiagent-delivery)
  (:objects
    agent1 agent2 - agent
    pkg1 pkg2 - package
    locA locB locC - location
  )
  (:init
    ;; agent locations
    (at agent1 locA)
    (at agent2 locC)

    ;; package locations (not held)
    (at_obj pkg1 locA)
    (at_obj pkg2 locB)

    ;; connectivity (bidirectional)
    (connected locA locB)
    (connected locB locA)
    (connected locB locC)
    (connected locC locB)
  )

  (:goal (and
    ;; delivery goals: pkg1 must be at locC, pkg2 must be at locA
    (at_obj pkg1 locC)
    (at_obj pkg2 locA)
  ))
)