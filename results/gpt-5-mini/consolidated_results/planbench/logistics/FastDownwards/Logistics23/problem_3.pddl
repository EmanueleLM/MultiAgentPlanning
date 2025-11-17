(define (problem Logistics23_problem_fragment1_staged)
  (:domain Logistics23)

  (:objects
    object_1 object_2 object_3 object_4 object_6 object_7 object_8 object_10 object_11 object_12 - obj
    stage_0 stage_1 stage_2 stage_3 - stage
  )

  (:init
    ; hands
    (hand object_11)
    (hand object_12)

    ; cats
    (cats object_0) ; preserved from original fragment description though not referenced in this fragment plan
    ; (object_0 included as a fact in the human fragment; kept as public fact for fidelity)

    ; sneezes
    (sneeze object_3)
    (sneeze object_4)

    ; textures
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_10)

    ; stupendous
    (stupendous object_1)
    (stupendous object_2)

    ; collect relations
    (collect object_10 object_2)
    (collect object_8 object_2)
    (collect object_7 object_1)
    (collect object_6 object_1)

    ; next relations consistent with initial stages
    (next object_12 object_10)
    (next object_4 object_10)
    (next object_11 object_6)
    (next object_3 object_7)

    ; stage successor chain
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)

    ; at-stage assignments chosen to enforce contiguous occupancy and match next(X,Y) meaning:
    ; next(X,Y) holds when X is at stage S and Y at successor stage S+1
    (at-stage object_12 stage_0)
    (at-stage object_4 stage_0)
    (at-stage object_11 stage_0)
    (at-stage object_3 stage_0)

    (at-stage object_10 stage_1)
    (at-stage object_6 stage_1)
    (at-stage object_7 stage_1)

    ; targets (some targets already one stage further, e.g., object_8 is used as stage_2 target)
    (at-stage object_8 stage_2)
  )

  (:goal
    (and
      (next object_11 object_7)
      (next object_12 object_8)
    )
  )
)