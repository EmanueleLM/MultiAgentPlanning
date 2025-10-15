; ===========================
; Problem instances for the two scenarios described by the 'player' and 'observer' analyses.
; We provide two separate problem definitions (scenario-player and scenario-observer)
; within this section. FastDownward normally consumes one problem at a time; the two
; instances below are provided so both situations are captured exactly as in the reports.
; Any missing information (not present in the reports) is NOT invented; instead noted below.
; ===========================

; Assumptions / notes (explicit, not added to initial states):
; - No "vase" facts were present initially in either scenario unless listed below.
; - Actions that require vase(... ) must create it via sip or clip before tightfisted or paltry.
; - All object identities are as listed; no other objects exist.
; - Temporal preferences referenced in the reports were treated as hard constraints, but no explicit time windows were provided, so no temporal modeling is encoded in these classical STRIPS problems.
; - These are classical STRIPS problems; no fluents, durations, or temporal constructs are encoded.
; - If a plan in the report presumes facts not present in the initial state or not produced by preceding actions, that represents a plan failure (will be visible when planning).

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Problem instance corresponding to the 'player' report (Goal: next object_11 object_10)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (problem scenario-player)
  (:domain objects-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - obj
  )

  (:init
    ; unary predicates
    (cats object_0)
    (hand object_11)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_8)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ; collect facts
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ; next relations (player initial state)
    (next object_0 object_8)
    (next object_11 object_6)
    (next object_3 object_7)
    (next object_4 object_8)
  )

  (:goal (and
    (next object_11 object_10)
  ))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Notes about scenario-player:
; - The provided proposed plan (in the player report) is:
;   1 wretched object_3 object_7 object_6 object_1
;   2 clip object_11 object_3 object_6
;   3 wretched object_3 object_6 object_5 object_1
;   4 tightfisted object_11 object_3 object_5
;   5 memory object_0 object_8 object_5
;   6 sip object_11 object_0 object_5
;   7 memory object_0 object_5 object_8
;   8 paltry object_11 object_0 object_8
;   9 clip object_11 object_4 object_8
;   10 wretched object_4 object_8 object_10 object_2
;   11 tightfisted object_11 object_4 object_10
;
; - Checking preconditions against the initial state:
;   * Step 1 (wretched object_3 object_7 object_6 object_1):
;       Requires sneeze object_3 (present),
;                texture object_7 (present),
;                texture object_6 (present),
;                stupendous object_1 (present),
;                next object_3 object_7 (present),
;                collect object_7 object_1 (present),
;                collect object_6 object_1 (present).
;       => All preconditions satisfied. Effects: add next object_3 object_6; delete next object_3 object_7.
;   * Step 2 (clip object_11 object_3 object_6):
;       Requires hand object_11 (present),
;                sneeze object_3 (present),
;                texture object_6 (present),
;                next object_3 object_6 (now present after step1),
;                next object_11 object_6 (present initially).
;       => All preconditions satisfied. Effects: add vase object_11 object_3; delete next object_11 object_6.
;   * Step 3 (wretched object_3 object_6 object_5 object_1):
;       Requires sneeze object_3 (present),
;                texture object_6 (present),
;                texture object_5 (present),
;                stupendous object_1 (present),
;                next object_3 object_6 (present because step1 added it and step2 did not delete it),
;                collect object_6 object_1 (present),
;                collect object_5 object_1 (present).
;       => All preconditions satisfied. Effects: add next object_3 object_5; delete next object_3 object_6.
;   * Step 4 (tightfisted object_11 object_3 object_5):
;       Requires hand object_11 (present),
;                sneeze object_3 (present),
;                texture object_5 (present),
;                next object_3 object_5 (present after step3),
;                vase object_11 object_3 (created by step2).
;       => All preconditions satisfied. Effects: add next object_11 object_5; delete vase object_11 object_3.
;   * Step 5 (memory object_0 object_8 object_5):
;       Requires cats object_0 (present),
;                spring object_8 (present),
;                spring object_5 (present),
;                next object_0 object_8 (present initially).
;       => All preconditions satisfied. Effects: add next object_0 object_5; delete next object_0 object_8.
;   * Step 6 (sip object_11 object_0 object_5):
;       Requires hand object_11 (present),
;                cats object_0 (present),
;                texture object_5 (present),
;                next object_11 object_5 (present after step4),
;                next object_0 object_5 (present after step5).
;       => All preconditions satisfied. Effects: add vase object_11 object_0; delete next object_11 object_5.
;   * Step 7 (memory object_0 object_5 object_8):
;       Requires cats object_0 (present),
;                spring object_5 (present),
;                spring object_8 (present),
;                next object_0 object_5 (present after step5).
;       => All preconditions satisfied. Effects: add next object_0 object_8; delete next object_0 object_5.
;   * Step 8 (paltry object_11 object_0 object_8):
;       Requires hand object_11 (present),
;                cats object_0 (present),
;                texture object_8 (present),
;                vase object_11 object_0 (created by step6),
;                next object_0 object_8 (present after step7).
;       => All preconditions satisfied. Effects: add next object_11 object_8; delete vase object_11 object_0.
;   * Step 9 (clip object_11 object_4 object_8):
;       Requires hand object_11 (present),
;                sneeze object_4 (present),
;                texture object_8 (present),
;                next object_4 object_8 (present initially),
;                next object_11 object_8 (present after step8).
;       => All preconditions satisfied. Effects: add vase object_11 object_4; delete next object_11 object_8.
;   * Step 10 (wretched object_4 object_8 object_10 object_2):
;       Requires sneeze object_4 (present),
;                texture object_8 (present),
;                texture object_10 (present),
;                stupendous object_2 (present),
;                next object_4 object_8 (present initially and not deleted by earlier steps),
;                collect object_8 object_2 (present),
;                collect object_10 object_2 (present).
;       => All preconditions satisfied. Effects: add next object_4 object_10; delete next object_4 object_8.
;   * Step 11 (tightfisted object_11 object_4 object_10):
;       Requires hand object_11 (present),
;                sneeze object_4 (present),
;                texture object_10 (present),
;                next object_4 object_10 (present after step10),
;                vase object_11 object_4 (created by step9).
;       => All preconditions satisfied. Effects: add next object_11 object_10; delete vase object_11 object_4.
;
; - Conclusion for scenario-player:
;   All preconditions for each action in the proposed plan are satisfied given the initial state
;   and the effects of preceding actions. The final action (step 11 tightfisted object_11 object_4 object_10)
;   produces the goal (next object_11 object_10). Therefore the proposed plan is valid under the
;   provided public schemas and the player's initial conditions.
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Problem instance corresponding to the 'observer' report (Goal: next object_11 object_9)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (problem scenario-observer)
  (:domain objects-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - obj
  )

  (:init
    ; unary predicates
    (cats object_0)
    (hand object_11)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_8)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ; collect facts
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ; next relations (observer initial state)
    (next object_0 object_5)
    (next object_11 object_8)
    (next object_3 object_5)
    (next object_4 object_10)
  )

  (:goal (and
    (next object_11 object_9)
  ))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Notes about scenario-observer (concise guidance for achieving next object_11 object_9):
; - Goal: next object_11 object_9 must be produced by one of the domain actions that add a (next ?x ?y).
; - Actions that can add next X Y: paltry, wretched, memory, tightfisted.
; - Candidate approach 1 (using wretched): Use wretched with OBJ0 = object_11 and OBJ2 = object_9:
;     wretched object_11 ?a object_9 ?b requires:
;       sneeze object_11 (NOT present) -> fails. So wretched cannot be used with object_11 as OBJ0 unless sneeze object_11 is true.
; - Candidate approach 2 (using tightfisted): tightfisted OBJ0 OBJ1 OBJ2 adds next OBJ0 OBJ2 but requires vase OBJ0 OBJ1 and next OBJ1 OBJ2.
;     For target next object_11 object_9, choose OBJ0 = object_11, OBJ2 = object_9, need some OBJ1 with
;       (vase object_11 OBJ1) and (next OBJ1 object_9) and sneeze OBJ1 and texture object_9.
;     * texture object_9 is present in initial state.
;     * We need next OBJ1 object_9; currently no next ... object_9 is present. So we must first create a next ? ? object_9.
; - Candidate approach 3 (memory): memory object_11 ?a object_9 requires cats object_11 (NOT present) -> fails.
; - Candidate approach 4 (paltry): paltry requires vase object_11 OBJ1 and next OBJ1 object_9 and cats OBJ1; similar vase+next need.
; - Practical sequence to get next object_11 object_9 given initial facts:
;     1) Create next U object_9 for some U that satisfies required collects/stupendous if using wretched, or as OBJ1 for tightfisted/paltry.
;     2) Create a vase object_11 U by using clip or sip:
;         - clip object_11 U object_9 requires next U object_9 and next object_11 object_9 (circular) -> cannot create vase that way because clip requires next object_11 object_9 (the very goal).
;         - sip object_11 U object_9 requires next object_11 object_9 and next U object_9 -> also circular.
;       Therefore clip/sip cannot create vase object_11 U unless next object_11 object_9 already exists.
; - Therefore the only non-circular path is to produce next object_11 object_9 directly via an action that does not require next object_11 object_9 in its preconditions.
;   Candidates: memory, wretched, tightfisted, paltry — but all either need vase object_11 U, or sneeze object_11 (wretched), or cats U + vase (paltry), or cats object_11 for memory.
; - Given initial facts, object_11 lacks sneeze and cats. There is no vase involving object_11 initially.
; - Conclusion for scenario-observer:
;   With the provided initial state, there is no available action whose preconditions are satisfied that will directly add (next object_11 object_9). Creating the needed vase (vase object_11 ?x) via clip or sip requires (next object_11 object_9) already or circular preconditions. Likewise, wretched would require sneeze object_11, and memory would require cats object_11. Since these facts are not present and no action produces cats or sneeze for object_11, the goal (next object_11 object_9) is unreachable under the given initial conditions and the public action schemas.
;
; Suggested minimal changes (not applied here):
; - If sneeze object_11 were added initially, wretched object_11 ?a object_9 ?b could potentially produce next object_11 object_9 (provided other prereqs are satisfied).
; - If next X object_9 were created for some X with available means, then creating vase object_11 X could be possible, but current clip/sip require next object_11 object_9 and so are circular.
;
; End of file.