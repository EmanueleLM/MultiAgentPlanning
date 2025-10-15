(define (problem multi_agent_problem)
  (:domain multi_agent_domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13
  )

  ;; Initial predicates: union of initial facts provided by agent_one and agent_two
  (:init
    ;; cats
    (cats object_0)

    ;; hand
    (hand object_11)
    (hand object_12)
    (hand object_13)

    ;; sneeze
    (sneeze object_3)
    (sneeze object_4)

    ;; spring
    (spring object_5)
    (spring object_8)

    ;; stupendous
    (stupendous object_1)
    (stupendous object_2)

    ;; texture
    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; collect relations (from both agents; identical)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ;; next relations (union of both agents' initial next facts)
    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_6)
    (next object_13 object_9)
    (next object_3 object_7)
    (next object_4 object_10)

    (next object_12 object_7)
    (next object_13 object_7)
    (next object_3 object_6)
    (next object_4 object_9)
  )

  ;; Goals: combine agent_one and agent_two goals (unique atoms)
  ;; Agent one goal atoms: next object_11 object_8, next object_12 object_8, next object_13 object_10
  ;; Agent two goal atoms: next object_11 object_5, next object_12 object_9, next object_13 object_10
  ;; Combined goal is a conjunction of the unique requested atoms.
  (:goal
    (and
      (next object_11 object_8)
      (next object_12 object_8)
      (next object_13 object_10)
      (next object_11 object_5)
      (next object_12 object_9)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Assumptions and notes (explicit, as required):
  ; 1) The initial state is exactly the union of facts provided by agent_one and
  ;    agent_two. No additional facts were invented.
  ;
  ; 2) There are no (vase ...) facts in the initial state. Several actions
  ;    (paltry, tightfisted) require (vase ?x ?y) as a precondition; these
  ;    actions are therefore not initially applicable until a vase fact is
  ;    produced (for example via clip or sip, which add vase facts).
  ;
  ; 3) The proposed detailed plan supplied by agent_one was NOT incorporated as
  ;    initial facts. Many of its steps are potentially applicable given the
  ;    initial union above (e.g., clip object_11 object_4 object_10 is applicable
  ;    initially because its preconditions are present). Other steps depend on
  ;    facts produced by previous steps (e.g., vase facts) and are therefore
  ;    sequentially derivable if the planner can produce intermediate effects.
  ;
  ; 4) No temporal or durative constructs were introduced. Natural-language
  ;    preferences were treated as hard constraints by keeping the initial
  ;    unavailable/busy intervals out of the initial state (none were given as
  ;    explicit facts here). The planner must respect STRIPS semantics only.
  ;
  ; 5) Because we did not add any facts beyond the provided union, it is possible
  ;    that the combined goals are not simultaneously achievable. If a user
  ;    requires the problem to be solvable by Fast Downward according to the
  ;    agent_one proposed plan, then specific vase facts or intermediate next
  ;    facts used by that plan need to exist only as consequences of earlier
  ;    actions (which the planner may produce) — no extra initial predicates
  ;    were added to force solvability.
  ;
  ; 6) If you want us to allow the planner to start with particular vase facts
  ;    (to match agent_one's plan exactly), specify which (vase ?x ?y) atoms
  ;    to add to the initial state. We avoided doing so to remain faithful to
  ;    "Do not assume missing facts."
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
)