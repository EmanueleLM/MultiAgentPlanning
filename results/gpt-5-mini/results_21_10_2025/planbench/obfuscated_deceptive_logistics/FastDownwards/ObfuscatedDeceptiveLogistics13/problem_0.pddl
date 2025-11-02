(define (problem orchestrated-problem)
  (:domain orchestrated-domain)

  ;; Assumptions (conservative, added because no analyst initial conditions or explicit goal were provided):
  ;; 1) We assume one collector agent (alice) and one other agent (bob).
  ;; 2) A vase object (vase1) and a cup (cup1) are initially at table_loc and available.
  ;; 3) The final objective chosen (in absence of an explicit user statement) is:
  ;;      alice must remember vase1 (memory action applied) AND be located at spring_loc,
  ;;    which implies paltry -> memory -> move sequence is feasible.
  ;; These assumptions are explicit here to reconcile missing analyst inputs.

  (:objects
    alice bob - agent
    vase1 cup1 coin1 - object
    cat1 - cat
    dusty smooth - texture
    table_loc spring_loc - location
  )

  (:init
    ;; agents locations
    (at alice table_loc)
    (at bob spring_loc)

    ;; object locations and availability
    (at vase1 table_loc)
    (at cup1 table_loc)
    (available vase1)
    (available cup1)

    ;; object types / attributes
    (vase vase1)
    (texture cup1 dusty)
    (texture vase1 smooth)

    ;; a cat present and environment spring
    (cats cat1)
    (spring spring_loc)

    ;; adjacency
    (next table_loc spring_loc)
    (next spring_loc table_loc)
  )

  ;; Goal: alice remembers vase1 (memory applied -> also marks stupendous) and alice is at spring_loc.
  (:goal (and
           (remembered alice vase1)
           (stupendous vase1)
           (at alice spring_loc)
         )
  )
)