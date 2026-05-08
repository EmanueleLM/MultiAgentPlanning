(define (problem scheduling-problem)
  (:domain scheduling-domain)

  ; NOTE: The inputs (candidate schedules, audited corrections, agent preferences, availabilities)
  ; required to fully ground this scheduling task were not provided by the user.
  ; To keep the specification explicit and solver-ready while not inventing real-world availability,
  ; this problem uses an explicit discrete timeline of 8 contiguous 15-minute slots (s1..s8).
  ; The 75-minute requirement for William is modeled here as at least five contiguous slots
  ; (5 * 15min = 75min). If your real input uses a different slot granularity or different
  ; slot counts/availability, replace the slot objects and initial availability facts accordingly.
  (:objects
    orchestrator - agent
    william personA personB - person
    s1 s2 s3 s4 s5 s6 s7 s8 - slot
  )

  (:init
    ; All slots start free (no assignment). Replace or restrict by adding/removing (slot-free ...) facts
    ; if some slots are known unavailable before planning.
    (slot-free s1)
    (slot-free s2)
    (slot-free s3)
    (slot-free s4)
    (slot-free s5)
    (slot-free s6)
    (slot-free s7)
    (slot-free s8)

    ; Define successor (contiguity) relation for the discrete timeline.
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)

    ; Initial total-cost (must be declared in init for planners that expect it).
    (= (total-cost) 0)

    ; COMMENTS / PLACEHOLDERS:
    ; - Candidate schedules, audited corrections, and explicit participant availability were not provided.
    ;   To enforce those hard constraints, add ground facts of the form (slot-free sX) = false
    ;   (i.e., omit (slot-free sX)) for slots that are unavailable, or add additional constraints
    ;   (for example extra predicates and preconditions) and adjust actions accordingly.
    ; - All natural-language preferences (earliest, at-most, avoid, would-rather) must be encoded
    ;   explicitly as facts and action preconditions. Because those statements were not present
    ;   in machine-readable form here, they are not invented. Please provide them to have them enforced.
  )

  ; The goal enforces the hard constraint: William must be met for at least 75 contiguous minutes
  ; (here encoded as a contiguous block of five slots assigned to william and then registered).
  ; The planner objective (below) will prefer schedules that assign more slots overall (maximize meetings).
  (:goal (william-satisfied))

  ; Optimization: minimize total-cost. Because scheduling a slot decreases total-cost by 1,
  ; minimizing total-cost causes the planner to prefer schedules that schedule as many slots as possible.
  ; This is used here to "maximize meetings overall" as requested.
  (:metric minimize (total-cost))
)