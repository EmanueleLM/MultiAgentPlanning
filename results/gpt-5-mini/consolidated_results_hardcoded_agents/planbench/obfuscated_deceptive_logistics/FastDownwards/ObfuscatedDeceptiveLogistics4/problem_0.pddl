(define (problem arrange-next-object9-object8)
  (:domain object-sequencing)
  (:objects
    worker - agent
    object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 - object
    p1 p2 p3 p4 p5 p6 p7 p8 p9 - pos
  )

  (:init
    ; Agent initial state
    (agent-at worker p9)
    (empty-hand worker)

    ; Positions successor (ordered left -> right)
    (succ p1 p2) (succ p2 p3) (succ p3 p4) (succ p4 p5) (succ p5 p6) (succ p6 p7) (succ p7 p8) (succ p8 p9)

    ; Objects initial locations
    (at object_1 p1)
    (at object_9 p2)
    (at object_2 p3)
    (at object_3 p4)
    (at object_8 p5)
    (at object_4 p6)
    (at object_5 p7)
    (at object_6 p8)
    ; p9 is initially free
    (free p9)

    ; Initial adjacency facts (next) inferred from positions. These are explicit and must be maintained by actions.
    ;; succ p1 p2 => object at p2 (object_9) is successor of object at p1 (object_1)
    (next object_9 object_1)
    ;; succ p2 p3 => object at p3 (object_2) is successor of object at p2 (object_9)
    (next object_2 object_9)
    ;; succ p3 p4 => object at p4 (object_3) is successor of object at p3 (object_2)
    (next object_3 object_2)
    ;; succ p4 p5 => object at p5 (object_8) is successor of object at p4 (object_3)
    (next object_8 object_3)
    ;; succ p5 p6 => object at p6 (object_4) is successor of object at p5 (object_8)
    (next object_4 object_8)
    ;; succ p6 p7 => object at p7 (object_5) is successor of object at p6 (object_4)
    (next object_5 object_4)
    ;; succ p7 p8 => object at p8 (object_6) is successor of object at p7 (object_5)
    (next object_6 object_5)
    ;; succ p8 p9 => no object at p9, so no next fact for p9 initially
  )

  (:goal
    (and
      ;; The terminal condition mandated by the specification:
      (next object_9 object_8)

      ;; Also ensure that these two objects occupy adjacent positions consistent with successor relation.
      ;; This enforces a consistent terminal configuration: object_8 must be directly left of object_9.
      ;; We express it concretely by requiring object_8 at some position pX and object_9 at its successor pY.
      ;; Since PDDL goals must be ground, we include the concrete expected positions that will be achieved
      ;; by valid plans constructed under the domain model. The planner will produce a plan that results in
      ;; object_8 at p5 and object_9 at p6 (one valid resolved final placement consistent with initial data).
      (at object_8 p5)
      (at object_9 p6)
      (succ p5 p6)
    )
  )
)