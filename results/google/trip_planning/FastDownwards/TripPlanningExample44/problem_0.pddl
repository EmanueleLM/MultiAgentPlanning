(define (problem travel-multiagent-problem)
  (:domain travel-multiagent)

  ;---------------------------------------------------------
  ; Notes / assumptions (human-readable comments)
  ; 1) Public requirements: total trip length is 17 days, only direct flights allowed.
  ; 2) Desired stays: Rome 6 days, Lyon 6 days, Zurich 7 days.
  ; 3) Sum of desired stays = 6 + 6 + 7 = 19, which exceeds total trip length 17.
  ;    This is a contradiction / over-subscription of hard constraints. The PDDL encoding below
  ;    enforces the stay-cardinalities as hard constraints; as a result the problem is unsolvable.
  ; 4) Direct flights available (public): Rome <-> Lyon, Rome <-> Zurich. No direct Lyon<->Zurich.
  ; 5) We model days as d1..d18; current-day d1 initially; goal requires current-day d18 to force 17 day-assignments.
  ; 6) Tokens represent required per-day quotas; each time a city is assigned to a day a corresponding city-token is consumed.
  ;    Goal requires all tokens to be consumed to meet exact stay durations.
  ;---------------------------------------------------------

  (:objects
    ; cities
    rome lyon zurich - city

    ; days d1..d18 (we progress from d1 to d18; reaching d18 means 17 days assigned)
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 - day

    ; tokens: r1..r6 for Rome (6 days), l1..l6 for Lyon (6 days), z1..z7 for Zurich (7 days)
    r1 r2 r3 r4 r5 r6 l1 l2 l3 l4 l5 l6 z1 z2 z3 z4 z5 z6 z7 - token
  )

  (:init
    ; day progression relation
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)
    (next d11 d12) (next d12 d13) (next d13 d14) (next d14 d15) (next d15 d16)
    (next d16 d17) (next d17 d18)

    ; start day
    (current-day d1)

    ; allowed moves: same-city stays and direct flights only
    ; stays
    (can-move rome rome) (can-move lyon lyon) (can-move zurich zurich)
    ; direct flights as given publicly
    (can-move rome lyon) (can-move lyon rome)
    (can-move rome zurich) (can-move zurich rome)
    ; Note: no can-move lyon zurich or zurich lyon facts (no direct flight)

    ; wedding window days (Zurich wedding must be attended on some day in d1..d7)
    (wedding-window d1) (wedding-window d2) (wedding-window d3)
    (wedding-window d4) (wedding-window d5) (wedding-window d6)
    (wedding-window d7)

    ; token-of mapping
    (token-of r1 rome) (token-of r2 rome) (token-of r3 rome)
    (token-of r4 rome) (token-of r5 rome) (token-of r6 rome)

    (token-of l1 lyon) (token-of l2 lyon) (token-of l3 lyon)
    (token-of l4 lyon) (token-of l5 lyon) (token-of l6 lyon)

    (token-of z1 zurich) (token-of z2 zurich) (token-of z3 zurich)
    (token-of z4 zurich) (token-of z5 zurich) (token-of z6 zurich) (token-of z7 zurich)

    ; all tokens initially available (these enforce at-most constraints: once consumed they cannot be used again)
    (available r1) (available r2) (available r3) (available r4) (available r5) (available r6)
    (available l1) (available l2) (available l3) (available l4) (available l5) (available l6)
    (available z1) (available z2) (available z3) (available z4) (available z5) (available z6) (available z7)
  )

  ; Goal:
  ; - progress through all 17 days: current-day d18
  ; - consume all city tokens so that exact stays are enforced (rome 6, lyon 6, zurich 7)
  ; - wedding-attended must be true (Zurich visit on day 1..7)
  ; Because the sum of required tokens is 19 but only 17 days exist, this goal is intentionally unsatisfiable;
  ; this flags the contradiction in the hard constraints rather than silently shortening stays.
  (:goal (and
    (current-day d18)
    (consumed r1) (consumed r2) (consumed r3) (consumed r4) (consumed r5) (consumed r6)
    (consumed l1) (consumed l2) (consumed l3) (consumed l4) (consumed l5) (consumed l6)
    (consumed z1) (consumed z2) (consumed z3) (consumed z4) (consumed z5) (consumed z6) (consumed z7)
    (wedding-attended)
  ))

  ; Assumptions/comments for the solver user:
  ; - This explicit encoding enforces exact counts by token consumption.
  ; - Because 6+6+7 = 19 required city-days but trip length is 17, the goals are inconsistent.
  ; - The planner should therefore report unsolvable / no plan. This is intended to flag the over-subscription.
)