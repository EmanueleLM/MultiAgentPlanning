; Instance metadata / unification choices (human-readable comments):
; - Object naming: I unify the example names into explicit, lowercase PDDL object identifiers:
;     manipulator_B -> manipulator_b (type agent)
;     catA           -> cat_a         (type cat)
;     texX           -> tex_x         (type texture)
;     vaseV          -> vase_v        (type vase)
;     springP        -> spring_p      (type spring)
;     A              -> a1            (type obj)
;     B              -> b1            (type obj)
;     C              -> c1            (type obj)
;     D              -> d1            (type obj)
; - These choices fix the concrete objects required by the plan template provided in the prompt.
; - Initial state contains a seed next(a1,b1) so actions that require an existing next(...) are applicable.
; - The goal is the conjunction: next(b1,c1) AND next(c1,d1).
; - No additional resources, predicates or hidden tokens are introduced.

(define (problem multiagent-instance1)
  (:domain multiagent-domain)

  (:objects
    manipulator_b - agent
    cat_a         - cat
    tex_x         - texture
    vase_v        - vase
    spring_p      - spring
    a1 b1 c1 d1   - obj
  )

  (:init
    ; basic available resources / predicates
    (hand manipulator_b)
    (cats cat_a)
    (texture tex_x)
    (vase vase_v)
    (spring spring_p)

    ; seed next relation required by many schemas to break circularity
    (next a1 b1)

    ; Note: sneeze / collect / stupendous are intentionally NOT true in this initial state.
    ; This ensures only actions whose preconditions are satisfied can run.
  )

  (:goal
    (and
      (next b1 c1)
      (next c1 d1)
    )
  )
)